#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    install and start a MariaDB Raft Cluster

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

        # Raft Options
        --raft-source)         RAFT_SOURCE="$1"; shift;;
        --raft-branch)         RAFT_BRANCH="$1"; shift;;
        --raft-commit)         RAFT_COMMIT="$1"; shift;;
        --raft-tarball)        RAFT_TARBALL="$1"; shift;;

        --thread-pool)         OPTION_THREAD_POOL=TRUE;;
        --thread-pool-size)    OPTION_THREAD_POOL_SIZE="$1"; shift;;

        # Raft Options
        --slavethreads)        OPTION_SLAVE_THREADS="$1"; shift;;
        --deferflush)          OPTION_DEFERRED_FLUSH=TRUE;;
        --raft-ssl)            OPTION_RAFT_SSL=TRUE;;

        --ssl)                 OPTION_SSL=TRUE;;

        -h|--help) echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${CLUSTER} ]] ; then echo "Required CLUSTER not specified." ; exit 1 ; fi

process_connection_info;

if [[ ! ${RAFT_SYSTEMS} ]] ; then RAFT_SYSTEMS=( $(getproperty ${CLUSTER} raft.systems) ) ; fi
if [[ ! ${RAFT_SYSTEMS} ]] ; then echo "Invalid config file.  Expected raft.systems" ; exit 1 ; fi

unset RAFT_EXTERNAL_IPS
unset RAFT_BACKEND_IPS
for SYSTEM in ${RAFT_SYSTEMS[*]} ; do
    RAFT_EXTERNAL_IPS+=( $(getproperty ${SYSTEM} nodes) )
    RAFT_BACKEND_IPS+=( $(get_database_backend_ips ${SYSTEM}) )
done
DB_USER=$(getproperty ${CLUSTER} database.user)
DB_PASSWORD=$(getproperty ${CLUSTER} database.password)

# default MariaDB source; RAFT needs special raft-enabled build
[[ ${MARIADB_SOURCE} ]] || MARIADB_SOURCE="jenkins"
[[ ${MARIADB_BRANCH} ]] || MARIADB_BRANCH="ENTERPRISE/12.3-enterprise-RAFT"
[[ ${MARIADB_COMMIT} ]] || MARIADB_COMMIT="latest"

# default Raft source
[[ ${RAFT_SOURCE} ]] || RAFT_SOURCE="jenkins"
[[ ${RAFT_BRANCH} ]] || RAFT_BRANCH="CRAFT/main"
[[ ${RAFT_COMMIT} ]] || RAFT_COMMIT="latest"

# default config options
[[ ${OPTION_SLAVE_THREADS} ]]  || OPTION_SLAVE_THREADS=0       #0 means auto-size
[[ ${OPTION_DEFERRED_FLUSH} ]] || OPTION_DEFERRED_FLUSH=TRUE   #relaxed InnoDB flushing
[[ ${OPTION_RAFT_SSL} ]]  || OPTION_RAFT_SSL=FALSE             #comm is local, why SSL?
[[ ${RAFT_FLOW_CONTROL_DRIFT_LIMIT} ]]       || RAFT_FLOW_CONTROL_DRIFT_LIMIT=1000
[[ ${RAFT_FLOW_CONTROL_MAX_THROTTLE_RATE} ]] || RAFT_FLOW_CONTROL_MAX_THROTTLE_RATE=1000


# logging
TEST_NAME=build.raft
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
    echo "        RAFT_SYSTEMS          = ( ${RAFT_SYSTEMS[*]} )"
    echo "        RAFT_EXTERNAL_IPS     = ( ${RAFT_EXTERNAL_IPS[*]} )"
    echo "        RAFT_BACKEND_IPS      = ( ${RAFT_BACKEND_IPS[*]} )"
    echo
    echo "        OPTION_SLAVE_THREADS  = ${OPTION_SLAVE_THREADS}"
    echo "        OPTION_DEFERRED_FLUSH = ${OPTION_DEFERRED_FLUSH}"
    echo "        LOGDIRECTORY          = ${LOGDIRECTORY}"
    echo
    echo "        RAFT_SOURCE           = ${RAFT_SOURCE}"
    echo "        RAFT_BRANCH           = ${RAFT_BRANCH}"
    echo "        RAFT_COMMIT           = ${RAFT_COMMIT}"

    echo
    echo "    ===== Step 1:  Stop, Clean and Install MariaDB + Raft on all nodes =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        for SYSTEM in ${RAFT_SYSTEMS[*]} ; do
            {
                echo "    Cluster = ${CLUSTER}, System = ${SYSTEM}"
                COMMAND="build.system.sh --database mariadb --system ${SYSTEM} --initdb --raft"
                [[ ${OPTION_THREAD_POOL} ]] && COMMAND="${COMMAND} --thread-pool"
                [[ ${OPTION_THREAD_POOL_SIZE} ]] && COMMAND="${COMMAND} --thread-pool-size ${OPTION_THREAD_POOL_SIZE}"
                [[ ${MARIADB_SOURCE} ]] && COMMAND="${COMMAND} --mariadb-source ${MARIADB_SOURCE}"
                [[ ${MARIADB_BRANCH} ]] && COMMAND="${COMMAND} --mariadb-branch ${MARIADB_BRANCH}"
                [[ ${MARIADB_COMMIT} ]] && COMMAND="${COMMAND} --mariadb-commit ${MARIADB_COMMIT}"
                [[ ${MARIADB_TARBALL} ]] && COMMAND="${COMMAND} --mariadb-tarball ${MARIADB_TARBALL}"
                [[ ${RAFT_SOURCE} ]] && COMMAND="${COMMAND} --raft-source ${RAFT_SOURCE}"
                [[ ${RAFT_BRANCH} ]] && COMMAND="${COMMAND} --raft-branch ${RAFT_BRANCH}"
                [[ ${RAFT_COMMIT} ]] && COMMAND="${COMMAND} --raft-commit ${RAFT_COMMIT}"
                [[ ${RAFT_TARBALL} ]] && COMMAND="${COMMAND} --raft-tarball ${RAFT_TARBALL}"
                [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --ssl"
                echo "        COMMAND = ${COMMAND}"
                ${COMMAND}
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).install.raft.${SYSTEM}.log 2>&1 &
        done
        wait
    }

    echo
    echo "    ===== Step 2:  Set up Raft Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {
        CONFIG_FILE="/data/cbench/install/etc/my.cnf.d/02_raft.cnf"
        for HOST in ${RAFT_EXTERNAL_IPS[*]} ; do
            echo
            echo "        HOST = ${HOST}"
            ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                CONFIG_FILE="'${CONFIG_FILE}'"
                RAFT_BACKEND_IPS=( '${RAFT_BACKEND_IPS[*]}' )
                SLAVE_THREADS="'${OPTION_SLAVE_THREADS}'"
                OPTION_RAFT_SSL="'${OPTION_RAFT_SSL}'"
                RAFT_FLOW_CONTROL_DRIFT_LIMIT="'${RAFT_FLOW_CONTROL_DRIFT_LIMIT}'"
                RAFT_FLOW_CONTROL_MAX_THROTTLE_RATE="'${RAFT_FLOW_CONTROL_MAX_THROTTLE_RATE}'"
                (( ${SLAVE_THREADS} == 0 )) && ((SLAVE_THREADS = $(grep -c processor /proc/cpuinfo) * 3))
                {
                    echo
                    echo "[mariadb]"
                    echo
                    echo "plugin-load-add=raft"
                    echo "raft-flow-control-drift-limit=${RAFT_FLOW_CONTROL_DRIFT_LIMIT}"
                    echo "raft-flow-control-max-throttle-rate=${RAFT_FLOW_CONTROL_MAX_THROTTLE_RATE}"
                    if [[ ${OPTION_RAFT_SSL} == TRUE ]] ; then
                        echo "raft-have-ssl=on
                    else
                        echo "raft-have-ssl=off
                    fi
                    echo
                    echo "wsrep_on = ON"
                    echo "wsrep_provider = raft"
                    echo "binlog_format = ROW"
                    echo "binlog_row_image = MINIMAL"
                    echo "wsrep_cluster_address = gcomm://$(echo ${RAFT_BACKEND_IPS[*]} | sed "s/^ //g;s/ /,/g" )"
                    echo "wsrep_slave_threads = ${SLAVE_THREADS}"
                    echo "wsrep_sst_method = rsync_wan"
                    echo "innodb_autoinc_lock_mode = 2"
                } > ${CONFIG_FILE}"
                '

            if [[ ${OPTION_DEFERRED_FLUSH} == TRUE ]] ; then
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) "
                    echo 'innodb_flush_log_at_trx_commit = 2' >> ${CONFIG_FILE}
                "
            fi

            CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)
            if [[ ${CLUSTER_TYPE} == 'raft_masterslave' ]] ; then
            # for Master/Slave configurations, turn off auto_increment_control so sysbench and other similar workloads will work
                ssh $(get_ssh_connection ${SYSTEM} ${HOST}) "
                    echo 'wsrep_auto_increment_control = 0' >> ${CONFIG_FILE}
                "
            fi

            ssh $(get_ssh_connection ${SYSTEM} ${HOST}) '
                CONFIG_FILE="'${CONFIG_FILE}'"
                cat ${CONFIG_FILE}
            '

        done
    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).setup.raft.log 2>&1

    echo
    echo "    ===== Step 3:  Start Raft Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo
        echo "    Starting Raft Nodes"
        echo
        unset PIDS
        for (( IDX=0; IDX<${#RAFT_EXTERNAL_IPS[@]}; IDX++ )) ; do
            echo
            echo "        Starting Node ${IDX} - ${RAFT_EXTERNAL_IPS[${IDX}]}"
            echo
            ssh $(get_ssh_connection ${SYSTEM} ${RAFT_EXTERNAL_IPS[${IDX}]}) '
                uname -n
                [[ -f /data/cbench/install/etc/mariadb-enterprise.cnf ]] && rm /data/cbench/install/etc/mariadb-enterprise.cnf
                export PATH=/data/cbench/install/bin:/data/cbench/install/scripts:${PATH}
                mariadb-install-db --auth-root-authentication-method=normal
                if (( '${IDX}' == 0 )) ; then
                    mariadbd-safe --plugin-maturity=gamma --wsrep-new-cluster &
                else
                    mariadbd-safe --plugin-maturity=gamma &
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
        echo "    Check Raft Nodes"
        echo
        for (( IDX=0; IDX<${#RAFT_EXTERNAL_IPS[@]}; IDX++ )) ; do
            echo
            echo "        Check Node = ${IDX} - ${RAFT_EXTERNAL_IPS[${IDX}]}"
            echo
            echo "            Check Node = ${IDX} - mariadb"
            echo
            ssh $(get_ssh_connection ${SYSTEM} ${RAFT_EXTERNAL_IPS[${IDX}]}) "/data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e \"show global status like 'wsrep_cluster_size';\""
        done

        echo
        echo "    ===== Database Security =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        # this needs to be done on leader node only
        ssh $(get_ssh_connection ${SYSTEM} ${RAFT_EXTERNAL_IPS[0]}) "
            /data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e\"
                CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
                GRANT ALL ON *.* TO '${DB_USER}'@'%';
                GRANT PROCESS, REPLICATION CLIENT TO '${DB_USER}'@'%';
                CREATE USER '${DB_USER}'@'127.0.0.1' IDENTIFIED BY '${DB_PASSWORD}';
                GRANT ALL ON *.* TO '${DB_USER}'@'127.0.0.1';
                GRANT PROCESS, REPLICATION CLIENT TO '${DB_USER}'@'127.0.0.1';
                CREATE USER IF NOT EXISTS 'prometheus'@'localhost' IDENTIFIED VIA unix_socket WITH MAX_USER_CONNECTIONS 3;
                GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'prometheus'@'localhost';
                flush privileges;\"
            "
        for SYSTEM in $(get_property ${CLUSTER} raft.systems) ; do
            start_prometheus_mysqld_exporter
        done

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).startup.raft.log 2>&1

    echo
    for SYSTEM in ${RAFT_SYSTEMS[*]} ; do
        echo "    System: ${SYSTEM}"
        echo "        Database Connection: mariadb $(get_database_connection ${SYSTEM})"
        echo "        Version: $(mariadb -sN $(get_database_connection ${SYSTEM}) -e 'select version();')"
    done

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
