#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id§

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Cleans a system/cluster (removes everything related to prior databases).
    Options:
         [ --cluster  <<clustername>> ]
         [ --system   <<systemname>> ]
        [ -h|--help ]
    Notes:
        1.  Either cluster or system are required.
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
         # Connection Info
        --cluster)                      CLUSTER="$1"; shift;;
        --system)                       CLUSTER="$1"; shift;;
        -h|--help)                      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required System/Cluster not specified"; echo -e "$0 ${COMMAND_LINE}"; exit 1; fi

process_connection_info

TEST_NAME=cleandb
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.${CLUSTER}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    STARTSECONDS=$SECONDS

    echo "
            $0 $COMMAND_LINE

            CLUSTER         = ${CLUSTER}
    "

    echo
    echo "    ===== Cleanup Any Leftover Objects from a Previous Database System =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

    NODES=( $(get_property ${CLUSTER} nodes) )
    if [[ $(get_property ${CLUSTER} galera.systems) ]] ; then
        for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
            for NODE in $(get_property ${SYSTEM} nodes) ; do
                if [[ ! " ${NODES[@]} " =~ " ${NODE} " ]]; then
                    # if the node is not already in the list of hardware nodes, add it
                    NODES=( ${NODES[*]} ${NODE} )
                fi
            done
        done
    fi
    if [[ $(get_property ${CLUSTER} maxscale.systems) ]] ; then
        for SYSTEM in $(get_property ${CLUSTER} maxscale.systems) ; do
            for NODE in $(get_property ${SYSTEM} nodes) ; do
                if [[ ! " ${NODES[@]} " =~ " ${NODE} " ]]; then
                    # if the node is not already in the list of hardware nodes, add it
                    NODES=( ${NODES[*]} ${NODE} )
                fi
            done
        done
    fi

    echo "        NODES = ${NODES[*]}"
    for NODE in ${NODES[*]} ; do
        unset BACKGROUND_PIDS
        time {
            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                if [[ -d /data/cbench ]] ; then
                    if [[ -x /data/cbench/install/bin/mariadb-admin ]] ; then
                        echo "found a MariaDB installation - shutting down"
                        timeout 180 /data/cbench/install/bin/mariadb-admin -u root shutdown
                        pkill -TERM mariadbd
                        sleep 5
                        pkill -KILL mariadbd
                        sleep 5
                        ps fax
                    fi
                    if [[ -x /data/cbench/install/bin/maxscale ]] ; then
                        echo "found a MaxScale installation - shutting down"
                        pkill -INT maxscale
                        sleep 5
                        pkill -KILL maxscale
                        sleep 5
                        ps fax
                    fi
                    echo "deleting /data/cbench/*"
                    rm -rf /data/cbench/*
                    ls -lR /data/cbench
                fi
                echo "processes left:"
                ps fax
                echo "done"
                '
        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).cleandb.${NODE}.log 2>&1 &
        BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
    done
    wait ${BACKGROUND_PIDS[*]}

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
