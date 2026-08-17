#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Snapshot a mariadb database

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
        --cluster)      CLUSTER="$1"; shift;;

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

process_connection_info;

TEST_NAME=${INVOCATION:-unknown}.mariadb.snapshot
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

    CLUSTERTYPE=$(get_property ${CLUSTER} cluster.type)

    SYSTEMS=( $(get_property ${CLUSTER} mariadb.systems) )
    SYSTEMS+=( $(get_property ${CLUSTER} master.systems) )
    SYSTEMS+=( $(get_property ${CLUSTER} slave.systems) )
    SYSTEMS+=( $(get_property ${CLUSTER} galera.systems) )
    SYSTEMS+=( $(get_property ${CLUSTER} raft.systems) )

    echo
    echo "        $0 $COMMAND_LINE"
    echo
    echo "            CLUSTER     = ${CLUSTER}"
    echo "            CLUSTERTYPE = ${CLUSTERTYPE}"
    echo "            SYSTEMS     = ( ${SYSTEMS[*]} )"
    echo

    for SYSTEM in ${SYSTEMS[*]} ; do

        echo "            SYSTEM     = ${SYSTEM}"
        echo "            Database Connection : mariadb $(get_database_connection ${SYSTEM})"

        {
            [[ -d ${LOGDIRECTORY}/${SYSTEM} ]] || mkdir -p ${LOGDIRECTORY}/${SYSTEM}

            echo "            select @@version"
            mariadb -sN $(get_database_connection ${SYSTEM}) -e "select @@version" > ${LOGDIRECTORY}/${SYSTEM}/version.txt
            echo "            show global status"
            mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show global status" > ${LOGDIRECTORY}/${SYSTEM}/global.status.txt
            echo "            show global variables"
            mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show global variables" > ${LOGDIRECTORY}/${SYSTEM}/global.variables.txt
            echo "            show engine innodb status"
            mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show engine innodb status\G" > ${LOGDIRECTORY}/${SYSTEM}/innodb.status.txt

            if [[ ${CLUSTERTYPE} == "mariadb_replication" ]] ; then
                echo "            show master status"
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show master status\G" > ${LOGDIRECTORY}/${SYSTEM}/master.status.txt
                echo "            show slave status"
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show slave status\G" > ${LOGDIRECTORY}/${SYSTEM}/slave.status.txt
                echo "            show slave hosts"
                mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show slave hosts" > ${LOGDIRECTORY}/${SYSTEM}/slave.hosts.txt
            fi

            #if [[ ${CLUSTERTYPE} == galera_* ]] ; then
                #echo "            show wsrep_membership"
                #mariadb -sN $(get_database_connection ${SYSTEM}) -e "show wsrep_membership" > ${LOGDIRECTORY}/${SYSTEM}/wsrep_membership.txt
                #echo "            show wsrep_status"
                #mariadb -sN $(get_database_connection ${SYSTEM}) -e "show wsrep_status" > ${LOGDIRECTORY}/${SYSTEM}/wsrep_status.txt
            #fi

            if [[ ${CLUSTERTYPE} == raft_* ]] ; then
                echo "            show raft status"
                mariadb -sE $(get_database_connection ${SYSTEM}) -e "SELECT * FROM INFORMATION_SCHEMA.RAFT_STATUS" > ${LOGDIRECTORY}/${SYSTEM}/raft_status.json
            fi

            if (( $(get_property ${SYSTEM} cluster.nodes) != 0  )) ; then
                #We have ssh access to nodes
                for NODE in $(get_property ${SYSTEM} nodes) ; do
                    echo
                    echo "            NODE     = ${NODE}"
                    echo "            ssh Connection : ssh $(get_ssh_connection ${SYSTEM} ${NODE})"

                    echo "            Config Files"
                    [[ -d ${LOGDIRECTORY}/${SYSTEM}/conf ]] || mkdir -p ${LOGDIRECTORY}/${SYSTEM}/conf
                    CONFIG_FILES=(
                        /data/cbench/install/etc/my.cnf
                        /data/cbench/install/etc/my.cnf.d/01_server.cnf
                        /data/cbench/install/etc/my.cnf.d/02_galera.cnf
                        /data/cbench/install/etc/my.cnf.d/02_raft.cnf
                        /data/cbench/install/etc/prometheus.cnf
                    )
                    for FILE in ${CONFIG_FILES[*]} ; do
                        D=${LOGDIRECTORY}/${SYSTEM}/conf/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                        ssh $(get_ssh_connection ${SYSTEM}) "[[ -e ${FILE} ]] && cat ${FILE}" > ${D}
                        [[ -s ${D} ]] || rm -f ${D}
                    done

                    echo "            Log Files"
                    [[ -d ${LOGDIRECTORY}/${SYSTEM}/logs ]] || mkdir -p ${LOGDIRECTORY}/${SYSTEM}/logs
                    LOG_FILES=(
                        /data/cbench/datadir/error.log
                        /data/cbench/datadir/slow-query.log
                        /data/cbench/datadir/general.log
                    )
                    for FILE in ${LOG_FILES[*]} ; do
                        D=${LOGDIRECTORY}/${SYSTEM}/logs/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                        ssh $(get_ssh_connection ${SYSTEM}) "[[ -e ${FILE} ]] && tail -1000 ${FILE}" > ${D}
                        [[ -s ${D} ]] || rm -f ${D}
                    done

                    echo "            Data Size"
                    ssh $(get_ssh_connection ${SYSTEM} ${NODE}) 'sudo du -sh /data/cbench/datadir/*' > ${LOGDIRECTORY}/${SYSTEM}/du.txt
                done
            fi

        } > ${LOGDIRECTORY}/snapshot.${SYSTEM}.log 2>&1 &

    done
    wait

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
