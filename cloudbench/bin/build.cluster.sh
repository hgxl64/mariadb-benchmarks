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

        # MariaDB Options
        --mariadb-source)           MARIADB_SOURCE="$1"; shift;;
        --mariadb-branch)           MARIADB_BRANCH="$1"; shift;;
        --mariadb-commit)           MARIADB_COMMIT="$1"; shift;;
        --mariadb-tarball)          MARIADB_TARBALL="$1"; shift;;

        # Galera options
        --galera-source)            GALERA_SOURCE="$1"; shift;;
        --galera-branch)            GALERA_BRANCH="$1"; shift;;
        --galera-commit)            GALERA_COMMIT="$1"; shift;;
        --galera-tarball)           GALERA_TARBALL="$1"; shift;;

        # Raft options
        --raft-source)              RAFT_SOURCE="$1"; shift;;
        --raft-branch)              RAFT_BRANCH="$1"; shift;;
        --raft-commit)              RAFT_COMMIT="$1"; shift;;
        --raft-tarball)             RAFT_TARBALL="$1"; shift;;

        # MaxScele options
        --maxscale-source)          MAXSCALE_SOURCE="$1"; shift;;
        --maxscale-version)         MAXSCALE_VERSION="$1"; shift;;
        --maxscale-tarball)         MAXSCALE_TARBALL="$1"; shift;;

        --thread-pool)              OPTION_THREAD_POOL=TRUE;;
        --thread-pool-size)         OPTION_THREAD_POOL_SIZE="$1"; shift;;

        # Master/Slave Replication Config Options
        --semisync-replication)     OPTION_SEMISYNC_REPLICATION=TRUE;;
        --semisync-after-commit)    OPTION_SEMISYNC_AFTER_COMMIT=TRUE;;
        --semisync-after-sync)      OPTION_SEMISYNC_AFTER_SYNC=TRUE;;

        --binlog-commit-wait-usec)  OPTION_BINLOG_COMMIT_WAIT_USEC="$1"; shift;;
        --binlog-commit-wait-count) OPTION_BINLOG_COMMIT_WAIT_COUNT="$1"; shift;;

        # Galera/Raft Config Options
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
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIABD_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIABD_TARBALL}"
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
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIABD_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIABD_TARBALL}"
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
                        [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                        [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                        [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                        [[ ${MARIABD_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIABD_TARBALL}"
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
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIABD_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIABD_TARBALL}"
                [[ ${GALERA_SOURCE} ]] && COMMAND="${COMMAND} --galera-source ${GALERA_SOURCE}"
                [[ ${GALERA_BRANCH} ]] && COMMAND="${COMMAND} --galera-branch ${GALERA_BRANCH}"
                [[ ${GALERA_COMMIT} ]] && COMMAND="${COMMAND} --galera-commit ${GALERA_COMMIT}"
                [[ ${GALERA_TARBALL} ]] && COMMAND="${COMMAND} --galera-tarball ${GALERA_TARBALL}"
                echo "        COMMAND = ${COMMAND}"
                time ${COMMAND}
                ;;

            raft_*)
                COMMAND="build.raft.sh --cluster ${CLUSTER}"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${OPTION_SLAVE_THREADS} ]] && COMMAND="${COMMAND} --slavethreads ${OPTION_SLAVE_THREADS}"
                [[ ${OPTION_DEFERRED_FLUSH} ]] && COMMAND="${COMMAND} --deferflush"
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIABD_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIABD_TARBALL}"
                [[ ${RAFT_SOURCE} ]] && COMMAND="${COMMAND} --raft-source ${RAFT_SOURCE}"
                [[ ${RAFT_BRANCH} ]] && COMMAND="${COMMAND} --raft-branch ${RAFT_BRANCH}"
                [[ ${RAFT_COMMIT} ]] && COMMAND="${COMMAND} --raft-commit ${RAFT_COMMIT}"
                [[ ${RAFT_TARBALL} ]] && COMMAND="${COMMAND} --raft-tarball ${RAFT_TARBALL}"
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
        [[ ${MAXSCALE_SOURCE} ]] && COMMAND="${COMMAND} --maxscale-source ${MAXSCALE_SOURCE}"
        [[ ${MAXSCALE_VERSION} ]] && COMMAND="${COMMAND} --maxscale-version ${MAXSCALE_VERSION}"
        [[ ${MAXSCALE_TARBALL} ]] && COMMAND="${COMMAND} --maxscale-tarball ${MAXSCALE_TARBALL}"
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
