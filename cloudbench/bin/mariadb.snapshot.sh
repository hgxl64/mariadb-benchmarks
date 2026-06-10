#!/bin/bash

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
        --cluster)      CLUSTER="$1";       shift;;
        -h|--help)      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required CLUSTER paramater not provided" ; echo -e "$0 ${COMMAND_LINE}" ; exit 1 ; fi

process_connection_info;

TEST_NAME=mariadb.snapshot
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
    SYSTEMS=( ${SYSTEMS[*]} $(get_property ${CLUSTER} mariadb.systems) )
    SYSTEMS=( ${SYSTEMS[*]} $(get_property ${CLUSTER} slave.systems) )
    SYSTEMS=( ${SYSTEMS[*]} $(get_property ${CLUSTER} galera.systems) )

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
            mkdir -p ${LOGDIRECTORY}/${SYSTEM}

            echo "            SYSTEM     = ${SYSTEM}"
            echo

            echo "            Database Connection : $(get_database_connection ${SYSTEM})"
            echo

            echo "            select @@version"
            time mariadb -sN $(get_database_connection ${SYSTEM}) -e "select @@version;" > ${LOGDIRECTORY}/${SYSTEM}/version.txt
            echo "            show global status"
            time mariadb -sN $(get_database_connection ${SYSTEM}) -e "show global status;" > ${LOGDIRECTORY}/${SYSTEM}/global.status.txt
            echo "            show global variables"
            time mariadb -sN $(get_database_connection ${SYSTEM}) -e "show global variables;" > ${LOGDIRECTORY}/${SYSTEM}/global.variables.txt
            echo "            show engine innodb status"
            time mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show engine innodb status\G" > ${LOGDIRECTORY}/${SYSTEM}/innodb.status.txt
            echo "            show master status"
            time mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show master status\G" > ${LOGDIRECTORY}/${SYSTEM}/master.status.txt
            echo "            show slave status"
            time mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show slave status\G" > ${LOGDIRECTORY}/${SYSTEM}/slave.status.txt
            echo "            show slave hosts"
            time mariadb -vvv $(get_database_connection ${SYSTEM}) -e "show slave hosts;" > ${LOGDIRECTORY}/${SYSTEM}/slave.hosts.txt

        #    echo "            show wsrep_membership"
        #    time mariadb -sN $(get_database_connection ${SYSTEM}) -e "show wsrep_membership;" > ${LOGDIRECTORY}/${SYSTEM}/wsrep_membership.txt
        #    echo "            show wsrep_status"
        #    time mariadb -sN $(get_database_connection ${SYSTEM}) -e "show wsrep_status;" > ${LOGDIRECTORY}/${SYSTEM}/wsrep_status.txt

        #    echo "            mysqldump"
        #    # 200313 - For some reason mysqldump sometimes hangs on a slave systems.  Workaround ... timeout the command after 10s
        #    COMMAND="mysqldump $(get_database_connection ${SYSTEM}) --no-data --force --all-databases --ignore-database=mysql"
        #    echo "                COMMAND = ${COMMAND}"
        #    timeout -v -k 10 10 "${COMMAND}" > ${LOGDIRECTORY}/${SYSTEM}/mysqldump.ddl.txt 2> ${LOGDIRECTORY}/${SYSTEM}/mysqldump.error.txt

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
                        /data/cbench/install/etc/my.cnf
                        /data/cbench/install/etc/my.cnf.d/01_server.cnf
                        /data/cbench/install/etc/my.cnf.d/02_galera.cnf
                    )
                    for FILE in ${CONFIG_FILES[*]} ; do
                        CONTENT=$(ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "[[ -e ${FILE} ]] && cat ${FILE}")
                        [[ ${CONTENT} ]] && echo ${CONTENT} > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/config/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                    done
                    echo
                    echo "            Log Files"
                    mkdir -p ${LOGDIRECTORY}/${SYSTEM}/${NODE}/logs
                    LOG_FILES=(
                        /data/cbench/datadir/error.log
                        /data/cbench/datadir/slow-query.log
                        /data/cbench/datadir/general.log
                        /data/cbench/install/var/log/maxscale/maxscale.log
                    )
                    for FILE in ${LOG_FILES[*]} ; do
                        CONTENT=$(ssh $(get_ssh_connection ${SYSTEM} ${NODE}) "[[ -e ${FILE} ]] && sudo tail -1000 ${FILE}")
                        [[ ${CONTENT} ]] && echo ${CONTENT} > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/logs/$(echo ${FILE} | rev | cut -d'/' -f 1 | rev)
                    done

                    echo
                    echo "            Data Size"
                    ssh $(get_ssh_connection ${SYSTEM} ${NODE}) 'sudo du -sh /data/cbench/datadir/*' > ${LOGDIRECTORY}/${SYSTEM}/${NODE}/du.txt
                done
            fi

        } > ${LOGDIRECTORY}/snapshot.${SYSTEM}.log 2>&1 &

    done
    wait

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
