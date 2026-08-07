#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

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

        # for which point in time we were called
        --precurve)     PRECURVE=TRUE;  INVOCATION="precurve";;
        --postcurve)    POSTCURVE=TRUE; INVOCATION="postcurve";;
        --pretest)      PRETEST=TRUE;   INVOCATION="pretest";;
        --posttest)     POSTTEST=TRUE;  INVOCATION="posttest";;
        --preload)      PRELOAD=TRUE;   INVOCATION="preload";;
        --postload)     POSTLOAD=TRUE;  INVOCATION="postload";;
        --prerun)       PRERUN=TRUE;    INVOCATION="prerun";;
        --postrun)      POSTRUN=TRUE;   INVOCATION="postrun";;

        -h|--help)      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required CLUSTER paramater not provided" ; echo -e "$0 ${COMMAND_LINE}" ; exit 1 ; fi

SYSTEMS=( $(get_property ${CLUSTER} maxscale.systems) )
[[ ${SYSTEMS} ]] || exit 0

process_connection_info;

TEST_NAME=${INVOCATION:-unknown}.maxscale.snapshot
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo
    echo "    ===== Begin $0 =====  [ $(date -u  +"%Y-%m-%d %H:%M:%S.%3N") ]"
    STARTSECONDS=${SECONDS}


    echo
    echo "        $0 $COMMAND_LINE"
    echo
    echo "            CLUSTER     = ${CLUSTER}"
    echo "            SYSTEMS     = ( ${SYSTEMS[*]} )"
    echo

    for SYSTEM in ${SYSTEMS[*]} ; do

        echo "            SYSTEM     = ${SYSTEM}"

        {
            if (( $(get_property ${SYSTEM} cluster.nodes) != 0  )) ; then
                #We have ssh access to nodes
                for NODE in $(get_property ${SYSTEM} nodes) ; do
                    mkdir -p ${LOGDIRECTORY}/${SYSTEM}
                    echo "            NODE     = ${NODE}"
                    echo "            ssh Connection : $(get_ssh_connection ${SYSTEM} ${NODE})"
                    echo

                    echo "            Config Files"
                    CONFIG_FILES=(
                        /data/cbench/install/etc/maxscale.cnf
                    )
                    for FILE in ${CONFIG_FILES[*]} ; do
                        D=${LOGDIRECTORY}/${SYSTEM}/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                        ssh $(get_ssh_connection ${SYSTEM}) "[[ -e ${FILE} ]] && cat ${FILE}" > ${D}
                        [[ -s ${D} ]] || rm -f ${D}
                    done

                    echo "            Log Files"
                    LOG_FILES=(
                        /data/cbench/install/var/log/maxscale/maxscale.log
                    )
                    for FILE in ${LOG_FILES[*]} ; do
                        D=${LOGDIRECTORY}/${SYSTEM}/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                        ssh $(get_ssh_connection ${SYSTEM}) "[[ -e ${FILE} ]] && tail -1000 ${FILE}" > ${D}
                        [[ -s ${D} ]] || rm -f ${D}
                    done

                    if [[ ${INVOCATION} == "precurve" || ${INVOCATION} == "preload" ]] ; then
                        echo "            Clearing Statistics"
                        SERVERS=$(ssh $(get_ssh_connection ${SYSTEM}) "/data/cbench/install/bin/maxctrl --tsv list servers" | awk '{print $1}')
                        for SERVER in ${SERVERS} ; do
                            echo -n "              Server ${SERVER} "
                            ssh $(get_ssh_connection ${SYSTEM}) "/data/cbench/install/bin/maxctrl clear statistics ${SERVER}"
                        done
                        SERVICES=$(ssh $(get_ssh_connection ${SYSTEM}) "/data/cbench/install/bin/maxctrl --tsv list services" | awk '{print $1}')
                        for SERVICE in ${SERVICES}) ; do
                            echo -n "              Service ${SERVICE} "
                            ssh $(get_ssh_connection ${SYSTEM}) "/data/cbench/install/bin/maxctrl clear statistics ${SERVICE}"
                        done
                    fi

                    echo "            MaxScale Servers and Services"
                    ssh $(get_ssh_connection ${SYSTEM}) "
                        /data/cbench/install/bin/maxctrl2 --format=ascii list servers
                        " > ${LOGDIRECTORY}/${SYSTEM}/list_servers.log
                    ssh $(get_ssh_connection ${SYSTEM}) "
                        /data/cbench/install/bin/maxctrl2 --format=ascii list services
                        " > ${LOGDIRECTORY}/${SYSTEM}/list_services.log
                    ssh $(get_ssh_connection ${SYSTEM}) "
                        /data/cbench/install/bin/maxctrl2 --format=ascii show servers
                        " > ${LOGDIRECTORY}/${SYSTEM}/show_servers.log
                    ssh $(get_ssh_connection ${SYSTEM}) "
                        /data/cbench/install/bin/maxctrl2 --format=ascii show services
                        " > ${LOGDIRECTORY}/${SYSTEM}/show_services.log

                    echo "            Data Sizes"
                    ssh $(get_ssh_connection ${SYSTEM} ${NODE}) 'sudo du -sh /data/cbench/install/var/*' > ${LOGDIRECTORY}/${SYSTEM}/du.txt
                done
            fi

        } > ${LOGDIRECTORY}/snapshot.${SYSTEM}.log 2>&1 &

    done
    wait

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
