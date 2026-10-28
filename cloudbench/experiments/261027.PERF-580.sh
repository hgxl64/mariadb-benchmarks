#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

COMMAND_LINE="$@"

unset SOFIA BBSIZES

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --mariadb-tarball)    MARIADB_TARBALL="$1"; shift;;
        --galera-tarball)     GALERA_TARBALL="$1"; shift;;

        --sofia)              SOFIA=1;;
        --repeats)            REPEATS="$1"; shift;;
        --blackbox-size)      BBSIZES+= ( "$1" ); shift;;
        --workload)           WORKLOAD="$1"; shift;;

        -h|--help)            error -e "$USAGE";;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]] || CLUSTER="perf-580"
[[ ${WORKLOAD} ]] || WORKLOAD="oltp_read_write"
[[ ${REPEATS} ]] || REPEATS=3
[[ ${BBSIZES} ]] || BBSIZES=( "0" "10M" "100M" )

source ${CBENCH_HOME}/bin/cbench.sh

if [[ ${SOFIA} ]] ; then
    REPEATS=1
    if [[ -d properties ]] ; then
        cp properties/g1.properties properties/${CLUSTER}-server-1.properties
        cp properties/g2.properties properties/${CLUSTER}-server-2.properties
        cp properties/g3.properties properties/${CLUSTER}-server-3.properties
        cp properties/g4.properties properties/${CLUSTER}-driver-1.properties
    fi
else
    source ${CBENCH_HOME}/config/gcp.conf
    [[ ${SERVER_ARCH} ]] || SERVER_ARCH="n2-standard-16"
    [[ ${DRIVER_ARCH} ]] || DRIVER_ARCH="n2-highcpu-8"
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

TEST_NAME="PERF-580"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    echo "===== ${TEST_NAME} started [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ====="
    echo
    echo "CLUSTER          = ${CLUSTER}"
    echo "TESTID           = ${TESTID}"
    echo "LOGDIRECTORY     = ${LOGDIRECTORY}"
    echo
    echo "WORKLOAD         = ${WORKLOAD}"
    echo "REPEATS          = ${REPEATS}"
    echo "BLACKBOX SIZES   = ( ${BBSIZES[*]} )"
    echo
    echo "SERVER INSTANCE  = ${SERVER_ARCH}"
    echo "DRIVER INSTANCE  = ${DRIVER_ARCH}"

    echo
    echo "=== Allocate Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --parallel"
    COMMAND="${COMMAND} --server-type ${SERVER_ARCH} --server-nodes 3"
    COMMAND="${COMMAND} --driver-type ${DRIVER_ARCH} --driver-nodes 1"
    start_timer
    [[ ${SOFIA} ]] || exec ${COMMAND}
    ALLOCATE_SEC=$(stop_timer)
    [[ ${SOFIA} ]] || {
        SYSTEMS=( $(get_property ${CLUSTER} systems) )
        echo
        echo "allocated: ${SYSTEMS[*]}"
        (( ${#SYSTEMS[*]} != 4 )) && error "ERROR Unable to allocate nodes"
    }

    echo
    echo "=== Configure Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    COMMAND="configure.cluster.sh --cluster ${CLUSTER} --cluster-type galera_masterslave"
    COMMAND="${COMMAND} --master-system ${CLUSTER}-server-1"
    COMMAND="${COMMAND} --slave-system ${CLUSTER}-server-2"
    COMMAND="${COMMAND} --slave-system ${CLUSTER}-server-3"
    COMMAND="${COMMAND} --driver-system ${CLUSTER}-driver-1"
    exec ${COMMAND}

    echo
    echo "=== Build Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    COMMAND="build.cluster.sh --cluster ${CLUSTER}"
    [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
    [[ ${GALERA_TARBALL} ]] && COMMAND="${COMMAND} --galera-tarball ${GALERA_TARBALL}"
    start_timer
    exec ${COMMAND}
    BUILD_SEC=$(stop_timer)

    echo
    echo "=== Load Data for Sysbench [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark sysbench --load --noautoinc --skipcheck"
    start_timer
    exec ${COMMAND}
    LOAD_SEC=$(stop_timer)

    # summary dir to collect data
    T=${LOGDIRECTORY}/plots
    [[ -d ${T} ]] || mkdir ${T}

    start_timer
    for BBSIZE in ${BBSIZES[*]}; do
        # each blackbox size goes to own logdir
        LOGDIRECTORY_BAK=${LOGDIRECTORY}
        LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).curves.blackbox=${BBSIZE}
        mkdir ${LOGDIRECTORY}

        # set blackbox size
        for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
            echo "SET GLOBAL wsrep_black_box_size=${BBSIZE}" | mariadbci ${SYSTEM}
        done

        # run curve(s)
        COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats ${REPEATS} --"
        COMMAND="${COMMAND} --skipcheck --benchmark sysbench --workload ${WORKLOAD}"
        exec ${COMMAND}

        # find logdir for this run and copy results
        D=$(ls -1d ${LOGDIRECTORY}/*.performance.curves | tail -1)
        cp ${D}/test.data ${T}/${WORKLOAD}.blackbox=${BBSIZE}.test.data
        F=$(ls ${D}/*.performance.curves.png | tail -1)
        cp ${F} ${T}/${WORKLOAD}.blackbox=${BBSIZE}.curves.png

        #restore LOGDIRECTORY
        LOGDIRECTORY=${LOGDIRECTORY_BAK}
    done
    SYSBENCH_SEC=$(stop_timer)

    echo
    echo "=== Release Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
    [[ ${SOFIA} ]] || exec ${COMMAND}
    RELEASE_SEC=$(stop_timer)

    ((TOTAL_SEC=ALLOCATE_SEC+BUILD_SEC+LOAD_SEC+SYSBENCH_SEC+RELEASE_SEC))
    echo
    echo "Execution Times (minutes)"
    echo "=================================="
    perl -e "printf \"  Allocate Nodes      : %10.1f\n\", ${ALLOCATE_SEC}/60"
    perl -e "printf \"  Build Cluster       : %10.1f\n\", ${BUILD_SEC}/60"
    perl -e "printf \"  Load Sysbench       : %10.1f\n\", ${LOAD_SEC}/60"
    perl -e "printf \"  Run Sysbench        : %10.1f\n\", ${SYSBENCH_SEC}/60"
    perl -e "printf \"  Release Nodes       : %10.1f\n\", ${RELEASE_SEC}/60"
    echo "=================================="
    perl -e "printf \"TotalElapsed          : %10.1f\n\", ${TOTAL_SEC}/60"
    echo

} | tee ${LOGDIRECTORY}/${TEST_NAME}.log

