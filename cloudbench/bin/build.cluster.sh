#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Given a list of nodes (master and slave systems), build a cluster

    Cluster Types: standalone, replication, galera

    Parameters:
        ...

        [ -h|--help ]

    Notes:
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --cluster)                  CLUSTER="$1"; shift;;
        --system)                   CLUSTER="$1"; shift;;
        --testid)                   TESTID="$1"; shift;;

        # Master/Slave Replication Options
        --semisync-replication)     OPTION_SEMISYNC_REPLICATION=TRUE;;
        --semisync-after-commit)    OPTION_SEMISYNC_AFTER_COMMIT=TRUE;;
        --semisync-after-sync)      OPTION_SEMISYNC_AFTER_SYNC=TRUE;;

        --binlog-commit-wait-usec)  OPTION_BINLOG_COMMIT_WAIT_USEC="$1"; shift;;
        --binlog-commit-wait-count) OPTION_BINLOG_COMMIT_WAIT_COUNT="$1"; shift;;

        # MariaDB Options
        --source)                   OPTION_SOURCE="$1"; shift;;
        --branch)                   OPTION_BRANCH="$1"; shift;;
        --commit)                   OPTION_COMMIT="$1"; shift;;

        # Galera options
        --galera-source)            OPTION_GALERA_SOURCE="$1"; shift;;
        --galera-branch)            OPTION_GALERA_BRANCH="$1"; shift;;
        --galera-commit)            OPTION_GALERA_COMMIT="$1"; shift;;

        # Raft options
        --raft-source)              OPTION_RAFT_SOURCE="$1"; shift;;
        --raft-branch)              OPTION_RAFT_BRANCH="$1"; shift;;
        --raft-commit)              OPTION_RAFT_COMMIT="$1"; shift;;

        # MaxScele options
        --maxscale-source)          OPTION_MAXSCALE_SOURCE="$1"; shift;;
        --maxscale-version)         OPTION_MAXSCALE_VERSION="$1"; shift;;

        --thread-pool)              OPTION_THREAD_POOL=TRUE;;
        --thread-pool-size)         OPTION_THREAD_POOL_SIZE="$1"; shift;;

        # Galera Options
        --slavethreads)             OPTION_SLAVE_THREADS="$1"; shift;;
        --deferflush)               OPTION_DEFERRED_FLUSH=TRUE;;

        --profile)                  OPTION_PROFILING=TRUE;;
        --ssl)                      OPTION_SSL=TRUE;;

        -h|--help) echo -e "$USAGE"; exit 1 ;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1 ;;
    esac
done

CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)
[[ ${CLUSTER} ]] || CLUSTER=$(date +%y%m%d.%H%M%S).${CLUSTER_TYPE}

# logging
TEST_NAME=build.cluster
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{
    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "        $0 ${COMMAND_LINE}"
    echo
    STARTSECONDS=$SECONDS

    echo
    echo "        TESTID            = ${TESTID}"
    echo
    echo "        CLUSTER           = ${CLUSTER}"
    echo "        CLUSTER_TYPE      = ${CLUSTER_TYPE}"
    echo
    echo "        COMMAND_LINE      = ${COMMAND_LINE}"
    echo
    echo "        LOGDIRECTORY      = ${LOGDIRECTORY}"
    echo
    echo "        Properties File:"
    showproperties

    echo
    echo "    ===== Build Cluster : CLUSTER = ${CLUSTER}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    {
        case ${CLUSTER_TYPE} in
            mariadb)
                echo
                echo "    ===== Build MariaDB System = ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                COMMAND="build.system.sh --system ${CLUSTER} --initdb"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${OPTION_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
                [[ ${OPTION_BRANCH} ]] && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
                [[ ${OPTION_COMMIT} ]] && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
                [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
                echo "        COMMAND = ${COMMAND}"
                time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.mariadb.${CLUSTER}.log 2>&1
                ;;

            mariadb_replication)
                MASTER_SYSTEMS=( $(get_property ${CLUSTER} master.systems) )
                REPLICA_SYSTEMS=( $(get_property ${CLUSTER} slave.systems) )
                echo
                echo "    ===== Build Master - SYSTEMS = ${MASTER_SYSTEMS[0]} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                COMMAND="build.system.sh --system ${MASTER_SYSTEMS[0]} --initdb --binlog"
                [[ ${OPTION_SEMISYNC_REPLICATION} ]] && COMMAND="${COMMAND} --semisync-replication"
                [[ ${OPTION_SEMISYNC_AFTER_COMMIT} ]] && COMMAND="${COMMAND} --semisync-after-commit"
                [[ ${OPTION_SEMISYNC_AFTER_SYNC} ]] && COMMAND="${COMMAND} --semisync-after-sync"
                [[ ${OPTION_BINLOG_COMMIT_WAIT_USEC} ]] && COMMAND="${COMMAND} --binlog-commit-wait-usec ${OPTION_BINLOG_COMMIT_WAIT_USEC}"
                [[ ${OPTION_BINLOG_COMMIT_WAIT_COUNT} ]] && COMMAND="${COMMAND} --binlog-commit-wait-count ${OPTION_BINLOG_COMMIT_WAIT_COUNT}"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${OPTION_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
                [[ ${OPTION_BRANCH} ]] && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
                [[ ${OPTION_COMMIT} ]] && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
                [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
                echo "        COMMAND = ${COMMAND}"
                time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.master.${MASTER_SYSTEMS[0]}.log 2>&1
                echo
                echo "    ===== Build Replicas - SYSTEMS = ( ${REPLICA_SYSTEMS[*]} ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                time {
                    for SYSTEM in ${REPLICA_SYSTEMS[*]} ; do
                        COMMAND="build.system.sh --system ${SYSTEM} --master ${MASTER_SYSTEMS[0]} --initdb"
                        [[ ${OPTION_SEMISYNC_REPLICATION} ]] && COMMAND="${COMMAND} --semisync-replication"
                        [[ ${OPTION_SEMISYNC_AFTER_COMMIT} ]] && COMMAND="${COMMAND} --semisync-after-commit"
                        [[ ${OPTION_SEMISYNC_AFTER_SYNC} ]] && COMMAND="${COMMAND} --semisync-after-sync"
                        [[ ${OPTION_BINLOG_COMMIT_WAIT_USEC} ]] && COMMAND="${COMMAND} --binlog-commit-wait-usec ${OPTION_BINLOG_COMMIT_WAIT_USEC}"
                        [[ ${OPTION_BINLOG_COMMIT_WAIT_COUNT} ]] && COMMAND="${COMMAND} --binlog-commit-wait-count ${OPTION_BINLOG_COMMIT_WAIT_COUNT}"
                        [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                        [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                        [[ ${OPTION_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
                        [[ ${OPTION_BRANCH} ]] && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
                        [[ ${OPTION_COMMIT} ]] && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
                        [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
                        echo "        COMMAND = ${COMMAND}"
                        ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.slave.${SYSTEM}.log 2>&1 &
                        sleep 1
                    done
                    wait
                }
                ;;

            galera_*)
                COMMAND="build.galera.sh --cluster ${CLUSTER}"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${OPTION_SLAVE_THREADS} ]] && COMMAND="${COMMAND} --slavethreads ${OPTION_SLAVE_THREADS}"
                [[ ${OPTION_DEFERRED_FLUSH} ]] && COMMAND="${COMMAND} --deferflush"
                [[ ${OPTION_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
                [[ ${OPTION_BRANCH} ]] && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
                [[ ${OPTION_COMMIT} ]] && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
                [[ ${OPTION_GALERA_SOURCE} ]] && COMMAND="${COMMAND} --galera-source ${OPTION_GALERA_SOURCE}"
                [[ ${OPTION_GALERA_BRANCH} ]] && COMMAND="${COMMAND} --galera-branch ${OPTION_GALERA_BRANCH}"
                [[ ${OPTION_GALERA_COMMIT} ]] && COMMAND="${COMMAND} --galera-commit ${OPTION_GALERA_COMMIT}"
                echo "        COMMAND = ${COMMAND}"
                time ${COMMAND}
                ;;

            raft_*)
                COMMAND="build.raft.sh --cluster ${CLUSTER}"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${OPTION_SLAVE_THREADS} ]] && COMMAND="${COMMAND} --slavethreads ${OPTION_SLAVE_THREADS}"
                [[ ${OPTION_DEFERRED_FLUSH} ]] && COMMAND="${COMMAND} --deferflush"
                [[ ${OPTION_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_SOURCE}"
                [[ ${OPTION_BRANCH} ]] && COMMAND="${COMMAND} --branch ${OPTION_BRANCH}"
                [[ ${OPTION_COMMIT} ]] && COMMAND="${COMMAND} --commit ${OPTION_COMMIT}"
                [[ ${OPTION_RAFT_SOURCE} ]] && COMMAND="${COMMAND} --raft-source ${OPTION_RAFT_SOURCE}"
                [[ ${OPTION_RAFT_BRANCH} ]] && COMMAND="${COMMAND} --raft-branch ${OPTION_RAFT_BRANCH}"
                [[ ${OPTION_RAFT_COMMIT} ]] && COMMAND="${COMMAND} --raft-commit ${OPTION_RAFT_COMMIT}"
                echo "        COMMAND = ${COMMAND}"
                time ${COMMAND}
                ;;

            *)
                echo "Unimplemented Cluster Type : CLUSTER_TYPE = ${CLUSTER_TYPE}"; echo -e "$0 ${COMMAND_LINE}"; exit 1
                ;;
        esac
    }

    MAXSCALE_SYSTEMS=( $(get_property ${CLUSTER} maxscale.systems) )
    if [[ ${MAXSCALE_SYSTEMS} ]] ; then
        echo
        echo "    ===== Build MaxScale System - SYSTEM = ${MAXSCALE_SYSTEMS[0]} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        COMMAND="build.maxscale.sh --cluster ${CLUSTER}.maxscale --initdb"
        [[ ${OPTION_MAXSCALE_SOURCE} ]] && COMMAND="${COMMAND} --source ${OPTION_MAXSCALE_SOURCE}"
        [[ ${OPTION_MAXSCALE_VERSION} ]] && COMMAND="${COMMAND} --version ${OPTION_MAXSCALE_VERSION}"
        [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
        echo "        COMMAND = ${COMMAND}"
        time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).build.maxscale.log 2>&1
        echo
    fi

    if (( $(get_property ${CLUSTER} driver.nodes) > 0 )) ; then
        echo
        echo "    ===== Configure Drivers  =====  [ $(date -u +'%Y-%m-%d %H:%M:%S') ]"
        time configure.drivers.sh --cluster ${CLUSTER} ${OPTION_CLOUD} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).configure.drivers.log
    fi

    echo
    echo "    ===== Cluster properties : CLUSTER = ${CLUSTER}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    cat properties/${CLUSTER}.properties

    echo
    echo "    ===== Check Cluster : CLUSTER = ${CLUSTER}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    time check.cluster.sh --cluster ${CLUSTER}

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( ${SECONDS} - ${STARTSECONDS} )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
