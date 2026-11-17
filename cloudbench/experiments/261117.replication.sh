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
    --repeats
"

COMMAND_LINE="$@"

unset DEBUG

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --mariadb-tarball)    MARIADB_TARBALL="$1"; shift;;
        --repeats)            REPEATS="$1"; shift;;
        -h|--help)            error -e "$USAGE";;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


source ${CBENCH_HOME}/bin/cbench.sh

# defaults
[[ ${CLUSTER} ]] || CLUSTER='replication'
[[ ${REPEATS} ]] || REPEATS=1
[[ ${WORKLOADS} ]] || WORKLOADS=( 9010_splittable 7525_splittable 5050_splittable )

TEST_NAME="replication"
cp properties/g1.properties properties/${CLUSTER}-server-1.properties
cp properties/g4.properties properties/${CLUSTER}-driver-1.properties

#===== functions =======================================================
exec() {
    if [[ ${DEBUG} ]] ; then
        echo $*
    else
        $*
    fi
}
#===== end functions ===================================================


[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    COMMAND="configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb"
    COMMAND="${COMMAND} --mariadb-system ${CLUSTER}-server-1 --driver-system ${CLUSTER}-driver-1"
    exec ${COMMAND}

    # results dir to collect data
    T=${LOGDIRECTORY}/results
    [[ -d ${T} ]] || mkdir ${T}

    for WHAT in PLAIN BINLOG SYNC INNODB; do

        LOGDIRECTORY_SAVE=${LOGDIRECTORY}
        LOGDIRECTORY="${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${WHAT}"
        mkdir -p ${LOGDIRECTORY}

        COMMAND="build.cluster.sh --cluster ${CLUSTER}" 
        [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
        case ${WHAT} in
            BINLOG) export OPTION_MASTER=TRUE;; 
            SYNC)   export OPTION_MASTER=TRUE; export OPTION_SYNC_BINLOG=1;;
            INNODB) export OPTION_MASTER=TRUE; export OPTION_BINLOG_IN_INNODB=1;;
        esac
        exec ${COMMAND}
        unset OPTION_MASTER OPTION_SYNC_BINLOG OPTION_BINLOG_IN_INNODB

        COMMAND="load.data.sh --cluster ${CLUSTER} --skipcheck --benchmark sysbench --bulkload"
        exec ${COMMAND}

        for WORKLOAD in ${WORKLOADS[*]} ; do
            COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats ${REPEATS}"
            COMMAND="${COMMAND} -- --benchmark sysbench --workload ${WORKLOAD}"
            COMMAND="${COMMAND} --skipcheck --skipmonitors"
            exec ${COMMAND}

            # find logdir for this run and copy results
            D=$(ls -1d ${LOGDIRECTORY}/*.performance.curves | tail -1)
            cp ${D}/test.data ${T}/${WHAT}.${WORKLOAD}.test.data
            F=$(ls ${D}/*.performance.curves.png | tail -1)
            cp ${F} ${T}/${WHAT}.${WORKLOAD}.curves.png
        done

        LOGDIRECTORY=${LOGDIRECTORY_SAVE}

    done

} | tee ${LOGDIRECTORY}/${TESTNAME}.log
