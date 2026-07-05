#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

USAGE="
$0 - Run Sysbench/HammerDB benchmarks to evaluate the usefulness of
  hyper-threading on different architechtures

Usage: $0 -a|--architecture ... -h|--hyperthreading ... [options]

Options:
    --architecture | -a     GCP architecture, i.e. N2, N2D, ... (mandatory)
    --hyperthreading | -h   on or off, default: on

    --mariadb-source        default: jenkins
    --mariadb-branch        default: 12.3-enterprise
    --mariadb-commit        default: latest
    --mariadb-tarball | -t  (no default)
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        -a)                   ARCH="$1"; shift;;
        --architecture)       ARCH="$1"; shift;;
        -h)                   HT="$1"; shift;;
        --hyperthreading)     HT="$1"; shift;;

        --mariadb-source)     OPT_SOURCE="$1"; shift;;
        --mariadb-branch)     OPT_BRANCH="$1"; shift;;
        --mariadb-commit)     OPT_COMMIT="$1"; shift;;
        -t)                   OPT_TARBALL="$1"; OPT_SOURCE="tarball"; shift;;
        --mariadb-tarball)    OPT_TARBALL="$1"; OPT_SOURCE="tarball"; shift;;

        -h|--help)          echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


source ${CBENCH_HOME}/bin/cbench.sh
source ${CBENCH_HOME}/config/gcp.conf

# check architecture
[[ ${ARCH} ]] || error -e "no architecture given!\n$USAGE"
ARCH=$(echo ${ARCH} | perl -pe 'tr/A-Z/a-z/')

case ${ARCH} in
    n2)
        # default is to make the driver half as big as the server
        # this leaves cpu cycles unused on the driver and we can
        # be sure that the server is the bottleneck
        export SERVER_INSTANCE_TYPE=n2-highcpu-16
        export DRIVER_INSTANCE_TYPE=n2-highcpu-8
        ;;

    n2d)
        export SERVER_INSTANCE_TYPE=n2d-highcpu-16
        export DRIVER_INSTANCE_TYPE=n2d-highcpu-8
        ;;

    n4)
        # N4 servers don't support PD-SSD disks, only hyperdisks
        # the disk must be bigger since the IOPS are proportional to size
        export SERVER_INSTANCE_TYPE=n4-highcpu-16
        export DISK_TYPE="hyperdisk-balanced"
        export DISK_DEVICE="/dev/nvme0n2"
        export DISK_SIZE="500"
        # the driver cannot be N4 since the driver image is PD-SSD
        # also N4 is faster than N2, so we use same nominal size
        export DRIVER_INSTANCE_TYPE=n2-highcpu-16
        ;;

    n4d)
        export SERVER_INSTANCE_TYPE=n4d-highcpu-16
        export DISK_TYPE="hyperdisk-balanced"
        export DISK_DEVICE="/dev/nvme0n2"
        export DISK_SIZE="500"
        export DRIVER_INSTANCE_TYPE=n2-highcpu-16
        ;;

    *)
        error "architecture ${ARCH} not handled in $0"
esac

#check hyperthreading
HT=$(echo ${HT} | perl -pe 'tr/A-Z/a-z/')
if [[ ${HT} == "off" ]] || [[ ${HT} == "off" ]] || [[ ${HT} == "0" ]] ; then
    export OPTION_THREADS_PER_CORE=1
else
    export OPTION_THREADS_PER_CORE=2
fi


export CLUSTER='perf-532'

TEST_NAME="PERF-532"
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
    echo "SERVER_INSTANCE_TYPE   = ${SERVER_INSTANCE_TYPE}"
    echo "THREADS_PER_CORE       = ${THREADS_PER_CORE}"
    echo "DRIVER_INSTANCE_TYPE   = ${DRIVER_INSTANCE_TYPE}"
    echo "DISK_TYPE              = ${DISK_TYPE}"
    echo "DISK_SIZE              = ${DISK_SIZE}"
    echo

    echo
    echo "=== Allocate Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        # instance types etc are passed in environment variables
        COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER} --server-nodes 1 --driver-nodes 1"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).allocate.nodes.${CLUSTER}.log 2>&1
    }
    ALLOCATE_SEC=$(stop_timer)

    SYSTEMS=( $(get_property ${CLUSTER} systems) )
    echo
    echo "        SYSTEMS = ${SYSTEMS[*]}"

    [[ ${SYSTEMS} ]] || error "ERROR Unable to allocate nodes."

    echo
    echo "=== Configure Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    time {
        COMMAND="configure.cluster.sh --cluster ${CLUSTER} --cluster-type mariadb"
        COMMAND="${COMMAND} --mariadb-system ${SYSTEMS[0]} --driver-system ${SYSTEMS[1]}"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).configure.cluster.${CLUSTER}.log 2>&1
    }

    echo
    echo "=== Build Cluster [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        COMMAND="build.cluster.sh --cluster ${CLUSTER}"
        [[ ${OPT_SOURCE} ]]  && COMMAND="${COMMAND} --mariadb-source ${OPT_SOURCE}"
        [[ ${OPT_BRANCH} ]]  && COMMAND="${COMMAND} --mariadb-branch ${OPT_BRANCH}"
        [[ ${OPT_COMMIT} ]]  && COMMAND="${COMMAND} --mariadb-commit ${OPT_COMMIT}"
        [[ ${OPT_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${OPT_TARBALL}"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.cluster.${CLUSTER}.log 2>&1
    }
    BUILD_SEC=$(stop_timer)

    export OPTION_SKIPCHECK=TRUE

    echo
    echo "=== Load Data for Sysbench [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_grafana
    start_timer
    time {
        COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark sysbench --bulkload"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).load.data.sysbench.log 2>&1
    }
    LOAD1_SEC=$(stop_timer)
    echo
    echo "=== Run Sysbench point-select Curves [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench --workload oltp_point_select"
        echo "${COMMAND}"
        export DURATION=120
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).sysbench.point-select.curves.log 2>&1
        unset DURATION
    }
    CURVES1_SEC=$(stop_timer)
    echo
    echo "=== Run Sysbench read/write Curves [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench --workload oltp_read_write"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).sysbench.read-write.curves.log 2>&1
    }
    CURVES2_SEC=$(stop_timer)
    stop.grafana.sh --cluster ${CLUSTER} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench.log 2>&1
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench --clean &> /dev/null

    echo
    echo "=== Load Data for Sysbench TPC-C [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_grafana
    start_timer
    time {
        COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc --load"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).load.data.sysbench-tpcc.log 2>&1
    }
    LOAD2_SEC=$(stop_timer)
    echo
    echo "=== Run Sysbench TPC-C Curves [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark sysbench-tpcc"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).sysbench-tpcc.curves.log 2>&1
    }
    CURVES3_SEC=$(stop_timer)
    stop.grafana.sh --cluster ${CLUSTER} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench-tpcc.log 2>&1
    load.data.sh --cluster ${CLUSTER} --benchmark sysbench-tpcc --clean &> /dev/null

    echo
    echo "=== Load Data for HammerDB TPROC-C [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_grafana
    start_timer
    time {
        COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark tproc-c --load"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).load.data.hammerdb-tprocc.log 2>&1
    }
    LOAD3_SEC=$(stop_timer)
    echo
    echo "=== Run HammerDB TPROC-C Curves [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    echo
    start_timer
    time {
        COMMAND="performance.curves.sh --cluster ${CLUSTER} --repeats 3 -- --benchmark tproc-c"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).hammerdb-tprocc.curves.log 2>&1
    }
    CURVES4_SEC=$(stop_timer)
    stop.grafana.sh --cluster ${CLUSTER} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.sysbench-tpcc.log 2>&1

    echo "=== Release Nodes [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ] ==="
    start_timer
    time {
        COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
        echo "${COMMAND}"
        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).release.nodes.${CLUSTER}.log 2>&1
    }
    RELEASE_SEC=$(stop_timer)

    (( LOAD_SEC = LOAD1_SEC + LOAD2_SEC + LOAD3_SEC ))
    (( CURVES_SEC = CURVES1_SEC + CURVES2_SEC + CURVES3_SEC + CURVES4_SEC))
    (( TOTAL_SEC = ALLOCATE_SEC + BUILD_SEC + LOAD_SEC + CURVES_SEC + RELEASE_SEC ))
    echo
    echo "Execution Times (minutes)"
    echo "=================================="
    echo "  Allocate Nodes      " $(perl -e "printf(\": %10.1f\n\", ${ALLOCATE_SEC}/60)")
    echo "  Build Cluster       " $(perl -e "printf(\": %10.1f\n\", ${BUILD_SEC}/60)")
    echo "  Load Sysbench       " $(perl -e "printf(\": %10.1f\n\", ${LOAD1_SEC}/60)")
    echo "  Load TPC-C          " $(perl -e "printf(\": %10.1f\n\", ${LOAD2_SEC}/60)")
    echo "  Load TPROC-C        " $(perl -e "printf(\": %10.1f\n\", ${LOAD3_SEC}/60)")
    echo "  Load Total          " $(perl -e "printf(\": %10.1f\n\", ${LOAD_SEC}/60)")
    echo "  Curves point-select " $(perl -e "printf(\": %10.1f\n\", ${CURVES1_SEC}/60)")
    echo "  Curves read/write   " $(perl -e "printf(\": %10.1f\n\", ${CURVES2_SEC}/60)")
    echo "  Curves TPC-C        " $(perl -e "printf(\": %10.1f\n\", ${CURVES3_SEC}/60)")
    echo "  Curves TPROC-C      " $(perl -e "printf(\": %10.1f\n\", ${CURVES4_SEC}/60)")
    echo "  Curves Total        " $(perl -e "printf(\": %10.1f\n\", ${CURVES_SEC}/60)")
    echo "  Release Nodes       " $(perl -e "printf(\": %10.1f\n\", ${RELEASE_SEC}/60)")
    echo "=================================="
    echo "TotalElapsed          " $(perl -e "printf(\": %10.1f\n\", ${TOTAL_SEC}/60)")
    echo

} | tee ${LOGDIRECTORY}/${TESTNAME}.log
