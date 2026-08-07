#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

USAGE="
$0 - PERF-542, test semisync replication performance

Usage: $0 [options]

Options:
    --mariadb-tarball   tarball to be used for MariaDB installation
    --debug
    --sofia
    --repeats
"

COMMAND_LINE="$@"

unset DEBUG
unset SOFIA

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --mariadb-tarball)    MARIADB_TARBALL="$1"; shift;;
        --debug)              DEBUG=1;;
        --sofia)              SOFIA=1;; # run in sofia pseudo-cloud
        --repeats)            REPEATS="$1"; shift;;
        -h|--help)            error -e "$USAGE";;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


source ${CBENCH_HOME}/bin/cbench.sh

# defaults
[[ ${CLUSTER} ]] || CLUSTER='perf-542'
[[ ${WORKLOADS} ]] || WORKLOADS=( oltp_read_write oltp_write_only oltp_update_index2 )
[[ ${MAXSCALE_WORKLOADS} ]] || MAXSCALE_WORKLOADS=( 9010_splittable 7525_splittable 5050_splittable )

# special handling of Sofia pseudo cloud
if [[ ${SOFIA} ]] ; then
    TEST_NAME="perf-542-sofia"
    cp properties/g1.properties properties/${CLUSTER}-server-1.properties
    cp properties/g2.properties properties/${CLUSTER}-server-2.properties
    cp properties/g3.properties properties/${CLUSTER}-maxscale-1.properties
    cp properties/g4.properties properties/${CLUSTER}-driver-1.properties
    [[ ${REPEATS} ]] || REPEATS=1
    # the goal is to have slave threads = 3 x nCPU
    [[ ${OPTION_SLAVE_THREADS} ]] || OPTION_SLAVE_THREADS=36
else
    # if not run in Sofia, use GCP
    source ${CBENCH_HOME}/config/gcp.conf
    [[ ${SERVER_TYPE} ]] || SERVER_TYPE="n2-standard-16"
    [[ ${DRIVER_TYPE} ]] || DRIVER_TYPE="n2-highcpu-8"
    [[ ${REPEATS} ]] || REPEATS=3
    # the goal is to have slave threads = 3 x nCPU
    [[ ${OPTION_SLAVE_THREADS} ]] || OPTION_SLAVE_THREADS=48
fi


#===== functions =======================================================
exec() {
    if [[ ${DEBUG} ]] ; then
        echo $*
    else
        $*
    fi
}
#===== end functions ===================================================


[[ ${TEST_NAME} ]] || TEST_NAME="perf-542"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --collocate --parallel"
    COMMAND="${COMMAND} --server-nodes 2 --server-type ${SERVER_TYPE}"
    COMMAND="${COMMAND} --driver-nodes 1 --driver-type ${DRIVER_TYPE}"
    COMMAND="${COMMAND} --maxscale-nodes 1 --maxscale-type ${SERVER_TYPE}"

    [[ ${SOFIA} ]] || {
        exec ${COMMAND}
        SYSTEMS=( $(get_property ${CLUSTER} systems) )
        echo
        echo "SYSTEMS = ${SYSTEMS[*]}"
        (( ${#SYSTEMS[*]} != 4 )) && error "unable to allocate nodes."
    }

    COMMAND="configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb_replication"
    COMMAND="${COMMAND} --master-system ${CLUSTER}-server-1 --slave-system ${CLUSTER}-server-2"
    COMMAND="${COMMAND} --driver-system ${CLUSTER}-driver-1 --maxscale-system ${CLUSTER}-maxscale-1"
    exec ${COMMAND}

    # results dir to collect data
    T=${LOGDIRECTORY}/results
    [[ -d ${T} ]] || mkdir ${T}

    for WAITPOINT in ASYNC SYNC COMMIT; do

        LOGDIRECTORY_SAVE=${LOGDIRECTORY}
        LOGDIRECTORY="${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).waitpoint=${WAITPOINT}"
        mkdir -p ${LOGDIRECTORY}

        COMMAND="build.cluster.sh --cluster ${CLUSTER} --mariadb-branch ENTERPRISE/11.8-enterprise"
        COMMAND="${COMMAND} --sync-binlog 1 --sync-relaylog 10000 --log-slave-updates"
        [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
        [[ ${OPTION_SLAVE_THREADS} ]] && COMMAND="${COMMAND} --slave-threads ${OPTION_SLAVE_THREADS}"
        case ${WAITPOINT} in
            # default is async, nothing to add for this
            SYNC)   COMMAND="${COMMAND} --semisync-replication --semisync-after-sync";;
            COMMIT) COMMAND="${COMMAND} --semisync-replication --semisync-after-commit";;
        esac
        export MAX_SLAVE_LAG="1s"
        exec ${COMMAND}
        unset MAX_SLAVE_LAG

        COMMAND="load.data.sh --cluster ${CLUSTER} --skipcheck --benchmark sysbench --bulkload"
        exec ${COMMAND}

        # slaves are behind after loading tables
        wait_for_slaves_gtid ${CLUSTER}
        [[ ${SOFIA} ]] || start.grafana.sh --cluster ${CLUSTER}

        for WORKLOAD in ${WORKLOADS[*]} ; do
            COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats ${REPEATS}"
            COMMAND="${COMMAND} -- --benchmark sysbench --workload ${WORKLOAD}"
            COMMAND="${COMMAND} --wait-for-slave-gtid --skipcheck"
            [[ ${SOFIA} ]] && COMMAND="${COMMAND} --monitor"
            exec ${COMMAND}

            # find logdir for this run and copy results
            D=$(ls -1d ${LOGDIRECTORY}/*.performance.curves | tail -1)
            cp ${D}/test.data ${T}/${WAITPOINT}.${WORKLOAD}.test.data
            F=$(ls ${D}/*.performance.curves.png | tail -1)
            cp ${F} ${T}/${WAITPOINT}.${WORKLOAD}.curves.png
        done

        for WORKLOAD in ${MAXSCALE_WORKLOADS[*]} ; do
            COMMAND="performance.curves.sh --cluster ${CLUSTER}.maxscale --repeats ${REPEATS}"
            COMMAND="${COMMAND} -- --benchmark sysbench --workload ${WORKLOAD}"
            COMMAND="${COMMAND} --wait-for-slave-gtid --skipcheck"
            [[ ${SOFIA} ]] && COMMAND="${COMMAND} --monitor"
            exec ${COMMAND}

            # find logdir for this run and copy results
            D=$(ls -1d ${LOGDIRECTORY}/*.performance.curves | tail -1)
            cp ${D}/test.data ${T}/${WAITPOINT}.${WORKLOAD}.test.data
            F=$(ls ${D}/*.performance.curves.png | tail -1)
            cp ${F} ${T}/${WAITPOINT}.${WORKLOAD}.curves.png
        done

        [[ ${SOFIA} ]] || stop.grafana.sh --cluster ${CLUSTER}
        LOGDIRECTORY=${LOGDIRECTORY_SAVE}

    done

    COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
    [[ ${SOFIA} ]] || exec ${COMMAND}

} | tee ${LOGDIRECTORY}/${TESTNAME}.log
