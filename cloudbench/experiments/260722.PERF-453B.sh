#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

USAGE="
$0 - PERF-453, scenario B

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

[[ ${CLUSTER} ]] || CLUSTER='perf-453'
[[ ${WORKLOADS} ]] || WORKLOADS=( oltp_read_write oltp_write_only oltp_update_index2 )
[[ ${NUM_NODES} ]] || NUM_NODES=3
[[ ${SOFIA} ]] && NUM_NODES=3

SERVER_ARCH="n2-standard-16"
case ${NUM_NODES} in
    3) DRIVER_ARCH="n2-highcpu-16"
       NUM_DRIVER=1
       ;;
    5) DRIVER_ARCH="n2-highcpu-16"
       NUM_DRIVER=2
       ;;
    7) DRIVER_ARCH="n2-highcpu-16"
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

run_product() {
    local PRODUCT=$1

    # summary dir to collect data
    local T=${LOGDIRECTORY}/plots
    [[ -d ${T} ]] || mkdir ${T}

    # use a custom log directory for each product
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
    # cluster for leader node only
    COMMAND="${COMMAND} --extra-nodemask 1"
    # cluster for first follower node only
    COMMAND="${COMMAND} --extra-nodemask 2"
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

    start_timer
    for (( IDX=1; IDX<=2; IDX++ )) ; do
        RUN_CLUSTER="${CLUSTER}."
        for (( IDX2=1; IDX2<=NUM_NODES; IDX2++ )) ; do
            (( IDX2 == IDX )) && RUN_CLUSTER="${RUN_CLUSTER}1" || RUN_CLUSTER="${RUN_CLUSTER}0"
        done

        for WORKLOAD in ${WORKLOADS[*]} ; do
            echo
            echo "=== Run Sysbench Workload=${WORKLOAD} on Cluster=${RUN_CLUSTER} ==="
            echo

            COMMAND="performance.curves.sh --cluster ${RUN_CLUSTER} --repeats 3 --"
            # Sofia is deterministic, one run is enough
            [[ ${SOFIA} ]] && COMMAND="performance.curves.sh --cluster ${RUN_CLUSTER} --repeats 1 --"
            COMMAND="${COMMAND} --skipcheck --benchmark sysbench --workload ${WORKLOAD}"
            exec ${COMMAND}

            # find logdir for this run and copy results
            local D=$(ls -1d ${LOGDIRECTORY}/*.sysbench.${WORKLOAD}.curves | tail -1)
            cp ${D}/test.data ${T}/${RUN_CLUSTER}.${WORKLOAD}.test.data
            local F=$(ls ${D}/*.sysbench.${WORKLOAD}.performance.curves.png | tail -1)
            cp ${F} ${T}/${RUN_CLUSTER}.${WORKLOAD}.performance.curves.png
        done
    done
    SYSBENCH_SEC[$PRODUCT]=$(stop_timer)

    exec "stop.grafana.sh --cluster ${CLUSTER}" > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench.log 2>&1

    #restore LOGDIRECTORY
    LOGDIRECTORY=${LOGDIRECTORY_BAK}

}

#===== end functions ===================================================


TEST_NAME="PERF-453B-n=${NUM_NODES}"
[[ ${SOFIA} ]] && TEST_NAME="PERF-453B-Sofia"
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
    echo "NUM_DRIVER             = ${NUM_DRIVER}"
    echo "MARIADB_TARBALL        = ${MARIADB_TARBALL}"
    echo "GALERA_TARBALL         = ${GALERA_TARBALL}"
    echo "RAFT_TARBALL           = ${RAFT_TARBALL}"
    echo

    echo
    echo "=== Allocate Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --collocate"
    COMMAND="${COMMAND} --server-type ${SERVER_ARCH} --server-nodes ${NUM_NODES}"
    COMMAND="${COMMAND} --driver-type ${DRIVER_ARCH} --driver-nodes ${NUM_DRIVER}"
    [[ ${SOFIA} ]] || exec ${COMMAND}
    ALLOCATE_SEC=$(stop_timer)

    [[ ${DEBUG} ]] || [[ ${SOFIA} ]] || {
        SYSTEMS=( $(get_property ${CLUSTER} systems) )
        echo
        echo "allocated: ${SYSTEMS[*]}"
        (( ${#SYSTEMS[*]} != NUM_NODES + NUM_DRIVER )) && error "ERROR Unable to allocate nodes"
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
