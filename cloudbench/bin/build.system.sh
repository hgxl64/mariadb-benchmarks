#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Installs MariaDB and optionally Galera / Raft
    Configures the MariaDB database and starts it (except for Galera/Raft)
    Options:
        [ --database] mariadb ]
        [ --cluster  <<clustername>> ]
        [ -h|--help ]
"

COMMAND_LINE="$@"

unset OPTION_GALERA
unset OPTION_RAFT

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
         # Connection Info
        --cluster)                      CLUSTER="$1"; shift;;
        --system)                       CLUSTER="$1"; shift;;

        # which database
        --database)                     DATABASE="$1"; shift;;
        --initdb)                       OPTION_INITDB=TRUE;;

        # mariadb installation
        --mariadb-source)               MARIADB_SOURCE="$1"; shift;;
        --mariadb-branch)               MARIADB_BRANCH="$1"; shift;;
        --mariadb-commit)               MARIADB_COMMIT="$1"; shift;;
        --mariadb-tarball)              MARIADB_SOURCE="tarball";
                                        MARIADB_TARBALL="$1"; shift;;

        # galera installation
        --galera)                       OPTION_GALERA=TRUE;;
        --galera-source)                GALERA_SOURCE="$1"; shift;;
        --galera-branch)                GALERA_BRANCH="$1"; shift;;
        --galera-commit)                GALERA_COMMIT="$1"; shift;;
        --galera-tarball)               GALERA_SOURCE="tarball";
                                        GALERA_TARBALL="$1"; shift;;

        # galera installation
        --raft)                         OPTION_RAFT=TRUE;;
        --raft-source)                  RAFT_SOURCE="$1"; shift;;
        --raft-branch)                  RAFT_BRANCH="$1"; shift;;
        --raft-commit)                  RAFT_COMMIT="$1"; shift;;
        --raft-tarball)                 RAFT_SOURCE="tarball";
                                        RAFT_TARBALL="$1"; shift;;

        --aws|--gcp|--cloud)            OPTION_CLOUD="--cloud";;
        --arm)                          OPTION_ARM=TRUE;;

        # config generator options
        --performance-config)           OPTION_CONFIG='performance';;

        # options for config generator
        --charset)                      OPTION_CHARSET="$1"; shift;;
        --disable_temp_pool)            OPTION_DISABLE_TEMP_POOL=TRUE;;
        --general_log_file)             OPTION_GENERAL_LOG_FILE="$1"; shift;;
        --innodb_adaptive_hash_index)   OPTION_INNODB_ADAPTIVE_HASH_INDEX="$1"; shift;;
        --innodb_buffer_pool_size)      OPTION_INNODB_BUFFER_POOL_SIZE="$1"; shift;;
        --innodb_buffer_pool_instances) OPTION_INNODB_BUFFER_POOL_INSTANCES="$1"; shift;;
        --innodb_flush_method)          OPTION_INNODB_FLUSH_METHOD="$1"; shift;;
        --innodb_log_buffer_size)       OPTION_INNODB_LOG_BUFFER_SIZE="$1"; shift;;
        --innodb_io_capacity)           OPTION_INNODB_IO_CAPACITY="$1"; shift;;
        --innodb_read_io_threads)       OPTION_INNODB_READ_IO_THREADS="$1"; shift;;
        --innodb_write_io_threads)      OPTION_INNODB_WRITE_IO_THREADS="$1"; shift;;
        --max_connections)              OPTION_MAX_CONNECTIONS="$1"; shift;;
        --performance_schema)           OPTION_PERFORMANCE_SCHEMA="$1"; shift;;
        --port)                         OPTION_DBPORT="$1"; shift;;
        --slow_query_log)               OPTION_SLOW_QUERY_LOG=TRUE;;
        --table_open_cache)             OPTION_TABLE_OPEN_CACHE="$1"; shift;;
        --thread_pool)                  OPTION_THREAD_POOL=TRUE;;
        --thread_pool_size)             OPTION_THREAD_POOL_SIZE="$1"; shift;;
        --thread_pool_max_threads)      OPTION_THREAD_POOL_MAX_THREADS="$1"; shift;;
        --transaction_isolation)        OPTION_TRANSACTION_ISOLATION="$1"; shift;;
        --ssl)                          OPTION_SSL=TRUE;;

        # enable as a Master
        --log_bin|--binlog)             OPTION_MASTER=TRUE;;
        --skip_log_bin|--skip_binlog)   OPTION_MASTER=FALSE;;

        # enable as a Slave of a Master
        --master)                       OPTION_SLAVE="$1"; shift;;
        --gtid)                         OPTION_GTID=TRUE;;

        # replication options
        --binlog_commit_wait_usec)      OPTION_BINLOG_COMMIT_WAIT_USEC="$1"; shift;;
        --binlog_commit_wait_count)     OPTION_BINLOG_COMMIT_WAIT_COUNT="$1"; shift;;
        --semisync_replication)         OPTION_SEMISYNC_REP=TRUE;;
        --semisync_after_commit)        OPTION_SEMISYNC_AFTER_COMMIT=TRUE;;
        --semisync_after_sync)          OPTION_SEMISYNC_AFTER_SYNC=TRUE;;
        --sync_binlog)                  OPTION_SYNC_BINLOG=TRUE;;
        --sync_relaylog)                OPTION_SYNC_RELAYLOG=TRUE;;

        -h|--help)                      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


[[ ${CLUSTER} ]] || { echo "ERROR: Required system name not provided"; echo -e "$USAGE"; exit 1;}
SYSTEM=$(get_property ${CLUSTER} cluster.node1)

process_connection_info;

[[ ${DB_USER} ]]       || DB_USER=$(get_database_user)
[[ ${DB_PASSWORD} ]]   || DB_PASSWORD=$(get_database_password)
[[ ${OPTION_DBPORT} ]] || OPTION_DBPORT=$(get_database_port)
[[ ${OPTION_DBPORT} ]] || OPTION_DBPORT='3306'

# default config generator
[[ ${OPTION_CONFIG} ]] || OPTION_CONFIG='performance'
# default options
[[ ${OPTION_THREAD_POOL} ]] || OPTION_THREAD_POOL=TRUE
[[ ${OPTION_MASTER} ]] || OPTION_MASTER=FALSE
[[ ${OPTION_GTID} ]] || OPTION_GTID=TRUE
[[ ${OPTION_SSL} ]] || OPTION_SSL=FALSE

# default MariaDB source, latest Enterprise branch
[[ ${MARIADB_SOURCE} ]] || MARIADB_SOURCE="jenkins"
[[ ${MARIADB_BRANCH} ]] || MARIADB_BRANCH="ENTERPRISE/12.3-enterprise"
[[ ${MARIADB_COMMIT} ]] || MARIADB_COMMIT="latest"

# target OS
if [[ ! ${OS} ]] ; then
    OS="ubuntu-2404"
    [[ ${OPTION_ARM} = TRUE ]] && OS="ubuntu-2404-arm"
fi

# target architecture
if [[ ! ${ARCH} ]] ; then
    ARCH="x86_64"
    [[ ${OPTION_ARM} = TRUE ]] && ARCH="aarch64"
fi

# allocate a unique server_id
SERVER_ID=$(echo $(get_database_backend_ips ${CLUSTER}) | tr . '\n' | awk '{s = s*256 + $1} END {print s}')

# logging
TEST_NAME=build.system
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${CLUSTER}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.${CLUSTER}
fi
mkdir -p ${LOGDIRECTORY}

{
    echo "
    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]
    "
    STARTSECONDS=$SECONDS

    echo "
        $0 $COMMAND_LINE

            CLUSTER        = ${CLUSTER}
            DATABASE       = ${DATABASE}

            MARIADB_SOURCE = ${MARIADB_SOURCE}
            MARIADB_BRANCH = ${MARIADB_BRANCH}
            MARIADB_COMMIT = ${MARIADB_COMMIT}

            CONFIG         = ${OPTION_CONFIG}
            BINLOG         = ${OPTION_MASTER}
    "
    if [[ ${OPTION_GALERA} == TRUE ]] ; then
        echo "
            OPTION_GALERA  = ${OPTION_GALERA}
            GALERA_SOURCE  = ${GALERA_SOURCE}
            GALERA_BRANCH  = ${GALERA_BRANCH}
            GALERA_COMMIT  = ${GALERA_COMMIT}
        "
    fi
    if [[ ${OPTION_RAFT} == TRUE ]] ; then
        echo "
            OPTION_RAFT    = ${OPTION_RAFT}
            RAFT_SOURCE    = ${RAFT_SOURCE}
            RAFT_BRANCH    = ${RAFT_BRANCH}
            RAFT_COMMIT    = ${RAFT_COMMIT}
        "
    fi

    echo "        Properties File:"
    showproperties

    if [[ ${OPTION_INITDB} ]] ; then
        echo
        echo "    ===== Cleanup Any Previous Database Systems =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time cleandb.sh --cluster ${CLUSTER} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).cleandb.log 2>&1
    fi

    echo
    echo "    ===== Install New Database Software =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

    time {
        if [[ ${DATABASE} == 'mariadb' ]] ; then

            if [[ ${MARIADB_SOURCE} == 'jenkins' ]] ; then
                echo
                echo "        Installing MariaDB Enterprise Server from es-repo.mariadb.net"
                echo

                # make this atomic
                lock_semaphore
                [[ -f build.properties ]] && rm build.properties
                BASE_URL="https://es-repo.mariadb.net/jenkins/${MARIADB_BRANCH}/${MARIADB_COMMIT}"
                echo "        download build.properties"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                            --password=$(vault 'jenkins_es_package_pass') \
                            ${BASE_URL}/build.properties)
                then
                    unlock_semaphore
                    error "failed to download '${BASE_URL}/build.properties'"
                fi
                echo "        found ${BASE_URL}/build.properties"
                COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
                echo "        found commit ${COMMIT}"
                TARGET="${DOWNLOAD_DIR}/mariadb-enterprise-${COMMIT}-${ARCH}.tar.gz"
                if [[ -f ${TARGET} ]] ; then
                    echo "        ${TARGET} already exists, not downloading"
                else
                    VERSION=$(fgrep FULL_VERSION build.properties | cut -d= -f 2)
                    BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/mariadb-enterprise-${VERSION}-Linux-${ARCH}.tar.gz"
                    echo "        downloading '${TARGET}'"
                    echo "        from '${BINTAR_URL}'"
                    time {
                        if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                  --password=$(vault 'jenkins_es_package_pass') \
                                  --quiet ${BINTAR_URL} -O ${TARGET})
                        then
                            unlock_semaphore
                            error "failed to download '${BINTAR_URL}'"
                        fi
                    }
                fi
                rm build.properties
                unlock_semaphore

            elif [[ ${MARIADB_SOURCE} == 'tarball' ]] ; then
                echo
                echo "        Installing MariaDB Enterprise Server from TARBALL"
                echo

                [[ ${MARIADB_TARBALL} ]] || error "no TARBALL given! Exiting"
                TARGET="${DOWNLOAD_DIR}/${MARIADB_TARBALL}"
                [[ -f ${TARGET} ]] || error "${TARGET} doesn't exist! Exiting"
                echo "        found ${TARGET}"

            else
                error "Invalid MariaDB source specified: ${MARIADB_SOURCE}"
            fi

            echo
            echo "        copying ${TARGET} to ${SYSTEM}"
            time {
                if ( ! scp $(get_scp_copy_to_connection ${CLUSTER} ${SYSTEM} ${TARGET} /data/cbench/) ) ; then
                    error "scp to ${SYSTEM} failed"
                fi
            }

            echo
            echo "        unpacking MariaDB"
            time ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
                cd /data/cbench
                [[ -d install ]] || mkdir install
                tar xfz '$(basename ${TARGET})' -C install --strip-components=1
                #remove Enterprise config, it loads AUDIT plugin & more
                [[ -f /data/cbench/install/etc/mariadb-enterprise.cnf ]] && rm /data/cbench/install/etc/mariadb-enterprise.cnf
                [[ -d datadir ]] || mkdir datadir
                cd install
                ln -s ../datadir var
                cd etc
                mkdir my.cnf.d
                {
                    echo "#"
                    echo "# include *.cnf from the config directory"
                    echo "#"
                    echo "!includedir /data/cbench/install/etc/my.cnf.d"
                    echo
                    echo "[client]"
                    echo "socket = /data/cbench/mariadb.sock"
                    echo
                } | sudo tee /etc/my.cnf > my.cnf
            '

            if [[ ${OPTION_GALERA} == TRUE ]] ; then
                if [[ ${GALERA_SOURCE} == 'jenkins' ]] ; then
                    echo
                    echo "        Installing Galera from es-repo.mariadb.net/jenkins"
                    echo

                    # make this atomic
                    lock_semaphore
                    [[ -f build.properties ]] && rm build.properties
                    BASE_URL="https://es-repo.mariadb.net/jenkins/${GALERA_BRANCH}/${GALERA_COMMIT}"
                    echo "        download build.properties"
                    if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                --password=$(vault 'jenkins_es_package_pass') \
                                ${BASE_URL}/build.properties)
                    then
                        unlock_semaphore
                        error "failed to download '${BASE_URL}/build.properties'"
                    fi
                    echo "        found ${BASE_URL}/build.properties"
                    COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
                    echo "        found commit ${COMMIT}"
                    TARGET="${DOWNLOAD_DIR}/galera-enterprise-${COMMIT}-${ARCH}.tar.gz"
                    if [[ -f ${TARGET} ]] ; then
                        echo "        ${TARGET} already exists, not downloading"
                    else
                        DIR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/"
                        echo "        downloading dir list to find package name"
                        if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                  --password=$(vault 'jenkins_es_package_pass') \
                                  ${DIR_URL} -O dirlist)
                        then
                            unlock_semaphore
                            error "failed to download '${DIR_URL}'"
                        fi
                        DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
                        BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/${DISTFILE}"
                        echo
                        echo "        download '${TARGET}'"
                        echo "        from '${BINTAR_URL}'"
                        time {
                            if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                      --password=$(vault 'jenkins_es_package_pass') \
                                      --quiet ${BINTAR_URL} -O ${TARGET})
                            then
                                unlock_semaphore
                                error "failed to download '${BINTAR_URL}'"
                            fi
                        }
                        rm -f dirlist
                    fi
                    rm -f build.properties
                    unlock_semaphore

                elif [[ ${GALERA_SOURCE} == 'tarball' ]] ; then
                    echo
                    echo "        Installing GALERA from TARBALL"
                    echo

                    [[ ${GALERA_TARBALL} ]] || error "no GALERA_TARBALL given! Exiting"
                    TARGET="${DOWNLOAD_DIR}/${GALERA_TARBALL}"
                    [[ -f ${TARGET} ]] || error "${TARGET} doesn't exist! Exiting"
                    echo "        found ${TARGET}"

                else
                    error "Invalid Galera source specified: $GALERA_SOURCE"
                fi

                #finalize Galera installation
                echo
                echo "        copying ${TARGET} to ${SYSTEM}"
                time {
                     if ( ! scp $(get_scp_copy_to_connection ${CLUSTER} ${SYSTEM} ${TARGET} /data/cbench/) ) ; then
                         error "        scp to ${SYSTEM} failed"
                     fi
                }

                echo
                echo "        unpacking Galera"
                time ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
                    cd /data/cbench
                    [[ -d install ]] || mkdir install
                    tar xfz '$(basename ${TARGET})' -C install --strip-components=1
                '
            fi

            if [[ ${OPTION_RAFT} == TRUE ]] ; then
                if [[ ${RAFT_SOURCE} == 'jenkins' ]] ; then
                    echo
                    echo "        Installing Raft from es-repo.mariadb.net/jenkins"
                    echo

                    # make this atomic
                    lock_semaphore
                    [[ -f build.properties ]] && rm build.properties
                    BASE_URL="https://es-repo.mariadb.net/jenkins/${RAFT_BRANCH}/${RAFT_COMMIT}"
                    echo "        download build.properties"
                    if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                --password=$(vault 'jenkins_es_package_pass') \
                                ${BASE_URL}/build.properties)
                    then
                        unlock_semaphore
                        error "failed to download '${BASE_URL}/build.properties'"
                    fi
                    echo "        found ${BASE_URL}/build.properties"
                    COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
                    echo "        found commit ${COMMIT}"
                    TARGET="${DOWNLOAD_DIR}/mariadb-raft-${COMMIT}-${ARCH}.tar.gz"
                    if [[ -f ${TARGET} ]] ; then
                        echo "        ${TARGET} already exists, not downloading"
                    else
                        DIR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/"
                        echo "        downloading dir list to find package name"
                        if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                  --password=$(vault 'jenkins_es_package_pass') \
                                  ${DIR_URL} -O dirlist)
                        then
                            unlock_semaphore
                            error "failed to download '${DIR_URL}'"
                        fi
                        DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
                        BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/${DISTFILE}"
                        echo "        downloading '${TARGET}'"
                        echo "        from '${BINTAR_URL}'"
                        time {
                            if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                                      --password=$(vault 'jenkins_es_package_pass') \
                                      ${BINTAR_URL} -O ${TARGET})
                            then
                                unlock_semaphore
                                error "failed to download '${BINTAR_URL}'"
                            fi
                        }
                        rm -f dirlist
                    fi
                    rm build.properties
                    unlock_semaphore

                elif [[ ${RAFT_SOURCE} == 'tarball' ]] ; then
                    echo
                    echo "        Installing RAFT from TARBALL"
                    echo

                    [[ ${RAFT_TARBALL} ]] || error "no RAFT_TARBALL given! Exiting"
                    TARGET="${DOWNLOAD_DIR}/${RAFT_TARBALL}"
                    [[ -f ${TARGET} ]] || error "${TARGET} doesn't exist! Exiting"
                    echo "        found ${TARGET}"
                else
                    error "Invalid Raft source specified: $RAFT_SOURCE"
                fi

                #finalize Raft installation
                echo "        copying ${TARGET} to ${SYSTEM}"
                time {
                    if ( ! time scp $(get_scp_copy_to_connection ${CLUSTER} ${SYSTEM} ${TARGET} /data/cbench/) ) ; then
                        error "scp to ${SYSTEM} failed"
                    fi
                }

                echo "        unpacking Raft"
                time ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
                    cd /data/cbench
                    [[ -d install ]] || mkdir install
                    tar xfz '$(basename ${TARGET})' -C install --strip-components=1
                '
            fi
        fi

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).install.log 2>&1

    # install prometheus monitoring ===============================================================

    if [[ ${DATABASE} == 'mariadb' ]] ; then

        echo
        echo "    ===== Install Prometheus MySQLd  Exporter =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        time {

            ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
                sudo apt-get -y install prometheus-mysqld-exporter
                sudo systemctl stop prometheus-mysqld-exporter
            '

        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).install.prometheus.mysql.exporter.log 2>&1
    fi


    # configuration file generator ================================================================

    if [[ ${DATABASE} == 'mariadb' ]] ; then

        CONFIG_FILE=/data/cbench/install/etc/my.cnf.d/01_server.cnf

        echo
        echo "    ===== Configure Database ( ${CONFIG_FILE} ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        time {

            if [[ ${OPTION_CONFIG} == 'performance' ]] ; then

                echo
                echo "${CONFIG_FILE}"
                echo

                #auto-size buffer pool = min(80% x RAM, RAM - 5GB)
                #we had repeated hangs on 16GB systems with the 80% rule
                RAMSIZE=$(ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) 'cat /proc/meminfo' | grep MemTotal | awk '{ print $2 }')
                (( BUFFER_POOL_SIZE  = RAMSIZE * 8 / 10240   )) #MB
                (( BUFFER_POOL_SIZE1 = RAMSIZE / 1024 - 5120 )) #MB
                (( BUFFER_POOL_SIZE1 < BUFFER_POOL_SIZE )) && BUFFER_POOL_SIZE=${BUFFER_POOL_SIZE1}
                #safeguard: min buffer pool size = 192M
                (( BUFFER_POOL_SIZE < 192 )) && BUFFER_POOL_SIZE=192
                echo "BUFFER_POOL_SIZE = ${BUFFER_POOL_SIZE}M"

                #auto-size replication slave threads = #cpu
                AUTO_SLAVE_THREADS=$(ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) 'cat /proc/cpuinfo' | grep -c processor)
                echo "AUTO_SLAVE_THREADS = ${AUTO_SLAVE_THREADS}"
                echo


                ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
                    BUFFER_POOL_SIZE="'${BUFFER_POOL_SIZE}'"
                    CONFIG_FILE="'${CONFIG_FILE}'"
                    OPTION_BINLOG_COMMIT_WAIT_USEC="'${OPTION_BINLOG_COMMIT_WAIT_USEC}'"
                    OPTION_BINLOG_COMMIT_WAIT_COUNT="'${OPTION_BINLOG_COMMIT_WAIT_COUNT}'"
                    OPTION_CHARSET="'${OPTION_CHARSET}'"
                    OPTION_DBPORT="'${OPTION_DBPORT}'"
                    OPTION_DISABLE_TEMP_POOL="'${OPTION_DISABLE_TEMP_POOL}'"
                    OPTION_GENERAL_LOG_FILE="'${OPTION_GENERAL_LOG_FILE}'"
                    OPTION_INNODB_ADAPTIVE_HASH_INDEX="'${OPTION_INNODB_ADAPTIVE_HASH_INDEX}'"
                    OPTION_INNODB_BUFFER_POOL_INSTANCES="'${OPTION_INNODB_BUFFER_POOL_INSTANCES}'"
                    OPTION_INNODB_BUFFER_POOL_SIZE="'${OPTION_INNODB_BUFFER_POOL_SIZE}'"
                    OPTION_INNODB_FLUSH_METHOD="'${OPTION_INNODB_FLUSH_METHOD}'"
                    OPTION_INNODB_IO_CAPACITY="'${OPTION_INNODB_IO_CAPACITY}'"
                    OPTION_INNODB_LOG_BUFFER_SIZE="'${OPTION_INNODB_LOG_BUFFER_SIZE}'"
                    OPTION_INNODB_READ_IO_THREADS="'${OPTION_INNODB_READ_IO_THREADS}'"
                    OPTION_INNODB_WRITE_IO_THREADS="'${OPTION_INNODB_WRITE_IO_THREADS}'"
                    OPTION_MASTER="'${OPTION_MASTER}'"
                    OPTION_MAX_CONNECTIONS="'${OPTION_MAX_CONNECTIONS}'"
                    OPTION_PERFORMANCE_SCHEMA="'${OPTION_PERFORMANCE_SCHEMA}'"
                    OPTION_SEMISYNC_AFTER_COMMIT="'${OPTION_SEMISYNC_AFTER_COMMIT}'"
                    OPTION_SEMISYNC_AFTER_SYNC="'${OPTION_SEMISYNC_AFTER_SYNC}'"
                    OPTION_SEMISYNC_REP="'${OPTION_SEMISYNC_REP}'"
                    OPTION_SLAVE="'${OPTION_SLAVE}'"
                    OPTION_SLAVE_PARALLEL_MODE="'${OPTION_SLAVE_PARALLEL_MODE}'"
                    OPTION_SLAVE_THREADS="'${OPTION_SLAVE_THREADS}'"
                    AUTO_SLAVE_THREADS="'${AUTO_SLAVE_THREADS}'"
                    OPTION_SLOW_QUERY_LOG="'${OPTION_SLOW_QUERY_LOG}'"
                    OPTION_SSL="'${OPTION_SSL}'"
                    OPTION_SYNC_BINLOG="'${OPTION_SYNC_BINLOG}'"
                    OPTION_SYNC_MASTER="'${OPTION_SYNC_MASTER}'"
                    OPTION_SYNC_RELAYLOG="'${OPTION_SYNC_RELAYLOG}'"
                    OPTION_TABLE_OPEN_CACHE="'${OPTION_TABLE_OPEN_CACHE}'"
                    OPTION_THREAD_POOL="'${OPTION_THREAD_POOL}'"
                    OPTION_THREAD_POOL_SIZE="'${OPTION_THREAD_POOL_SIZE}'"
                    OPTION_THREAD_POOL_MAX_THREADS="'${OPTION_THREAD_POOL_MAX_THREADS}'"
                    OPTION_TRANSACTION_ISOLATION="'${OPTION_TRANSACTION_ISOLATION}'"
                    SERVER_ID="'${SERVER_ID}'"
                    uname -n
                    {
                        echo "# Performance Config"
                        echo
                        echo "[mariadb]"
                        echo
                        echo "# General settings"
                        echo "port = ${OPTION_DBPORT}"
                        echo "socket = /data/cbench/mariadb.sock"
                        echo "pid-file = /data/cbench/mariadb.pid"
                        echo "basedir = /data/cbench/install"
                        echo "datadir = /data/cbench/datadir"
                        echo "tmpdir = /data/cbench"
                        echo "log-error = /data/cbench/datadir/error.log"
                        [[ ${OPTION_GENERAL_LOG_FILE} == TRUE ]] && echo "general_log_file = /data/cbench/datadir/general.log"
                        if [[ ${OPTION_SLOW_QUERY_LOG} ]] ; then
                            echo
                            echo "slow_query_log_file = /data/cbench/datadir/slow-query.log"
                            echo "slow_query_log"
                            echo "long_query_time = 10"
                        fi
                        if [[ ${OPTION_CHARSET} ]] ; then
                            echo
                            echo "# Default character Set"
                            echo "character_set_server = ${OPTION_CHARSET}"
                        fi

                        echo
                        echo "#high concurrency setup"
                        if [[ ${OPTION_MAX_CONNECTIONS} ]] ; then
                            echo "max_connections = ${OPTION_MAX_CONNECTIONS}"
                        else
                            echo "max_connections = 2048"
                        fi
                        if [[ ${OPTION_TABLE_OPEN_CACHE} ]] ; then
                            echo "table_open_cache = ${OPTION_TABLE_OPEN_CACHE}"
                        else
                            echo "table_open_cache = 4096"
                        fi
                        echo "max_prepared_stmt_count = 1048576"

                        echo
                        echo "#disable query cache"
                        echo "query_cache_type = 0"
                        echo "query_cache_size = 0"
                        if [[ ${OPTION_PERFORMANCE_SCHEMA} ]] ; then
                            echo "performance_schema = ${OPTION_PERFORMANCE_SCHEMA}"
                        fi
                        if [[ ${OPTION_TRANSACTION_ISOLATION} ]] ; then
                            echo "transaction_isolation = ${OPTION_TRANSACTION_ISOLATION}"
                        fi
                        if [[ ${OPTION_DISABLE_TEMP_POOL} ]] ; then
                            echo "# 200805  Jira MDEV-22278 sets default to off."
                            echo "temp_pool = 0"
                        fi
                        [[ ${OPTION_THREAD_POOL} ]] && echo "thread_handling = pool-of-threads"
                        [[ ${OPTION_THREAD_POOL_SIZE} ]] && echo "thread-pool-size = ${OPTION_THREAD_POOL_SIZE}"
                        [[ ${OPTION_THREAD_POOL_MAX_THREADS} ]] && echo "thread_pool_max_threads = ${OPTION_THREAD_POOL_MAX_THREADS}"
                        echo
                        echo "#allow more connect errors"
                        echo "max_connect_errors = 10000000"
                        echo
                        if [[ ${OPTION_SSL} == TRUE ]] ; then
                            echo "#SSL options"
                            echo "ssl_cert = /data/cbench/install/etc/certificates/server-cert.pem"
                            echo "ssl_key = /data/cbench/install//etc/certificates/server-key.pem"
                            echo "ssl_ca = /data/cbench/install//etc/certificates/ca.pem"
                        fi

                        echo
                        echo "# Innodb"
                        if [[ ${OPTION_DEFAULT_STORAGE_ENGINE} ]] ; then
                            echo "default_storage_engine = ${OPTION_DEFAULT_STORAGE_ENGINE}"
                        else
                            echo "default_storage_engine = InnoDB"
                        fi
                        if [[ ${OPTION_INNODB_BUFFER_POOL_SIZE} ]] ; then
                            echo "innodb_buffer_pool_size = ${OPTION_INNODB_BUFFER_POOL_SIZE}"
                        else
                            echo "innodb_buffer_pool_size = ${BUFFER_POOL_SIZE}M"
                        fi
                        echo "innodb_log_file_size = $(( ${BUFFER_POOL_SIZE} / 2))M"
                        if [[ ${OPTION_INNODB_LOG_BUFFER_SIZE} ]] ; then
                            echo "innodb_log_buffer_size = ${OPTION_INNODB_LOG_BUFFER_SIZE}"
                        else
                            echo "innodb_log_buffer_size = 16M"
                        fi
                        if [[ ${OPTION_INNODB_FLUSH_METHOD} ]] ; then
                            echo "innodb_flush_method = ${OPTION_INNODB_FLUSH_METHOD}"
                        fi
                        if [[ ${OPTION_INNODB_BUFFER_POOL_INSTANCES} ]] ; then
                            echo "innodb_buffer_pool_instances = ${OPTION_INNODB_BUFFER_POOL_INSTANCES}"
                        fi
                        echo
                        echo "innodb_adaptive_flushing = 1"
                        echo "innodb_max_dirty_pages_pct = 90"
                        echo "innodb_max_dirty_pages_pct_lwm = 75"
                        echo "innodb_flush_neighbors = 0"
                        if [[ ${OPTION_INNODB_IO_CAPACITY} ]] ; then
                            echo "innodb_io_capacity = ${OPTION_INNODB_IO_CAPACITY}"
                        else
                            echo "innodb_io_capacity = 10000"
                        fi
                        if [[ ${OPTION_INNODB_READ_IO_THREADS} ]] ; then
                            echo "innodb_read_io_threads = ${OPTION_INNODB_READ_IO_THREADS}"
                        fi
                        if [[ ${OPTION_INNODB_WRITE_IO_THREADS} ]] ; then
                            echo "innodb_write_io_threads = ${OPTION_INNODB_WRITE_IO_THREADS}"
                        fi
                        if [[ ${OPTION_INNODB_ADAPTIVE_HASH_INDEX} ]] ; then
                            echo "innodb_adaptive_hash_index = ${OPTION_INNODB_ADAPTIVE_HASH_INDEX}"
                        fi

                        echo
                        echo "# Replication"
                        echo "server_id = ${SERVER_ID}"
                        if [[ ${OPTION_MASTER} == TRUE || ${OPTION_SLAVE} ]] ; then
                            echo "log_bin = /data/cbench/datadir/binlog"
                            echo "relay_log = /data/cbench/datadir/relaylog"
                            echo "binlog_format = ROW"
                            echo "binlog_row_image = MINIMAL"
                            echo "binlog_cache_size = 256K"
                            echo "binlog_stmt_cache_size = 128K"
                            if [[ ${OPTION_SYNC_BINLOG} ]] ; then
                                echo "sync_binlog = 1"
                            fi
                            if [[ ${OPTION_SYNC_MASTER} ]] ; then
                                echo "sync_master_info = 1"
                            fi
                            if [[ ${OPTION_SYNC_RELAYLOG} ]] ; then
                                echo "sync_relay_log = 1"
                                echo "sync_relay_log_info = 1"
                            fi
                            if [[ ${OPTION_MASTER} == TRUE ]] ; then
                                if [[ ${OPTION_SEMISYNC_REP} ]] ; then
                                    echo "rpl_semi_sync_master_enabled = on"
                                    if [[ ${OPTION_SEMISYNC_AFTER_SYNC} ]] ; then
                                        echo "rpl_semi_sync_master_wait_point = AFTER_SYNC"
                                    fi
                                    if [[ ${OPTION_SEMISYNC_AFTER_COMMIT} ]] ; then
                                        echo "rpl_semi_sync_master_wait_point = AFTER_COMMIT"
                                    fi
                                fi
                                if [[ ${OPTION_BINLOG_COMMIT_WAIT_USEC} ]] ; then
                                    echo "binlog_commit_wait_usec = ${OPTION_BINLOG_COMMIT_WAIT_USEC}"
                                fi
                                if [[ ${OPTION_BINLOG_COMMIT_WAIT_COUNT} ]] ; then
                                    echo "binlog_commit_wait_count = ${OPTION_BINLOG_COMMIT_WAIT_COUNT}"
                                fi
                                echo "max_binlog_size = 100M"
                            fi
                            if [[ ${OPTION_SLAVE} ]] ; then
                                if [[ ${OPTION_SLAVE_PARALLEL_MODE} ]] ; then
                                    echo "slave_parallel_mode = ${OPTION_SLAVE_PARALLEL_MODE}"
                                fi
                                if [[ ${OPTION_SLAVE_THREADS} ]] ; then
                                    echo "slave_parallel_threads = ${OPTION_SLAVE_THREADS}"
                                else
                                    echo "slave_parallel_threads = ${AUTO_SLAVE_THREADS}"
                                fi
                                if [[ ${OPTION_SEMISYNC_REP} ]] ; then
                                    echo "rpl_semi_sync_slave_enabled = on"
                                fi
                            fi
                        else
                            echo "skip-log-bin"
                        fi

                    } | tee ${CONFIG_FILE}
                '

            fi

            if [[ ${OPTION_SSL} == TRUE ]] ; then
                 echo
                 echo "    Copying over SSL certificates"
                 ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "mkdir -p /data/cbench/install/etc/certificates"
                 for f in server-cert.pem server-key.pem ca.pem; do
	             [[ -e ~/openssl/${f}] ]] && echo "${f} :"
                     cat ~/openssl/${f} | ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "cat > /data/cbench/install/etc/certificates/${f}"
                 done
            fi

        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).configure.my.cnf.log 2>&1
    fi

    echo
    echo "    Configuration File: ${CONFIG_FILE}"
    echo
    echo "----8<---- ----8<---- ----8<---- ----8<---- ----8<---- ----8<---- "
    ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "cat ${CONFIG_FILE}"
    echo "----8<---- ----8<---- ----8<---- ----8<---- ----8<---- ----8<---- "


    # Galera/Raft create their own config and start server on their own
    if [[ ! ( ${OPTION_GALERA} == TRUE || ${OPTION_RAFT} == TRUE ) ]] ; then

        echo
        echo "    ===== Starting Database =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        time ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '
            uname -n
            [[ -f /data/cbench/install/etc/mariadb-enterprise.cnf ]] && rm /data/cbench/install/etc/mariadb-enterprise.cnf
            export PATH=/data/cbench/install/bin:/data/cbench/install/scripts:${PATH}
            mariadb-install-db --auth-root-authentication-method=normal
            mariadbd-safe &
            sleep 5
            cat /data/cbench/datadir/error.log
         '

        echo
        echo "    ===== Waiting for database to initialize =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
        echo
        time {
            if [[ ${DATABASE} == 'mariadb' ]] ; then
                while (( $( ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '/data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e "select version()"' 2>&1 | grep 'MariaDB' | wc -l ) == 0 )) ; do
                    echo -n "."
                    sleep 1
                done
                echo "        Database Initialized. Version : "$(ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) '/data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -sN -e "select version()"')
            fi
        }

        echo
        echo "    ===== Finalize Database =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        echo

        ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "
            uname -n
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
            \"
            "

        if [[ ${OPTION_SSL} == TRUE ]] ; then
            echo "        Checking SSL"
            mariadb -vvv $(get_database_connection) --ssl -e "
                    SHOW VARIABLES LIKE 'have_ssl';
                    SHOW SESSION STATUS LIKE 'Ssl_cipher';
                "
        fi

        if [[ ${OPTION_MASTER} == TRUE ]] ; then
            echo "        Binlogging enabled - Create Replication User"
            ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "
                uname -n
                /data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e\"
                    CREATE USER 'replication_user'@'%' IDENTIFIED BY 'Ma49DBF@+Pa13w0rd';
                    GRANT REPLICATION SLAVE ON *.* TO 'replication_user'@'%';
                    FLUSH PRIVILEGES;
                \"
            "
        fi

        if [[ ${OPTION_SLAVE} ]] ; then
            echo "        Configuring as Slave of Master ${OPTION_SLAVE}"
            if [[ ${OPTION_GTID} == TRUE ]] ; then
                MASTER_HOST=$(get_database_backend_ips ${OPTION_SLAVE})
                MASTER_GTID=$(mariadb -sN $(get_database_connection ${OPTION_SLAVE}) -e "show global variables like 'gtid_binlog_pos';" | awk '{print $2}')
                echo "            MASTER_HOST = ${MASTER_HOST}"
                echo "            MASTER_GTID = ${MASTER_GTID}"
                ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "
                    uname -n
                    /data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e\"
                        SET GLOBAL gtid_slave_pos = '${MASTER_GTID}';
                        CHANGE MASTER TO master_host='${MASTER_HOST}', master_user='replication_user',
                          master_password='Ma49DBF@+Pa13w0rd', master_port=${OPTION_DBPORT},
                          master_use_gtid=current_pos, master_connect_retry=10;
                        start slave;
                    \"
                "
            else
                MASTER_HOST=$(get_database_backend_ips ${OPTION_SLAVE})
                MASTER_LOG_FILE=$(mysql -sN $(get_database_connection ${OPTION_SLAVE}) -e "show master status;" | awk '{print $1}')
                MASTER_LOG_POS=$(mysql -sN $(get_database_connection ${OPTION_SLAVE}) -e "show master status;" | awk '{print $2}')
                echo "            MASTER_HOST = ${MASTER_HOST}"
                echo "            MASTER_LOG_FILE = ${MASTER_LOG_FILE}"
                echo "            MASTER_LOG_POS = ${MASTER_LOG_POS}"
                ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM}) "
                    uname -n
                    /data/cbench/install/bin/mariadb -S /data/cbench/mariadb.sock -u root -vvv -e\"
                        CHANGE MASTER TO master_host='${MASTER_HOST}', master_user='replication_user',
                          master_password='Ma49DBF@+Pa13w0rd', master_port=${OPTION_DBPORT},
                          master_log_file='${MASTER_LOG_FILE}', master_log_pos=${MASTER_LOG_POS}, master_connect_retry=10;
                        start slave;
                    \"
                "
            fi
        fi

        #system must point to a mariadb/galera/raft node
        SYSTEM=$(get_property ${CLUSTER} mariadb.systems)
        [[ ${SYSTEM} ]] || SYSTEM=${CLUSTER}

        start_prometheus_mysqld_exporter

        echo
        echo "    ===== Check Database Connection =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        mariadb -vvv $(get_database_connection) -e "
            create schema if not exists test;
            select round(@@innodb_buffer_pool_size/1024/1024/1024, 2) AS 'InnoDB Buffer Pool Size [GB]';
            select version();
        "
        if [[ ${OPTION_MASTER} == TRUE ]] ; then
            mariadb -vvv $(get_database_connection) -e "show master status\G"
        fi
        if [[ ${OPTION_SLAVE} ]] ; then
            mariadb -vvv $(get_database_connection) -e "show slave status\G"
        fi

    fi

    echo
    echo "        SSH Connection : ssh $(get_ssh_connection ${CLUSTER} ${SYSTEM})"
    echo "        MariaDB Connection : mysql $(get_database_connection)"
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
