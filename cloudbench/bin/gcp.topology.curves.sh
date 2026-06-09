#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Run Sysbench performance curves on different topologies using GCP cloud

    Parameters:
        --topology mariadb_standalone|mariadb_replication|galera_masterslave
                   |galera_mastermaster|raft_masterslave|raft_mastermaster

        --maxscale_nodes <n>
        --maxscale_type  <i>
        --server-nodes   <n>
        --server-type    <i>
        --driver-nodes   <n>
        --driver-type    <i>

        --workload       default: 9010
        --repeats        default: 3
        --ssl            default: off

        --source
        --branch
        --commit
        --galera-source
        --galera-branch
        --galera-commit
        --raft-source
        --raft-branch
        --raft-commit
        --maxscale-source
        --maxscale-version
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --topology)         TOPOLOGY="$1"; shift;;

        --maxscale-nodes)   NUMOFMAXSCALES="$1"; shift;;
        --maxscale-type)    MAXSCALE_INSTANCE_TYPE="$1"; shift;;

        --server-nodes)     NUMOFSERVERS="$1"; shift;;
        --server-type)      SERVER_INSTANCE_TYPE="$1"; shift;;
        --server1-type)     SERVER1_INSTANCE_TYPE="$1"; shift;;

        --driver-nodes)     NUMOFDRIVERS="$1"; shift;;
        --driver-type)      DRIVER_INSTANCE_TYPE="$1"; shift;;

        --workload)         OPTION_WORKLOAD=( ${OPTION_WORKLOAD[*]} "$1" ); shift;;
        --repeats)          REPEATS="$1"; shift;;
        --ssl)              OPTION_SSL=TRUE;;

        --source)           OPTION_SOURCE="$1"; shift;;
        --branch)           OPTION_BRANCH="$1"; shift;;
        --commit)           OPTION_COMMIT="$1"; shift;;

        --galera-source)    GALERA_SOURCE="$1"; shift;;
        --galera-branch)    GALERA_BRANCH="$1"; shift;;
        --galera-commit)    GALERA_COMMIT="$1"; shift;;

        --raft-source)      RAFT_SOURCE="$1"; shift;;
        --raft-branch)      RAFT_BRANCH="$1"; shift;;
        --raft-commit)      RAFT_COMMIT="$1"; shift;;

        --maxscale-source)  MAXSCALE_SOURCE="$1"; shift;;
        --maxscale-version) MAXSCALE_VERSION="$1"; shift;;

        -h|--help)          echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

# our defaults
[[ ${SERVER_INSTANCE_TYPE} ]] || SERVER_INSTANCE_TYPE='n2-standard-8'
[[ ${DRIVER_INSTANCE_TYPE} ]] || DRIVER_INSTANCE_TYPE='n2-standard-4'

# gcp defaults
source ${CBENCH_HOME}/config/gcp.conf


[[ ${TOPOLOGY} ]] || TOPOLOGY='mariadb_standalone'
case ${TOPOLOGY} in
    mariadb_standalone|mariadb_replication|mariadb_cluster) ;;
    *) echo "Invalid Topology Specified - Topology = ${TOPOLOGY}"; exit 1;;
esac

[[ ${NUMOFSERVERS} ]] || {
    case ${TOPOLOGY} in
        mariadb_standalone)   NUMOFSERVERS=1;;
        mariadb_replication)  NUMOFSERVERS=3;;
        galera_*)             NUMOFSERVERS=3;;
        raft_*)               NUMOFSERVERS=3;;
        *) echo "ERROR Unsupported Topology : TOPOLOGY = ${TOPOLOGY}}"; echo -e "$0 ${COMMAND_LINE}"; exit 1;;
    esac
}

[[ ${NUMOFMAXSCALES} ]] || NUMOFMAXSCALES=0
[[ ${MAXSCALE_INSTANCE_TYPE} ]] || MAXSCALE_INSTANCE_TYPE=${SERVER_INSTANCE_TYPE}

[[ ${NUMOFDRIVERS} ]] || {
    case ${SERVER_INSTANCE_TYPE} in
        n2-standard-4)  NUMOFDRIVERS=1;;
        n2-standard-8)  NUMOFDRIVERS=1;;
        n2-standard-16) NUMOFDRIVERS=2;;
        n2-standard-32) NUMOFDRIVERS=4;;
        *) echo "ERROR Unsupported Server Instance Type : SERVER_INSTANCE_TYPE = ${SERVER_INSTANCE_TYPE}"; echo -e "$0 ${COMMAND_LINE}"; exit 1;;
    esac
}

[[ ${DISK_SIZE} ]] || {
    case ${SERVER_INSTANCE_TYPE} in
        n2-standard-4)  DISK_SIZE=500;;
        n2-standard-8)  DISK_SIZE=1000;;
        n2-standard-16) DISK_SIZE=1000;;
        n2-standard-32) DISK_SIZE=1000;;
        *) echo "ERROR Unsupported Server Instance Type : SERVER_INSTANCE_TYPE = ${SERVER_INSTANCE_TYPE}"; echo -e "$0 ${COMMAND_LINE}"; exit 1;;
    esac
}

[[ ${CLUSTER} ]] || CLUSTER=gcp${NUMOFSERVERS}.${SERVER_INSTANCE_TYPE}.${TOPOLOGY}

[[ ${REPEATS} ]] || REPEATS=1
[[ ${OPTION_WORKLOAD} ]] || OPTION_WORKLOAD=( "9010" )

TEST_NAME="gcp.sysbench.topology.curves"
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        TESTID                = ${TESTID}"
    echo
    echo "        SERVER_INSTANCE_TYPE  = ${SERVER_INSTANCE_TYPE}"
    echo "        SERVER1_INSTANCE_TYPE = ${SERVER1_INSTANCE_TYPE}"
    echo "        NUMOFSERVERS          = ${NUMOFSERVERS}"
    echo "        NUMOFDRIVERS          = ${NUMOFDRIVERS}"
    echo "        NUMOFMAXSCALES        = ${NUMOFMAXSCALES}"
    echo
    echo "        COMMAND_LINE          = ${COMMAND_LINE}"
    echo
    echo "        LOGDIRECTORY          = ${LOGDIRECTORY}"

    echo
    echo "    ===== Allocate Nodes - Cluster = ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    start_minute_timer
    COMMAND="gcp.allocate.nodes.sh --cluster ${CLUSTER}"
    (( ${NUMOFMAXSCALES} > 0 )) && COMMAND="${COMMAND} --maxscale-nodes ${NUMOFMAXSCALES} --maxscale-type ${MAXSCALE_INSTANCE_TYPE}"
    COMMAND="${COMMAND} --server-nodes ${NUMOFSERVERS} --server-type ${SERVER_INSTANCE_TYPE}"
    COMMAND="${COMMAND} --driver-nodes ${NUMOFDRIVERS} --driver-type ${DRIVER_INSTANCE_TYPE}"
    [[ ${ZONE} ]] && COMMAND="${COMMAND} --zone ${ZONE}"
    [[ ${DISK_TYPE} ]] && COMMAND="${COMMAND} --disk-type ${DISK_TYPE}"
    [[ ${DISK_SIZE} ]] && COMMAND="${COMMAND} --disk-size ${DISK_SIZE}GB"
    echo "        COMMAND = ${COMMAND}"
    time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).allocate.nodes.${CLUSTER}.log 2>&1
    ALLOCATE_MINUTES=$(stop_minute_timer)

    SYSTEMS=( $(get_property ${CLUSTER} systems) )
    echo
    echo "        SYSTEMS = ${SYSTEMS[*]}"

    [[ ${SYSTEMS} ]] || { echo "ERROR Unable to allocate nodes."; exit 1; }

    echo
    echo "    ===== Configure Topology - ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    COMMAND="configure.cluster.sh --cluster ${CLUSTER}"
    IDX1=0
    (( ${NUMOFMAXSCALES} > 0 )) && {
        for (( IDX2 = 0 ; IDX2 < ${NUMOFMAXSCALES} ; IDX2++ )) ; do
            COMMAND="${COMMAND} --maxscale-system ${SYSTEMS[IDX1++]}"
        done
    }
    case ${TOPOLOGY} in
        mariadb_standalone)
            COMMAND="${COMMAND} --cluster-type mariadb --mariadb-system ${SYSTEMS[IDX1++]}"
            ;;
        mariadb_replication)
            COMMAND="${COMMAND} --cluster-type mariadb_replication"
            COMMAND="${COMMAND} --primary-system ${SYSTEMS[IDX1++]}"
            for (( IDX2 = 1 ; IDX2 < ${NUMOFSERVERS} ; IDX2++ )) ; do
                COMMAND="${COMMAND} --replica-system ${SYSTEMS[IDX1++]}"
            done
            ;;
        galera_* | raft_*)
            COMMAND="${COMMAND} --cluster-type ${TOPOLOGY}"
            COMMAND="${COMMAND} --primary-system ${SYSTEMS[IDX1++]}"
            for (( IDX2 = 1 ; IDX2 < ${NUMOFSERVERS} ; IDX2++ )) ; do
                COMMAND="${COMMAND} --replica-system ${SYSTEMS[IDX1++]}"
            done
            ;;
    esac
    for (( IDX2 = 0 ; IDX2 < ${NUMOFDRIVERS} ; IDX2++ )) ; do
        COMMAND="${COMMAND} --driver-system ${SYSTEMS[IDX1++]}"
    done
    echo "        COMMAND = ${COMMAND}"
    time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).configure.cluster.log 2>&1

    echo "            Properties File:"
    showproperties

    echo
    echo "    ===== Build Cluster - ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    start_minute_timer
    COMMAND="build.cluster.sh --cluster ${CLUSTER}"
    [[ ${OPTION_SOURCE} ]]    && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
    [[ ${OPTION_BRANCH} ]]    && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
    [[ ${OPTION_COMMIT} ]]    && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
    [[ ${GALERA_SOURCE} ]]    && COMMAND="${COMMAND} --galera-source ${GALERA_SOURCE}"
    [[ ${GALERA_BRANCH} ]]    && COMMAND="${COMMAND} --galera-branch ${GALERA_BRANCH}"
    [[ ${GALERA_COMMIT} ]]    && COMMAND="${COMMAND} --galera-commit ${GALERA_COMMIT}"
    [[ ${RAFT_SOURCE} ]]      && COMMAND="${COMMAND} --raft-source ${RAFT_SOURCE}"
    [[ ${RAFT_BRANCH} ]]      && COMMAND="${COMMAND} --raft-branch ${RAFT_BRANCH}"
    [[ ${RAFT_COMMIT} ]]      && COMMAND="${COMMAND} --raft-commit ${RAFT_COMMIT}"
    [[ ${MAXSCALE_SOURCE} ]]  && COMMAND="${COMMAND} --maxscale-source ${MAXSCALE_SOURCE}"
    [[ ${MAXSCALE_VERSION} ]] && COMMAND="${COMMAND} --maxscale-version ${MAXSCALE_VERSION}"
    echo
    echo "        COMMAND = ${COMMAND}"
    [[ ${TIMEOUT_SECONDS} ]] || TIMEOUT_SECONDS=900
    TIMEOUT_START_TIME=${SECONDS}
    timeout ${TIMEOUT_SECONDS} bash -c -- "time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.cluster.log 2>&1"
    if (( ${SECONDS} - ${TIMEOUT_START_TIME} >= ${TIMEOUT_SECONDS} )) ; then
        # Assume the command failed on timeout
        echo
        echo "    ERROR : Timeout. Build Cluster exceeded timeout of ${TIMEOUT_SECONDS} seconds.  Truncating Test."
        exit 1
    fi
    BUILD_MINUTES=$(stop_minute_timer)

    (( ${NUMOFMAXSCALES} > 0 )) && RUNTIME_CLUSTER=${CLUSTER}.maxscale
    [[ ${RUNTIME_CLUSTER} ]] || RUNTIME_CLUSTER=${CLUSTER}

    echo "            Version : $(get_database_version ${RUNTIME_CLUSTER})"

    echo
    echo "    ===== Load Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    start_minute_timer
    COMMAND="sysbench.load.sh --cluster ${RUNTIME_CLUSTER} --load"
    echo "    COMMAND = ${COMMAND}"
    time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).load.data.log 2>&1
    LOAD_MINUTES=$(stop_minute_timer)

    echo
    echo "    ===== Performance Curves =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    start_minute_timer
    for WORKLOAD in ${OPTION_WORKLOAD[*]} ; do
        echo "      === ${WORKLOAD} === [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        COMMAND="sysbench.curves.sh --cluster ${RUNTIME_CLUSTER} --workload ${WORKLOAD} --repeats ${REPEATS}"
        [[ ${OPTION_SSL} == TRUE ]] && COMMAND="${COMMAND} --ssl"
        echo "    COMMAND = ${COMMAND}"
        time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).performance.curve.log 2>&1
    done
    RUN_MINUTES=$(stop_minute_timer)

    echo
    start_minute_timer
    echo "    ===== Release Nodes - Cluster = ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    COMMAND="gcp.release.nodes.sh --cluster ${CLUSTER}"
    echo "        COMMAND = ${COMMAND}"
    time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).release.nodes.log 2>&1
    RELEASE_MINUTES=$(stop_minute_timer)

    echo
    echo "    Execution Times (minutes)"
    printf "        AllocateNodes       : %10.1f\n" ${ALLOCATE_MINUTES}
    printf "        BuildCluster        : %10.1f\n" ${BUILD_MINUTES}
    printf "        LoadData            : %10.1f\n" ${LOAD_MINUTES}
    printf "        Performance Curves  : %10.1f\n" ${RUN_MINUTES}
    printf "        ReleaseNodes        : %10.1f\n" ${RELEASE_MINUTES}
    printf "    TotalElapsed            : %10.1f\n" $( echo "${ALLOCATE_MINUTES} ${BUILD_MINUTES} ${LOAD_MINUTES} ${RUN_MINUTES} ${RELEASE_MINUTES}" | awk '{ print $1 + $2 + $3 + $4 + $5 + $6}' )

    echo
    echo "    ===== Test Results =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    cat ${LOGDIRECTORY}/*.curves/*.curve/test.data
    cat ${LOGDIRECTORY}/*.curves/test.data

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log

