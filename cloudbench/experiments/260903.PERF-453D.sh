#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

USAGE="
$0 - PERF-453, scenario D (node recovery, SST)

Usage: $0 [options]

Options:
    --nodes             number of nodes (accepted: 3, 5, 7 - default: 3)

    --mariadb-tarball   tarball to be used for MariaDB installation
    --galera-tarball    tarball to be used for Galera installation
    --raft-tarball      tarball to be used for Raft installation

    --debug
    --galera
    --raft

    --downtime          time between reboot and rejoining the cluster
    --clean             clean the node (no InnoDB recovery)

"

COMMAND_LINE="$@"

unset DEBUG PRODUCTS OPTION_MAXSCALE


while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --nodes)              NUM_NODES="$1"; shift;;
        --collocate)          OPTION_COLLOCATE=TRUE;;

        --mariadb-tarball)    MARIADB_TARBALL="$1"; shift;;
        --galera)             PRODUCTS+=( galera );;
        --galera-tarball)     GALERA_TARBALL="$1"; shift;;
        --raft)               PRODUCTS+=( raft );;
        --raft-tarball)       RAFT_TARBALL="$1"; shift;;

        --clean)              OPTION_CLEAN=TRUE;;
        --maxscale)           OPTION_MAXSCALE=TRUE;;
        --downtime)           OPTION_DOWNTIME="$1"; shift;;
        --debug)              DEBUG=1;;

        -h|--help)            error -e "$USAGE";;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


source ${CBENCH_HOME}/bin/cbench.sh
[[ ${DEBUG} ]] || source ${CBENCH_HOME}/config/gcp.conf

[[ ${CLUSTER} ]] || CLUSTER='perf-453'
[[ ${NUM_NODES} ]] || NUM_NODES=3

[[ ${PRODUCTS[*]} ]] || PRODUCTS=( galera raft )

# time to run initially
INITIAL_TIME=180
[[ ${OPTION_DOWNTIME} ]] || OPTION_DOWNTIME=60
((RUNTIME = 600 + OPTION_DOWNTIME + INITIAL_TIME))
[[ ${OPTION_CLEAN} == TRUE ]] || OPTION_CLEAN=FALSE

[[ ${WORKLOAD} ]] || WORKLOAD="oltp_read_write"


case ${NUM_NODES} in
    3) SERVER_ARCH="n2-standard-8"
       DRIVER_ARCH="n2-highcpu-4"
       NUM_DRIVER=1
       MAXSCALE_ARCH="n2-highcpu-8"
       NUM_MAXSCALE=1
       STREAMS=24
       [[ ${OPTION_MAXSCALE} == TRUE ]] && STREAMS=36
       ;;

    5) SERVER_ARCH="n2-standard-8"
       DRIVER_ARCH="n2-highcpu-8"
       NUM_DRIVER=1
       MAXSCALE_ARCH="n2-highcpu-8"
       NUM_MAXSCALE=1
       STREAMS=48
       [[ ${OPTION_MAXSCALE} == TRUE ]] && STREAMS=60
       ;;
    7) SERVER_ARCH="n2-standard-8"
       DRIVER_ARCH="n2-highcpu-8"
       NUM_DRIVER=2
       MAXSCALE_ARCH="n2-highcpu-8"
       NUM_MAXSCALE=2
       STREAMS=96
       [[ ${OPTION_MAXSCALE} == TRUE ]] && STREAMS=112

       ;;
    *) error "illegal value of --nodes ${NUM_NODES}"
esac


#===== functions =======================================================

exec() {
    if [[ ${DEBUG} ]] ; then
        echo $*
    else
        $*
    fi
}

#===== end functions ===================================================


TEST_NAME="PERF-453D-n=${NUM_NODES}"
[[ ${OPTION_MAXSCALE} == TRUE ]] && TEST_NAME="${TEST_NAME}-mx"
if [[ ${OPTION_CLEAN} == TRUE ]] ; then
    TEST_NAME="${TEST_NAME}-clean"
else
    TEST_NAME="${TEST_NAME}-recover"
fi
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
mkdir -p ${LOGDIRECTORY}

{
    echo "===== ${TEST_NAME} started [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ====="
    echo
    echo "CLUSTER                = ${CLUSTER}"
    echo "TESTID                 = ${TESTID}"
    echo "LOGDIRECTORY           = ${LOGDIRECTORY}"
    echo
    echo "NUM_NODES              = ${NUM_NODES}"
    [[ ${MARIADB_TARBALL} ]] && echo "MARIADB_TARBALL        = ${MARIADB_TARBALL}"
    [[ ${GALERA_TARBALL} ]]  && echo "GALERA_TARBALL         = ${GALERA_TARBALL}"
    [[ ${RAFT_TARBALL} ]]    && echo "RAFT_TARBALL           = ${RAFT_TARBALL}"
    echo
    echo "Downtime               = ${OPTION_DOWNTIME}"
    echo "Testing [ ${PRODUCTS[*]} ]"
    [[ ${OPTION_CLEAN} == TRUE ]]    && echo "Cleaning failed node"
    [[ ${OPTION_MAXSCALE} == TRUE ]] && echo "Using MaxScale"
    echo

    # initialize timer variables
    declare -A BUILD_SEC LOAD_SEC SYSBENCH_SEC RECOVERY_SEC
    BUILD_SEC['galera']=0;
    BUILD_SEC['raft']=0;
    LOAD_SEC['galera']=0;
    LOAD_SEC['raft']=0;
    SYSBENCH_SEC['galera']=0;
    SYSBENCH_SEC['raft']=0;
    RECOVERY_SEC['galera']=0;
    RECOVERY_SEC['raft']=0;

    echo
    echo "=== Allocate Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --parallel"
    COMMAND="${COMMAND} --server-type ${SERVER_ARCH} --server-nodes ${NUM_NODES}"
    COMMAND="${COMMAND} --driver-type ${DRIVER_ARCH} --driver-nodes ${NUM_DRIVER}"
    if [[ ${OPTION_MAXSCALE} == TRUE ]] ; then
        COMMAND="${COMMAND} --maxscale-type ${MAXSCALE_ARCH} --maxscale-nodes ${NUM_MAXSCALE}"
    fi
    if [[ ${OPTION_COLLOCATE} == TRUE ]] ; then
        COMMAND="${COMMAND} --collocate"
    fi
    exec ${COMMAND}
    ALLOCATE_SEC=$(stop_timer)

    [[ ${DEBUG} ]] || {
        (( EXPECTED = NUM_NODES + NUM_DRIVER ))
        [[ ${OPTION_MAXSCALE} == TRUE ]] && (( EXPECTED += NUM_MAXSCALE ))
        SYSTEMS=( $(get_property ${CLUSTER} systems) )
        echo
        echo "allocated: ${SYSTEMS[*]}"
        (( ${#SYSTEMS[*]} != EXPECTED )) && error "ERROR Unable to allocate nodes"
    }

    # summary dir to collect data
    T=${LOGDIRECTORY}/summary
    [[ -d ${T} ]] || mkdir ${T}

    for PRODUCT in ${PRODUCTS[*]}; do

        # use a custom log directory for each product
        LOGDIRECTORY_BAK=${LOGDIRECTORY}
        LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${PRODUCT}.benchmark
        mkdir ${LOGDIRECTORY}

        echo
        echo "=== Configure Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
        echo
        COMMAND="configure.cluster.sh --cluster ${CLUSTER} --cluster-type ${PRODUCT}_mastermaster"
        for ((IDX=1; IDX<=NUM_NODES; IDX++ )) ; do
            COMMAND="${COMMAND} --master-system ${CLUSTER}-server-${IDX}"
        done
        for ((IDX=1; IDX<=NUM_DRIVER; IDX++ )) ; do
            COMMAND="${COMMAND} --driver-system ${CLUSTER}-driver-${IDX}"
        done
        if [[ ${OPTION_MAXSCALE} == TRUE ]] ; then
            for ((IDX=1; IDX<=NUM_MAXSCALE; IDX++ )) ; do
                COMMAND="${COMMAND} --maxscale-system ${CLUSTER}-maxscale-${IDX}"
            done
        else
            # runtime cluster: all nodes except last
            COMMAND="${COMMAND} --extra-nodemask $(( 2 ** (NUM_NODES-1) - 1 ))"
        fi
        exec ${COMMAND}

        echo
        echo "=== Build Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
        echo
        start_timer
        COMMAND="build.cluster.sh --cluster ${CLUSTER}"
        [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
        [[ ${GALERA_TARBALL} ]] && COMMAND="${COMMAND} --galera-tarball ${GALERA_TARBALL}"
        [[ ${RAFT_TARBALL} ]] && COMMAND="${COMMAND} --raft-tarball ${RAFT_TARBALL}"
        if [[ ${OPTION_MAXSCALE} == TRUE ]] ; then
            # those do not have cmdline options
            export SLAVE_SELECTION="ADAPTIVE_ROUTING"
            export MASTER_READS="true"
        fi
        exec ${COMMAND}
        BUILD_SEC[$PRODUCT]=$(stop_timer)

        echo
        echo "=== Load Data for Sysbench [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
        echo
        start_grafana
        start_timer
        COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark sysbench --load --noautoinc --skipcheck"
        exec ${COMMAND}
        LOAD_SEC[$PRODUCT]=$(stop_timer)

        # runtime cluster
        if [[ ${OPTION_MAXSCALE} == TRUE ]] ; then
            RUN_CLUSTER="${CLUSTER}.maxscale"
        else
            RUN_CLUSTER="${CLUSTER}."
            for (( IDX=1; IDX<NUM_NODES; IDX++ )) ; do RUN_CLUSTER="${RUN_CLUSTER}1"; done
            RUN_CLUSTER="${RUN_CLUSTER}0"
        fi

        echo
        echo "=== Run Sysbench Workload=${WORKLOAD} on Cluster=${RUN_CLUSTER} in background ==="
        echo

        start_timer

        # run benchmark in background
        COMMAND="sysbench.run.sh --cluster ${RUN_CLUSTER} --workload ${WORKLOAD} --duration ${RUNTIME}"
        COMMAND="${COMMAND} --totalstreams ${STREAMS} --reportinterval 5 --skipcheck"
        exec ${COMMAND} > /dev/null &
        BENCHMARK_PID=$!

        # do the fail-and-recover-node job in foreground
        {
            echo
            echo "=== Let the benchmark run undisturbed for ${INITIAL_TIME} seconds ..."
            [[ ${DEBUG} ]] || sleep ${INITIAL_TIME}

            NODE="${CLUSTER}-server-${NUM_NODES}"

            echo
            echo "=== Reset node (${NODE}) [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
            COMMAND="gcloud compute instances reset ${NODE}"
            [[ ZONE_ID ]] && COMMAND="${COMMAND} --zone=${ZONE_ID}"
            exec ${COMMAND}
            echo "and wait ${OPTION_DOWNTIME} seconds"
            [[ ${DEBUG} ]] || sleep ${OPTION_DOWNTIME}

            echo
            echo "=== Mount /data/cbench on ${NODE} [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
            [[ ${DEBUG} ]] || ssh $(get_ssh_connection ${NODE}) '
                sudo mount /dev/sdb /data/cbench
                sudo lsblk
                cd /data/cbench
                test -f swapfile && sudo swapon swapfile
            '

            if [[ ${OPTION_CLEAN} == TRUE ]] ; then
                echo
                echo "=== Clean datadir on ${NODE} [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
                [[ ${DEBUG} ]] ||ssh $(get_ssh_connection ${NODE}) '
                    cd /data/cbench
                    rm -rf datadir
                    mkdir datadir
                    export PATH=/data/cbench/install/bin:/data/cbench/install/scripts:${PATH}
                    mariadb-install-db --auth-root-authentication-method=normal
                '
            fi

            echo
            echo "=== Start MariaDB on ${NODE} [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
            [[ ${DEBUG} ]] || ssh $(get_ssh_connection ${NODE}) '
                export PATH=/data/cbench/install/bin:/data/cbench/install/scripts:${PATH}
                mariadbd-safe &
                sleep 2
            '

            (( TIMEOUT = RUNTIME - INITIAL_TIME - OPTION_DOWNTIME ))
            SUBTIMER=$(date +%s)
            echo
            echo -n "waiting for MariaDB to come online (timeout ${TIMEOUT}s) "
            [[ ${DEBUG} ]] || ssh $(get_ssh_connection ${NODE}) '
                TIMEOUT="'${TIMEOUT}'"
                export PATH=/data/cbench/install/bin:${PATH}
                while true
                do
                    mariadb-admin -S /data/cbench/mariadb.sock -u root -b -s ping && break
                    (( TIMEOUT-- <= 0 )) && break
                    echo -n "."
                    sleep 1
                done
                (( TIMEOUT > 0 ))' || TIMEOUT=0

            if (( TIMEOUT == 0 )) ; then
                echo " timed out"
                echo
                echo "=== MariaDB on ${NODE} did not come alive [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
                echo
                RECOVERY_SEC[$PRODUCT]=999
            else
                RECOVERY=$(( $(date +%s) - ${SUBTIMER} ))
                echo "time for node recovery = ${RECOVERY} seconds"
                echo
                echo "=== MariaDB on ${NODE} is alive again [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
                echo
                RECOVERY_SEC[$PRODUCT]=${RECOVERY}
            fi

        } | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).fail.and.recover.node.log 2>&1

        echo
        echo "=== waiting for background job to finish [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
        [[ ${DEBUG} ]] || wait ${BENCHMARK_PID}
        SYSBENCH_SEC[$PRODUCT]=$(stop_timer)

        echo
        echo "=== copying results [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
        D=$(ls -1d ${LOGDIRECTORY}/*.sysbench.${WORKLOAD}.run | tail -1)
        cp ${D}/test.interval.data ${T}/${PRODUCT}.${WORKLOAD}.test.interval.data
        cp ${D}/throughput.interval.png ${T}/${PRODUCT}.${WORKLOAD}.throughput.interval.png

        exec "stop.grafana.sh --cluster ${CLUSTER}" > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench.log 2>&1

        #restore LOGDIRECTORY
        LOGDIRECTORY=${LOGDIRECTORY_BAK}
    done

    echo
    echo "=== Release Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
    exec ${COMMAND}
    RELEASE_SEC=$(stop_timer)

    BUILDS_SEC=$(( ${BUILD_SEC['galera']} + ${BUILD_SEC['raft']} ))
    LOADS_SEC=$(( ${LOAD_SEC['galera']} + ${LOAD_SEC['raft']} ))
    SYSBENCHS_SEC=$(( ${SYSBENCH_SEC['galera']} + ${SYSBENCH_SEC['raft']} ))
    ((TOTAL_SEC=ALLOCATE_SEC+BUILDS_SEC+LOADS_SEC+SYSBENCHS_SEC+RELEASE_SEC))

    echo
    echo "Execution Times (minutes)"
    echo "=================================="
    perl -e "printf \"  Allocate Nodes      : %10.1f\n\", ${ALLOCATE_SEC}/60"
    perl -e "printf \"  Galera:\n\""
    perl -e "printf \"    Build Cluster     : %10.1f\n\", ${BUILD_SEC['galera']}/60"
    perl -e "printf \"    Load Sysbench     : %10.1f\n\", ${LOAD_SEC['galera']}/60"
    perl -e "printf \"    Run Sysbench      : %10.1f\n\", ${SYSBENCH_SEC['galera']}/60"
    perl -e "printf \"    Node Recovery [s] : %10.1f\n\", ${RECOVERY_SEC['galera']}"
    perl -e "printf \"  Raft:\n\""
    perl -e "printf \"    Build Cluster     : %10.1f\n\", ${BUILD_SEC['raft']}/60"
    perl -e "printf \"    Load Sysbench     : %10.1f\n\", ${LOAD_SEC['raft']}/60"
    perl -e "printf \"    Run Sysbench      : %10.1f\n\", ${SYSBENCH_SEC['raft']}/60"
    perl -e "printf \"    Node Recovery [s] : %10.1f\n\", ${RECOVERY_SEC['raft']}"
    perl -e "printf \"  Release Nodes       : %10.1f\n\", ${RELEASE_SEC}/60"
    echo "=================================="
    perl -e "printf \"TotalElapsed          : %10.1f\n\", ${TOTAL_SEC}/60"
    echo

} | tee ${LOGDIRECTORY}/${TEST_NAME}.log 2>&1
