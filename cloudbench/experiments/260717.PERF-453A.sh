#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

USAGE="
$0 - PERF-453, scenario A

Usage: $0 [options]

Options:
    --nodes             number of nodes (accepted: 3, 5, 7 - default: 3)

    --mariadb-tarball   tarball to be used for MariaDB installation
    --galera-tarball    tarball to be used for Galera installation
    --raft-tarball      tarball to be used for Raft installation
"

COMMAND_LINE="$@"

unset DEBUG
unset SOFIA

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --nodes)              NUM_NODES="$1"; shift;;
        --mariadb-tarball)    MARIADB_TARBALL="$1"; shift;;
        --galera-tarball)     GALERA_TARBALL="$1"; shift;;
        --raft-tarball)       RAFT_TARBALL="$1"; shift;;

        --debug)              DEBUG=1;;
        --sofia)              SOFIA=1;; # run in sofia pseudo-cloud

        -h|--help)            error -e "$USAGE";;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


source ${CBENCH_HOME}/bin/cbench.sh
[[ ${SOFIA} ]] || [[ ${DEBUG} ]] || source ${CBENCH_HOME}/config/gcp.conf

[[ ${CLUSTER} ]] || CLUSTER='perf-453A'

SERVER_ARCH="n2-standard-16"
[[ ${THREADS} ]] || THREADS=( 16 32 64 )

[[ ${SOFIA} ]] && THREADS=( 24 48 )

[[ ${DEBUG} ]] && {
    THREADS=( 16 )
}

[[ ${WORKLOADS} ]] || WORKLOADS=( 5050_splittable 2080_splittable readwrite )
[[ ${SOFIA} ]] && WORKLOADS=( 5050_splittable readwrite )

[[ ${LATENCIES} ]] || LATENCIES=( 5ms 10ms 20ms 40ms )
[[ ${SOFIA} ]] && LATENCIES=( 5ms 10ms )

SLEEPTIME=60
[[ ${SOFIA} ]] && SLEEPTIME=30

[[ ${DEBUG} ]] && {
    WORKLOADS=( readwrite )
    LATENCIES=( 5ms )
    SLEEPTIME=10
}

DURATION=$(( SLEEPTIME * (2 * ${#LATENCIES[*]} + 1) ))

[[ ${NUM_NODES} ]] || NUM_NODES=3
[[ ${SOFIA} ]] && NUM_NODES=3

case ${NUM_NODES} in
    3) SLOW_NODES="${CLUSTER}-server-3"
       DRIVER_ARCH="n2-highcpu-16"
       NUM_DRIVER=1
       ;;
    5) SLOW_NODES="${CLUSTER}-server-4 ${CLUSTER}-server-5"
       DRIVER_ARCH="n2-highcpu-16"
       NUM_DRIVER=2
       ;;
    7) SLOW_NODES="${CLUSTER}-server-5 ${CLUSTER}-server-6 ${CLUSTER}-server-7"
       DRIVER_ARCH="n2-highcpu-16"
       NUM_DRIVER=2
       ;;
    *) error "illegal value of NUM_NODES (${NUM_NODES})"
esac


#===== functions =======================================================

exec() {
    if [[ ${DEBUG} ]] ; then
        echo $*
    else
        $*
    fi
}

exec_no_output() {
    echo $*
    if [[ ! ${DEBUG} ]] ; then
        $* &> /dev/null
    fi
}

run_product() {
    local PRODUCT=$1

    # test uses custom LOGDIRECTORY
    local LOGDIRECTORY_BAK=${LOGDIRECTORY}
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).$PRODUCT.benchmarks
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
    for ((IDX=1; IDX<=(NUM_NODES+1)/2; IDX++ )) ; do
        ((MASK = 2**IDX - 1))
        COMMAND="${COMMAND} --extra-nodemask ${MASK}"
    done
    exec ${COMMAND}

    echo
    echo "=== Build Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="build.cluster.sh --cluster ${CLUSTER}"
    [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
    [[ ${GALERA_TARBALL} ]] && COMMAND="${COMMAND} --galera-tarball ${GALERA_TARBALL}"
    [[ ${RAFT_TARBALL} ]] && COMMAND="${COMMAND} --raft-tarball ${RAFT_TARBALL}"
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

    # sysbench runs go to sparate logdir
    local LOGDIRECTORY2=${LOGDIRECTORY}

    start_timer
    for (( IDX=1; IDX<=NUM_NODES; IDX++ )) ; do

        if (( IDX <= (NUM_NODES+1)/2 )) ; then
            RUN_CLUSTER="${CLUSTER}."
            for (( IDX2=1; IDX2<=NUM_NODES; IDX2++ )) ; do
                (( IDX2 <= IDX )) && RUN_CLUSTER="${RUN_CLUSTER}1" || RUN_CLUSTER="${RUN_CLUSTER}0"
            done
        elif (( IDX == NUM_NODES )) ; then
            RUN_CLUSTER=${CLUSTER}
        else
            continue
        fi

        # summary dir to collect data
        local T=${LOGDIRECTORY2}/summary.${RUN_CLUSTER}
        mkdir ${T}

        for WORKLOAD in ${WORKLOADS[*]} ; do

            echo
            echo "=== Run Sysbench Workload=${WORKLOAD} on Cluster=${RUN_CLUSTER} ==="
            echo

            LOGDIRECTORY=${LOGDIRECTORY2}/$(date +%y%m%d.%H%M%S%3N).${RUN_CLUSTER}.${WORKLOAD}
            mkdir ${LOGDIRECTORY}

            for BASETHD in ${THREADS[*]} ; do
                (( THD = IDX * BASETHD ))

                echo
                echo "  === With ${THD} threads ==="
                echo

                COMMAND="sysbench.run.sh --cluster ${RUN_CLUSTER} --workload ${WORKLOAD}"
                COMMAND="${COMMAND} --duration ${DURATION} --reportinterval 5 --streams ${THD}"
                exec_no_output ${COMMAND} &
                BGPID=$!

                echo
                echo "  === Background Process PID=${BGPID} started ==="
                echo

                for LAT in ${LATENCIES[*]} ; do
                    sleep $((SLEEPTIME - 1))
                    COMMAND="configure.latency.sh --cluster ${CLUSTER} --latency ${LAT}"
                    COMMAND="${COMMAND} --slow-node ${SLOW_NODES}"
                    exec_no_output ${COMMAND}
                    COMMAND="cluster.latency.sh --cluster ${CLUSTER} --show --set --check"
                    exec_no_output ${COMMAND} &
                    sleep $((SLEEPTIME - 1))
                    COMMAND="cluster.latency.sh --cluster ${CLUSTER} --reset"
                    exec_no_output ${COMMAND}
                done

                wait ${BGPID}

                # find logdir for last test and copy results
                local D=$(ls -1d ${LOGDIRECTORY}/*.sysbench.${WORKLOAD}.run | tail -1)
                cp ${D}/test.interval.data      ${T}/${WORKLOAD}.${THD}.interval.data
                cp ${D}/throughput.interval.png ${T}/${WORKLOAD}.${THD}.interval.png

            done # THREADS
        done # WORKLOADS
    done # CLUSTER

    LOGDIRECTORY=${LOGDIRECTORY2}

    SYSBENCH_SEC[$PRODUCT]=$(stop_timer)

    exec "stop.grafana.sh --cluster ${CLUSTER}" > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench.log 2>&1

    #restore LOGDIRECTORY
    LOGDIRECTORY=${LOGDIRECTORY_BAK}

}



#===== end functions ===================================================


TEST_NAME="PERF-453A-n=${NUM_NODES}"
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
    echo "MARIADB_TARBALL        = ${MARIADB_TARBALL}"
    echo "GALERA_TARBALL         = ${GALERA_TARBALL}"
    echo "RAFT_TARBALL           = ${RAFT_TARBALL}"
    echo

    echo
    echo "=== Allocate Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --collocate"
    COMMAND="${COMMAND} --server-instance-type ${SERVER_ARCH} --server-nodes ${NUM_NODES}"
    COMMAND="${COMMAND} --driver-instance-type ${DRIVER_ARCH} --driver-nodes ${DRIVER_NODES}"
    [[ ${SOFIA} ]] || exec ${COMMAND}
    ALLOCATE_SEC=$(stop_timer)

    [[ ${DEBUG} ]] || [[ ${SOFIA} ]] || {
        SYSTEMS=( $(get_property ${CLUSTER} systems) )
        echo
        echo "allocated: ${SYSTEMS[*]}"
        (( ${#SYSTEMS[*]} != NUM_NODES + DRIVER_NODES )) && error "ERROR Unable to allocate nodes"
    }

    run_product "galera"
    run_product "raft"

    echo
    echo "=== Release Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
    [[ ${SOFIA} ]] || exec ${COMMAND}
    RELEASE_SEC=$(stop_timer)

    BUILDS_SEC=$(( ${BUILD_SEC[galera]} + ${BUILD_SEC[raft]} ))
    LOADS_SEC=$(( ${LOAD_SEC[galera]} + ${LOAD_SEC[raft]} ))
    SYSBENCHS_SEC=$(( ${SYSBENCH_SEC[galera]} + ${SYSBENCH_SEC[raft]} ))

    ((TOTAL_SEC=ALLOCATE_SEC+BUILDS_SEC+LOADS_SEC+SYSBENCHS_SEC+RELEASE_SEC))
    echo
    echo "Execution Times (minutes)"
    echo "=================================="
    perl -e "printf \"  Allocate Nodes      : %10.1f\n\", ${ALLOCATE_SEC}/60"
    perl -e "printf \"  Galera:\n\""
    perl -e "printf \"    Build Cluster     : %10.1f\n\", ${BUILD_SEC[galera]}/60"
    perl -e "printf \"    Load Sysbench     : %10.1f\n\", ${LOAD_SEC[galera]}/60"
    perl -e "printf \"    Run Sysbench      : %10.1f\n\", ${SYSBENCH_SEC[galera]}/60"
    perl -e "printf \"  Raft:\n\""
    perl -e "printf \"    Build Cluster     : %10.1f\n\", ${BUILD_SEC[raft]}/60"
    perl -e "printf \"    Load Sysbench     : %10.1f\n\", ${LOAD_SEC[raft]}/60"
    perl -e "printf \"    Run Sysbench      : %10.1f\n\", ${SYSBENCH_SEC[raft]}/60"
    perl -e "printf \"  Release Nodes       : %10.1f\n\", ${RELEASE_SEC}/60"
    echo "=================================="
    perl -e "printf \"TotalElapsed          : %10.1f\n\", ${TOTAL_SEC}/60"
    echo

} | tee ${LOGDIRECTORY}/${TEST_NAME}.log
