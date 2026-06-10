#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Fix known OS problems on all cluster nodes.
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

TEST_NAME=fixup.os
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.${CLUSTER}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo "
    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]
    "
    STARTSECONDS=$SECONDS

    echo "
        $0 $COMMAND_LINE

            CLUSTER         = ${CLUSTER}
    "

    echo
    echo "    ===== Fixup known OS problems =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

    NODES=( $(get_property ${CLUSTER} nodes) )
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
    for NODE in ${DRIVER_NODES[*]}; do
        if [[ ! " ${NODES[@]} " =~ " ${NODE} " ]]; then
            # if the node is not already in the list of hardware nodes, add it
            NODES=( ${NODES[*]} ${NODE} )
        fi
    done

    echo "        NODES = ${NODES[*]}"
    for NODE in ${NODES[*]} ; do
        unset BACKGROUND_PIDS
        time {
            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                if fgrep -i "ubuntu 24." /etc/lsb-release &>/dev/null ; then
                    echo "Ubuntu 24 detected, installing packages"
                    sudo apt-get update
                    sudo apt-get -y install ntpdate
                    sudo apt-get -y install liburing2
                    sudo apt-get -y install libodbc2 libprotobuf32t64 libmicrohttpd12
                fi
            '
        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).fixup.os.${NODE}.log 2>&1 &
       BACKGROUND_PIDS=( ${BACKGROUND_PIDS[*]} $! )
    done
    wait ${BACKGROUND_PIDS[*]}

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
