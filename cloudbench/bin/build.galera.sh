#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    install and start a MariaDB Galera Cluster

    Parameters:

        [ -h|--help|help ]

"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)             CLUSTER="$1"; shift;;

        # MariaDB Options
        --mariadb-source)      MARIADB_SOURCE="$1"; shift;;
        --mariadb-branch)      MARIADB_BRANCH="$1"; shift;;
        --mariadb-commit)      MARIADB_COMMIT="$1"; shift;;
        --mariadb-tarball)     MARIADB_TARBALL="$1"; shift;;

        # Galera Options
        --galera-source)       GALERA_SOURCE="$1"; shift;;
        --galera-branch)       GALERA_BRANCH="$1"; shift;;
        --galera-commit)       GALERA_COMMIT="$1"; shift;;
        --galera-tarball)      GALERA_TARBALL="$1"; shift;;

        --thread-pool)         OPTION_THREAD_POOL=TRUE;;
        --thread-pool-size)    OPTION_THREAD_POOL_SIZE="$1"; shift;;

        # Galera Options
        --slavethreads)        OPTION_SLAVE_THREADS="$1"; shift;;
        --deferflush)          OPTION_DEFERRED_FLUSH=TRUE;;

        --ssl)                 OPTION_SSL=TRUE;;

        -h|--help) echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required CLUSTER not specified." ; exit 1 ; fi

process_connection_info;

if [[ ! ${GALERA_SYSTEMS} ]] ; then GALERA_SYSTEMS=( $(getproperty ${CLUSTER} galera.systems) ) ; fi
if [[ ! ${GALERA_SYSTEMS} ]] ; then echo "Invalid config file.  Expected galera.systems" ; exit 1 ; fi

unset GALERA_EXTERNAL_IPS
unset GALERA_BACKEND_IPS
for SYSTEM in ${GALERA_SYSTEMS[*]} ; do
    GALERA_EXTERNAL_IPS+=( $(getproperty ${SYSTEM} nodes) )
    GALERA_BACKEND_IPS+=( $(get_database_backend_ips ${SYSTEM}) )
done
DB_USER=$(getproperty ${CLUSTER} database.user)
DB_PASSWORD=$(getproperty ${CLUSTER} database.password)

# default MariaDB source; we use the same as for Raft to allow comparison Raft<->Galera
[[ ${MARIADB_SOURCE} ]] || MARIADB_SOURCE="jenkins"
[[ ${MARIADB_BRANCH} ]] || MARIADB_BRANCH="ENTERPRISE/12.3-enterprise-RAFT"
[[ ${MARIADB_COMMIT} ]] || MARIADB_COMMIT="latest"

# default Galera source
[[ ${GALERA_SOURCE} ]] || GALERA_SOURCE="jenkins"
[[ ${GALERA_BRANCH} ]] || GALERA_BRANCH="GALERA-ENTERPRISE/es-mariadb-4.x"
[[ ${GALERA_COMMIT} ]] || GALERA_COMMIT="latest"

# default config options
[[ ${OPTION_SLAVE_THREADS} ]]  || OPTION_SLAVE_THREADS=0       #0 means auto-size
[[ ${OPTION_DEFERRED_FLUSH} ]] || OPTION_DEFERRED_FLUSH=TRUE
[[ ${EVS_SEND_WINDOW} ]]       || EVS_SEND_WINDOW=256
[[ ${EVS_USER_SEND_WINDOW} ]]  || (( EVS_USER_SEND_WINDOW = EVS_SEND_WINDOW / 2 ))
[[ ${GCACHE_SIZE} ]]           || GCACHE_SIZE="1G"

# logging
TEST_NAME=build.galera
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
    STARTSECONDS=$SECONDS

    echo "        COMMAND_LINE          = ${COMMAND_LINE}"
    echo "        CLUSTER               = ${CLUSTER}"
    echo
    echo "        GALERA_SYSTEMS        = ( ${GALERA_SYSTEMS[*]} )"
    echo "        GALERA_EXTERNAL_IPS   = ( ${GALERA_EXTERNAL_IPS[*]} )"
    echo "        GALERA_BACKEND_IPS    = ( ${GALERA_BACKEND_IPS[*]} )"
    echo
    echo "        OPTION_SLAVE_THREADS  = ${OPTION_SLAVE_THREADS}"
    echo "        OPTION_DEFERRED_FLUSH = ${OPTION_DEFERRED_FLUSH}"
    echo "        LOGDIRECTORY          = ${LOGDIRECTORY}"
    echo
    echo "        GALERA_SOURCE         = ${GALERA_SOURCE}"
    echo "        GALERA_BRANCH         = ${GALERA_BRANCH}"
    echo "        GALERA_COMMIT         = ${GALERA_COMMIT}"

    echo
    echo "    ===== Step 1:  Stop, Clean and Install MariaDB + Galera on all nodes =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        for SYSTEM in ${GALERA_SYSTEMS[*]} ; do
            {
                echo "    Cluster = ${CLUSTER}, System = ${SYSTEM}"
                COMMAND="build.system.sh --database mariadb --system ${SYSTEM} --initdb --galera"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
                [[ ${GALERA_SOURCE} ]] && COMMAND="${COMMAND} --galera-source ${GALERA_SOURCE}"
                [[ ${GALERA_BRANCH} ]] && COMMAND="${COMMAND} --galera-branch ${GALERA_BRANCH}"
                [[ ${GALERA_COMMIT} ]] && COMMAND="${COMMAND} --galera-commit ${GALERA_COMMIT}"
                [[ ${GALERA_TARBALL} ]] && COMMAND="${COMMAND} --galera-tarball ${GALERA_TARBALL}"
                [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
                echo "        COMMAND = ${COMMAND}"
                ${COMMAND}
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).install.galera.${SYSTEM}.log 2>&1 &
        done
        wait
    }

    echo
    echo "    ===== Step 2:  Set up Galera Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        CONFIG_FILE="/data/cbench/install/etc/my.cnf.d/02_galera.cnf"
        for HOST in ${GALERA_EXTERNAL_IPS[*]} ; do
            echo
            echo "        HOST = ${HOST}"
            ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                CONFIG_FILE="'${CONFIG_FILE}'"
                GALERA_BACKEND_IPS=('${GALERA_BACKEND_IPS[*]}')
                SLAVE_THREADS="'${OPTION_SLAVE_THREADS}'"
                GCACHE_SIZE="'${GCACHE_SIZE}'"
                EVS_USER_SEND_WINDOW="'${EVS_USER_SEND_WINDOW}'"
                EVS_SEND_WINDOW="'${EVS_SEND_WINDOW}'"
                (( ${SLAVE_THREADS} == 0 )) && ((SLAVE_THREADS = $(grep -c processor /proc/cpuinfo) * 3))
                LIBGALERA=$(find /data/cbench/install/lib/galera -name libgalera_smm.so)
                LIBGALERA=$(find /data/cbench/install/lib/galera -name libgalera_enterprise_smm.so)
                {
                    echo
                    echo "[mariadb]"
                    echo "wsrep_on = ON"
                    echo "binlog_format = ROW"
                    echo "binlog_row_image = MINIMAL"
                    echo "wsrep_provider = ${LIBGALERA}"
                    echo "wsrep_provider_options = \"gcache.size=${GCACHE_SIZE}; evs.user_send_window=${EVS_USER_SEND_WINDOW}; evs.send_window=${EVS_SEND_WINDOW}\""
                    echo "wsrep_cluster_address = gcomm://$(echo ${GALERA_BACKEND_IPS[*]} | sed "s/^ //g;s/ /,/g" )"
                    echo "wsrep_slave_threads = ${SLAVE_THREADS}"
                    echo "wsrep_sst_method = rsync_wan"
                    echo "innodb_autoinc_lock_mode = 2"
                } > ${CONFIG_FILE}
                '

            if [[ ${OPTION_DEFERRED_FLUSH} == TRUE ]] ; then
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) "
                    echo 'innodb_flush_log_at_trx_commit = 2' >> ${CONFIG_FILE}
                "
            fi

            CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)
            if [[ ${CLUSTER_TYPE} == 'galera_masterslave' ]] ; then
            # for Master/Slave configurations, turn off auto_increment_control so sysbench and other similar workloads will work
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) "
                    echo 'wsrep_auto_increment_control = 0' >> ${CONFIG_FILE}
                "
            fi

            ssh $(get_ssh_connection ${SYSTEM} ${HOST}) "
                cat ${CONFIG_FILE}
            "

        done
    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).setup.galera.log 2>&1

    echo
    echo "    ===== Step 3:  Start up Galera Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo
        echo "    Starting Galera Nodes"
        echo
        unset PIDS
        for (( IDX=0; IDX<${#GALERA_EXTERNAL_IPS[@]}; IDX++ )) ; do
            echo
            echo "        Starting Node ${IDX} - ${GALERA_EXTERNAL_IPS[${IDX}]}"
            echo
            ssh $(get_ssh_connection ${SYSTEM} ${GALERA_EXTERNAL_IPS[${IDX}]}) '
                uname -n
                [[ -f /data/cbench/install/etc/mariadb-enterprise.cnf ]] && rm /data/cbench/install/etc/mariadb-enterprise.cnf
                export PATH=/data/cbench/install/bin:/data/cbench/install/scripts:${PATH}
                mariadb-install-db --auth-root-authentication-method=normal
                if (( '${IDX}' == 0 )) ; then
                    mariadbd-safe --wsrep-new-cluster &
                else
                    mariadbd-safe &
                fi
                timeout=180
                while [[ ${timeout} -gt 0 ]]
                do
                  mariadb-admin -S /data/cbench/mariadb.sock -u root -b -s ping && break
                  ((timeout = ${timeout} - 1))
                  sleep 1
                done
                (( ${timeout} == 0 )) && echo "Error: Galera did not start for 180 sec"
            ' &
            PIDS=( ${PIDS[*]} $! )
            # delay a bit after starting donor node
            sleep 20
        done
        wait ${PIDS[*]}

        echo
        echo "    Check Galera Nodes"
        echo
        for (( IDX=0; IDX<${#GALERA_EXTERNAL_IPS[@]}; IDX++ )) ; do
            echo
            echo "        Check Node = ${IDX} - ${GALERA_EXTERNAL_IPS[${IDX}]}"
            echo
            echo "            Check Node = ${IDX} - mariadb"
            echo
            ssh $(get_ssh_connection ${SYSTEM} ${GALERA_EXTERNAL_IPS[${IDX}]}) "/data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e \"show global status like 'wsrep_cluster_size';\""
        done

        echo
        echo "    ===== Database Security =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        # this needs to be done on leader node only
        ssh $(get_ssh_connection ${SYSTEM} ${GALERA_EXTERNAL_IPS[0]}) "
            /data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e\"
                CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
                GRANT ALL ON *.* TO '${DB_USER}'@'%';
                GRANT PROCESS, REPLICATION CLIENT ON *.* TO '${DB_USER}'@'%';
                CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
                GRANT ALL ON *.* TO '${DB_USER}'@'localhost';
                GRANT PROCESS, REPLICATION CLIENT ON *.* TO '${DB_USER}'@'localhost';
                CREATE USER IF NOT EXISTS 'prometheus'@'localhost' IDENTIFIED VIA unix_socket WITH MAX_USER_CONNECTIONS 3;
                GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'prometheus'@'localhost';
                FLUSH PRIVILEGES;
            "
        for SYSTEM in $(get_property ${CLUSTER} galera.systems) ; do
            start_prometheus_mysqld_exporter
        done

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).startup.galera.log 2>&1

    echo
    for SYSTEM in ${GALERA_SYSTEMS[*]} ; do
        echo "    System: ${SYSTEM}"
        echo "        Database Connection: mariadb $(get_database_connection ${SYSTEM})"
        echo "        Version: $(mariadb -sN $(get_database_connection ${SYSTEM}) -e 'select version();')"
    done

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
