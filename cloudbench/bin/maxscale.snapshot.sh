#!/bin/bash

source clustrixbench.sh

USAGE="usage: $0

    Snapshot a MaxScale node

    Options:
        [ --cluster  <<clustername>> ]
        [ -h|--help ]
    Notes:
        1.
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)      CLUSTER="$1";       shift;;
        -h|--help)      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required CLUSTER paramater not provided" ; echo -e "$0 ${COMMAND_LINE}" ; exit 1 ; fi

process_connection_info;

TEST_NAME=maxscale.snapshot
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.${CLUSTER}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo
    echo "    ===== Begin $0 =====  [ $(date -u  +"%Y-%m-%d %H:%M:%S.%3N") ]"
    STARTSECONDS=${SECONDS}

    SYSTEMS=( ${CLUSTER} )
    SYSTEMS=( ${SYSTEMS[*]} $(get_property ${CLUSTER} maxscale.systems) )

    echo
    echo "        $0 $COMMAND_LINE"
    echo
    echo "            CLUSTER     = ${CLUSTER}"
    echo "            SYSTEMS     = ( ${SYSTEMS[*]} )"
    echo

    for SYSTEM in ${SYSTEMS[*]} ; do

        echo "            SYSTEM     = ${SYSTEM}"
        echo

        {
            if (( $(get_property ${SYSTEM} cluster.nodes) != 0  )) ; then
                #We have ssh access to nodes
                for NODE in $(get_property ${SYSTEM} nodes) ; do
                    mkdir -p ${LOGDIRECTORY}/${SYSTEM}/${NODE}
                    echo "            NODE     = ${NODE}"
                    echo
                    echo "            ssh Connection : $(get_ssh_connection ${SYSTEM} ${NODE})"
                    echo
                    echo "        Config Files"
                    mkdir -p ${LOGDIRECTORY}/${SYSTEM}/${NODE}/config
                    CONFIG_FILES=(
                        /data/cbench/install/etc/maxscale.conf
                    )
                    for FILE in ${CONFIG_FILES[*]} ; do
                        CONTENT=$(ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "[[ -e ${FILE} ]] && cat ${FILE}")
                        [[ ${CONTENT} ]] && echo ${CONTENT} > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/config/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                    done
                    echo
                    echo "            Log Files"
                    mkdir -p ${LOGDIRECTORY}/${SYSTEM}/${NODE}/logs
                    LOG_FILES=(
                        /data/cbench/install/var/log/maxscale/maxscale.log
                    )
                    for FILE in ${LOG_FILES[*]} ; do
                        CONTENT=$(ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "[[ -e ${FILE} ]] && sudo tail -1000 ${FILE}")
                        [[ ${CONTENT} ]] && echo ${CONTENT} > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/logs/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                    done

                    echo
                    echo "            Data Size"
                    time {
                        ssh $(get_ssh_connection ${SYSTEM} ${NODE}) 'sudo du -sh /data/clustrix/mariadb/*' > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/du.txt
                    }
                done
            fi

        } > ${LOGDIRECTORY}/snapshot.${SYSTEM}.log 2>&1 &

    done
    wait

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
