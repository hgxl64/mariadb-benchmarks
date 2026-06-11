#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Check a cluster
      [ --cluster <<clustername>> ]
      [ -h|--help ]
    Notes:

"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        # Connection Info
        --cluster)          CLUSTER="$1"; shift;;

        --debug)            OPTION_DEBUG=TRUE;;
        -h|--help)          echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]] || { echo "Required CLUSTER not specified"; echo -e "$0 ${COMMAND_LINE}"; exit 1; }

process_connection_info;

TEST_NAME=check.cluster

if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{

    echo
    echo "===== Begin $0 =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    STARTSECONDS=$SECONDS

    echo "
        $0 ${COMMAND_LINE}

            TESTID          = ${TESTID}

            CLUSTER         = ${CLUSTER}
            DATABASE        = ${DATABASE}

            CLUSTER_NODES   = ${CLUSTER_NODES[*]}
            DRIVER_NODES    = ${DRIVER_NODES[*]}

        "

    echo
    echo "    ===== Check Database. =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "            Database Version : $(get_database_version)"

    if [[ ${CLUSTER_NODES} ]] ; then
        echo
        echo "    ===== Check Nodes. =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        echo "        Node Connectivity - OS Version "
        lock_semaphore
        for NODE in ${CLUSTER_NODES[*]} ; do
            ssh-keygen -f ${HOME}/.ssh/known_hosts -R ${NODE}
        done
        unlock_semaphore
        for NODE in ${CLUSTER_NODES[*]} ; do
            echo "            ${NODE} : $(ssh $(get_ssh_connection ${CLUSTER} ${NODE}) 'uname -a' 2>/dev/null)"
        done
        echo "        DB Version per Node"
        for NODE in ${CLUSTER_NODES[*]} ; do
            echo "            ${NODE} : $(ssh $(get_ssh_connection ${CLUSTER} ${NODE}) "/data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -sN -e 'select version()'" 2>/dev/null)"
        done
    fi

    if [[ ${MAXSCALE_NODES} ]] ; then
        echo
        echo "    ===== Check MaxScale Nodes. =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        lock_semaphore
        for NODE in ${MAXSCALE_NODES[*]} ; do
            ssh-keygen -f ${HOME}/.ssh/known_hosts -R ${NODE}
        done
        unlock_semaphore
        for NODE in ${MAXSCALE_NODES[*]} ; do
            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                echo "uname: $(uname -a)"
                /data/cbench/install/bin/maxscale --version
                /data/cbench/install/bin/maxctrl list servers
                /data/cbench/install/bin/maxctrl list services
            '
        done
    fi

    if (( ${NUMOFDRIVERS} > 0 )) ; then
        echo
        echo "    ===== Check Drivers. =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        echo "        Driver Node Connectivity - OS Version"
        lock_semaphore
        for NODE in ${DRIVER_NODES[*]} ; do
            ssh-keygen -f ${HOME}/.ssh/known_hosts -R ${NODE}
        done
        unlock_semaphore
        for NODE in ${DRIVER_NODES[*]} ; do
            echo "            ${NODE} : $(ssh $(get_ssh_connection ${CLUSTER} ${NODE}) 'uname -a' 2>/dev/null)"
        done
        echo "        Driver Files"
        for NODE in ${DRIVER_NODES[*]} ; do
            echo "            ${NODE}"
            ssh $(get_ssh_connection ${CLUSTER} ${NODE}) '
                cd /data/cbench
                ls -lR driver
                cd driver/lua && md5sum *.lua
                '
        done
    fi


    echo
    echo "===== End $0  ( Elapsed Seconds = $(( $SECONDS - ${STARTSECONDS} )) ) =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
