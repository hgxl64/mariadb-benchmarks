#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    xxx

    Parameters:

        [ -h|--help|help ]

"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)             CLUSTER="$1"; shift;;

        # MariaDB Options
        --source)              SOURCE="$1"; shift;;
        --branch)              BRANCH="$1"; shift;;
        --commit)              COMMIT="$1"; shift;;

        # Galera Options
        --galera-source)       GALERA_SOURCE="$1"; shift;;
        --galera-branch)       GALERA_BRANCH="$1"; shift;;
        --galera-commit)       GALERA_COMMIT="$1"; shift;;

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
    GALERA_EXTERNAL_IPS=( ${GALERA_EXTERNAL_IPS[*]} $(getproperty ${SYSTEM} nodes) )
    GALERA_BACKEND_IPS=( ${GALERA_BACKEND_IPS[*]} $(get_database_backend_ips ${SYSTEM}) )
done
DB_USER=$(getproperty ${CLUSTER} database.user)
DB_PASSWORD=$(getproperty ${CLUSTER} database.password)

# default Galera source
[[ ${GALERA_SOURCE} ]] || GALERA_SOURCE="jenkins"
[[ ${GALERA_BRANCH} ]] || GALERA_BRANCH="GALERA-ENTERPRISE/es-mariadb-4.x"
[[ ${GALERA_COMMIT} ]] || GALERA_COMMIT="latest"

# default config options
[[ ${OPTION_SLAVE_THREADS} ]]  || OPTION_SLAVE_THREADS=0       #0 means auto-size
[[ ${OPTION_DEFERRED_FLUSH} ]] || OPTION_DEFERRED_FLUSH=TRUE

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
                [[ ${SOURCE} ]] && COMMAND="${COMMAND} --source ${SOURCE}"
                [[ ${BRANCH} ]] && COMMAND="${COMMAND} --branch ${BRANCH}"
                [[ ${COMMIT} ]] && COMMAND="${COMMAND} --commit ${COMMIT}"
                [[ ${GALERA_SOURCE} ]] && COMMAND="${COMMAND} --galera-source ${GALERA_SOURCE}"
                [[ ${GALERA_BRANCH} ]] && COMMAND="${COMMAND} --galera-branch ${GALERA_BRANCH}"
                [[ ${GALERA_COMMIT} ]] && COMMAND="${COMMAND} --galera-commit ${GALERA_COMMIT}"
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
                GALERA_BACKEND_IPS=("'${GALERA_BACKEND_IPS[*]}'")
                SLAVE_THREADS="'${OPTION_SLAVE_THREADS}'"
                CONFIG_FILE="'${CONFIG_FILE}'"
                (( ${SLAVE_THREADS} == 0 )) || ((SLAVE_THREADS=$(grep -c processor /proc/cpuinfo) * 3))
                LIBGALERA=$(find /data/cbench/install/lib/galera -name libgalera_smm.so)
                LIBGALERA=$(find /data/cbench/install/lib/galera -name libgalera_enterprise_smm.so)
                echo "
[galera]
wsrep_on = ON
binlog_format = ROW
binlog_row_image = MINIMAL
wsrep_provider = ${LIBGALERA}
wsrep_provider_options = \"gcache.size = 1G; evs.user_send_window = 128; evs.send_window = 256\"
wsrep_cluster_address = gcomm://$(echo ${GALERA_BACKEND_IPS[*]} | sed "s/^ //g;s/ /,/g" )
wsrep_slave_threads = ${SLAVE_THREADS}
wsrep_sst_method = rsync_wan
innodb_autoinc_lock_mode = 2" > ${CONFIG_FILE}
                '

            if [[ ${OPTION_DEFERRED_FLUSH} == TRUE ]] ; then
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                    CONFIG_FILE="'${CONFIG_FILE}'"
                    echo "innodb_flush_log_at_trx_commit = 2" >> ${CONFIG_FILE}
                '
            fi

            CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)
            if [[ ${CLUSTER_TYPE} == 'galera_masterslave' ]] ; then
            # for Master/Slave configurations, turn off auto_increment_control so sysbench and other similar workloads will work
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                    CONFIG_FILE="'${CONFIG_FILE}'"
                    echo "wsrep_auto_increment_control = 0" >> ${CONFIG_FILE}
                '
            fi

            ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                CONFIG_FILE="'${CONFIG_FILE}'"
                cat ${CONFIG_FILE}
            '

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
                  mariadb-admin -u root -b -s ping && break
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
                create user '${DB_USER}'@'%' identified by '${DB_PASSWORD}';
                grant all on *.* to '${DB_USER}'@'%';
                grant reload on *.* to '${DB_USER}'@'%';
                flush privileges;\"
            "

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
