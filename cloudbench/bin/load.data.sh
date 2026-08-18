#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Loads the data required for a benchmark

    Parameters:

        --benchmark <<benchmark>>

        [ --cluster <<clustername>> ]

        [ --schema  <<schemaname>> ]
        [ --dbscale <<dbscale>> ]

        [ --load|--reload|--restore|--import|--noload ]
        [ --dbversion <<dbversion>> ]

        # Sysbench specific
        [ --sbtables <<numberoftables>> ]
        [ --seedmethod ]

        [ -h|--help ]
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        # Connection Info
        --cluster)              CLUSTER="$1"; shift;;
        --system)               CLUSTER="$1"; shift;;
        --database)             DATABASE="$1"; shift;;

        --benchmark)            BENCHMARK="$1"; shift;;
        --schema)               SCHEMA="$1"; shift;;
        --dbscale)              DBSCALE="$1"; shift;;

        --load)                 LOAD_OPTION='load';;
        --clean)                LOAD_OPTION='clean';;
        --streams)              STREAMS="$1"; shift;;
        --totalstreams)         STREAMS="$1"; shift;;
        --skipdrop)             OPTION_SKIP_DROP=TRUE;;
        --skipcheck)            OPTION_SKIPCHECK=TRUE;;
        --snapshot)             OPTION_SNAPSHOT=TRUE;;
        --monitor)              OPTION_PERFMONITOR=TRUE;;

        # HammerDB specific
        --prepared)             PREPARED=TRUE;;
        --storedproc)           STOREDPROC=TRUE;;
        --partition)            PARTITION=TRUE;;

        # Sysbench specific
        --luascript)            SYSBENCH_SCRIPT="$1"; shift;;
        --tables)               SYSBENCH_TABLES="$1"; shift;;
        --sbtables)             SYSBENCH_TABLES="$1"; shift;;
        --tablesize)            SYSBENCH_TABLESIZE="$1";shift;;
        --table-size)           SYSBENCH_TABLESIZE="$1";shift;;
        --sbtablesize)          SYSBENCH_TABLESIZE="$1";shift;;
        --noautoinc)            OPTION_NOAUTOINC=TRUE;;
        --directexec)           OPTION_DIRECTEXEC=TRUE;;
        --nosecondary)          OPTION_NOSECONDARY=TRUE;;
        --bulkload)             OPTION_BULKLOAD=TRUE; LOAD_OPTION='load';;
        --bulk)                 OPTION_BULKLOAD=TRUE;;
        --engine)               OPTION_ENGINE="$1"; shift;;
        --charset)              OPTION_CHARSET="$1"; shift;;
        --ssl)                  OPTION_SSL=TRUE;;
        --skipbinlog)           SKIP_BINLOG=TRUE;;

        --testid)               TESTID="$1";        shift;;

        -h|--help)             echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]]   || { echo "CLUSTER is required."; echo -e "$USAGE"; exit 1; }
[[ ${BENCHMARK} ]] || { echo "Benchmark option required."; echo -e "$USAGE"; exit 1; }

process_connection_info;

[[ ${LOAD_OPTION} ]] || LOAD_OPTION="load"
#[[ ${OPTION_SNAPSHOT} ]] || OPTION_SNAPSHOT=FALSE

# set benchmarks defaults:
#   SCHEMA = benchmark
#   DBSCALE = nominal data size in GB
#
case ${BENCHMARK} in
    tproc-c)
        [[ ${SCHEMA} ]] || SCHEMA='tprocc'
        [[ ${DBSCALE} ]] || DBSCALE=10
        [[ ${WAREHOUSES} ]] || WAREHOUSES=$(( ${DBSCALE} * 10 ))
        ;;
    sysbench-tpcc)
        [[ ${SCHEMA} ]] || SCHEMA='sysbench_tpcc'
        # 10 instances of 10 warehouses each
        [[ ${SYSBENCH_TABLES} ]] || SYSBENCH_TABLES=10
        [[ ${DBSCALE} ]] || DBSCALE=10
        SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --use_fk=0"
        ;;
    sysbench)
        [[ ${SCHEMA} ]] || SCHEMA='sysbench'
        [[ ${SYSBENCH_SCRIPT} ]] || SYSBENCH_SCRIPT='oltp_read_write.lua'
        # 10 tables with 4M rows (rowsize ~250 bytes)
        [[ ${DBSCALE} ]] || DBSCALE=10
        [[ ${SYSBENCH_TABLES} ]] || SYSBENCH_TABLES=${DBSCALE}
        [[ ${SYSBENCH_TABLESIZE} ]] || (( SYSBENCH_TABLESIZE = ${DBSCALE} * 4000000 / ${SYSBENCH_TABLES} ))
        ;;
    *) echo "Unsupported Benchmark : BENCHMARK = ${BENCHMARK}"; echo -e "$USAGE"; exit 1;;
esac

# load Galera / Raft using all nodes
[[ ${OPTION_PARALLEL_LOAD} ]] || OPTION_PARALLEL_LOAD=TRUE


TEST_NAME=${BENCHMARK}.load
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

STARTSECONDS=$SECONDS

time {

    echo
    echo "===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

    if [[ ${LOAD_OPTION} == 'load' ]] ; then

        echo
        echo "    ===== Loading Data : LOAD_OPTION = ${LOAD_OPTION} =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        echo
        echo "         $0 ${COMMAND_LINE}"
        echo
        echo "            CLUSTER                 = ${CLUSTER}"
        echo "            BENCHMARK               = ${BENCHMARK}"
        echo "            DATABASE                = ${DATABASE}"
        echo "            SCHEMA                  = ${SCHEMA}"
        echo "            DBSCALE                 = ${DBSCALE}"
        echo "            LOAD_OPTION             = ${LOAD_OPTION}"
        echo "            OPTION_SKIPCHECK        = ${OPTION_SKIPCHECK}"
        echo "            OPTION_ENGINE           = ${OPTION_ENGINE}"
        echo
        echo "            TESTID                  = ${TESTID}"
        echo "            LOGDIRECTORY            = ${LOGDIRECTORY}"
        if [[ ${BENCHMARK} == sysbench* ]] ; then
            echo
            echo "            SYSBENCH_TABLES         = ${SYSBENCH_TABLES}"
            echo "            SYSBENCH_SEED_METHOD    = ${SYSBENCH_SEED_METHOD}"
        fi
        echo
        echo "            Database Connection     = mariadb $(get_database_connection)"
        echo "            Database Version        = $(mariadb $(get_database_connection) -e 'select version()')"
        echo
        echo "            Properties File:"
        showproperties

        echo
        echo "    ===== Gather pre-Load Snapshot       ===== [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        time {
            #check_cluster
            gather_preload_snapshot ${CLUSTER}
            start_performance_monitor
            start_raft_monitors ${CLUSTER}
            start_mariadb_status_monitors ${CLUSTER}
        }

        start_timer

        case ${BENCHMARK} in

            tproc-c)
                # Only use 1 driver
                echo "        Driver : ${HEADDRIVER}"
                #check_and_update_remote_drivers;
                echo "        Drop and recreate database"
                echo "            mariadb -vvv $(get_database_connection)"
                [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "show databases"

                DBHOST=$(get_database_internal_host ${CLUSTER})
                DBPORT=$(get_database_port ${CLUSTER})
                DBUSER=$(get_database_user ${CLUSTER})
                DBPASS=$(get_database_password ${CLUSTER})
                [[ ${OPTION_ENGINE} ]] || OPTION_ENGINE='innodb'

                # autosize vusers for load stage, TPROC-C is cpu-bound on the driver
                VUSER=$(ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) 'cat /proc/cpuinfo' | grep -c processor | awk '{ print int($1 * 1.5) }')

                # create Tcl script for load stage
                SCRIPT="/data/cbench/load-tprocc.tcl"
                if [[ ${DATABASE} == 'mariadb' ]] ; then
                    ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                        DBHOST="'${DBHOST}'"
                        DBPORT="'${DBPORT}'"
                        DBUSER="'${DBUSER}'"
                        DBPASS="'${DBPASS}'"
                        SCHEMA="'${SCHEMA}'"
                        WAREHOUSES="'${WAREHOUSES}'"
                        VUSER="'${VUSER}'"
                        SCRIPT="'${SCRIPT}'"
                        ENGINE="'${OPTION_ENGINE}'"
                        PARTITION="'${PARTITION}'"
                        [[ -f ${SCRIPT} ]] && rm -f ${SCRIPT}
                        echo "dbset db maria"                            >> ${SCRIPT}
                        echo "diset connection maria_host ${DBHOST}"     >> ${SCRIPT}
                        echo "diset connection maria_port ${DBPORT}"     >> ${SCRIPT}
                        echo "diset connection maria_socket null"        >> ${SCRIPT}
                        echo "diset tpcc maria_dbase ${SCHEMA}"          >> ${SCRIPT}
                        echo "diset tpcc maria_user ${DBUSER}"           >> ${SCRIPT}
                        echo "diset tpcc maria_pass ${DBPASS}"           >> ${SCRIPT}
                        echo "diset tpcc maria_storage_engine ${ENGINE}" >> ${SCRIPT}
                        echo "diset tpcc maria_count_ware ${WAREHOUSES}" >> ${SCRIPT}
                        echo "diset tpcc maria_num_vu ${VUSER}"          >> ${SCRIPT}
                        if [[ ${PARTITION} == TRUE ]] ; then
                            echo "diset tpcc maria_partition true"       >> ${SCRIPT}
                        fi
                        echo "diset tpcc maria_raiseerror true"          >> ${SCRIPT}
                        echo "print dict"                                >> ${SCRIPT}
                        echo "buildschema"                               >> ${SCRIPT}
                        echo
                        echo "    ===== TCL script ${SCRIPT} created for MariaDB ====="
                        echo
                        cat ${SCRIPT}
                        echo
                    '
                fi

                COMMAND="./hammerdbcli auto ${SCRIPT}"

                echo
                echo "    ===== Load Data =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
                echo "        COMMAND = ${COMMAND}"
                time ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                    COMMAND="'${COMMAND}'"
                    SCRIPT="'${SCRIPT}'"
                    echo "        Driver: $(uname -n)"
                    echo "        COMMAND = ${COMMAND}"
                    echo
                    cd /data/cbench/HammerDB-5.0
                    [[ -d tmp ]] && rm -rf tmp
                    mkdir tmp
                    TMP=$(pwd)/tmp ${COMMAND}
                '
                scp $(get_scp_copy_from_connection ${CLUSTER} ${HEADDRIVER} ${SCRIPT} ${LOGDIRECTORY}/. )
                ;;

            sysbench-tpcc)
                # Only use 1 driver
                echo "        Driver : ${HEADDRIVER}"
                #check_and_update_remote_drivers
                echo "        Drop and recreate database"
                echo "            mariadb -vvv $(get_database_connection)"
                [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "show databases"

                COMMAND="sysbench /data/cbench/driver/lua/tpcc.lua --scale=${DBSCALE} --mysql-db=${SCHEMA} ${SYSBENCH_OPTIONS}"
                [[ ${OPTION_ENGINE} ]] && COMMAND="${COMMAND} --mysql_storage_engine=${OPTION_ENGINE}"
                [[ ${SYSBENCH_TABLES} ]] && COMMAND="${COMMAND} --tables=${SYSBENCH_TABLES} --threads=${SYSBENCH_TABLES}"
                [[ ${OPTION_NOAUTOINC} ]] && COMMAND="${COMMAND} --auto-inc=off"
                [[ ${OPTION_DIRECTEXEC} ]] && COMMAND="${COMMAND} --db-ps-mode=disable"
                [[ ${OPTION_NOSECONDARY} ]] && COMMAND="${COMMAND} --secondary=off --create_secondary=off"
                [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                # this is for Galera/Raft, load only on leader node
                if [[ ${OPTION_PARALLEL_LOAD} == TRUE ]] ; then
                    COMMAND="${COMMAND} $(get_sysbench_connection ${CLUSTER} ${HEADDRIVER})"
                else
                    COMMAND="${COMMAND} $(get_sysbench_connection_node1 ${CLUSTER} ${HEADDRIVER})"
                fi
                COMMAND="${COMMAND} prepare"

                echo
                echo "    ===== Load Data =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
                echo "        COMMAND = ${COMMAND}"
                time ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                    COMMAND="'${COMMAND}'"
                    echo "        Driver: $(uname -n)"
                    echo "        COMMAND = ${COMMAND}"
                    export LUA_PATH="/data/cbench/driver/lua//?.lua;;"
                    ${COMMAND}
                '
                ;;

            sysbench)
                # Only use 1 driver
                echo "        Driver : ${HEADDRIVER}"
                #check_and_update_remote_drivers;
                echo "        Drop and recreate database"
                echo "            mariadb -vvv $(get_database_connection)"
                [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                mariadb -vvv $(get_database_connection) -e "show databases"

                # load each table in own thread
                [[ ${STREAMS} ]] || STREAMS=${SYSBENCH_TABLES}

                COMMAND="sysbench /data/cbench/driver/lua/${SYSBENCH_SCRIPT}"
                COMMAND="${COMMAND} --table-size=${SYSBENCH_TABLESIZE} --tables=${SYSBENCH_TABLES}"
                COMMAND="${COMMAND} --mysql-db=${SCHEMA} --threads=${STREAMS} ${SYSBENCH_OPTIONS}"
                [[ ${OPTION_BULKLOAD} ]] && COMMAND="${COMMAND} --bulk-load=true"
                [[ ${OPTION_ENGINE} ]] && COMMAND="${COMMAND} --mysql_storage_engine=${OPTION_ENGINE}"
                # this is better set on server side
                #[[ ${OPTION_CHARSET} ]] && COMMAND="${COMMAND} --create_table_options=DEFAULT CHARSET=${OPTION_CHARSET}"
                [[ ${OPTION_NOAUTOINC} ]] && COMMAND="${COMMAND} --auto-inc=off"
                [[ ${OPTION_DIRECTEXEC} ]] && COMMAND="${COMMAND} --db-ps-mode=disable"
                [[ ${OPTION_NOSECONDARY} ]] && COMMAND="${COMMAND} --secondary=off --create_secondary=off"
                [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                # this is for Galera/Raft, load only on leader node
                if [[ ${OPTION_PARALLEL_LOAD} == TRUE ]] ; then
                    COMMAND="${COMMAND} $(get_sysbench_connection ${CLUSTER} ${HEADDRIVER})"
                else
                    COMMAND="${COMMAND} $(get_sysbench_connection_node1 ${CLUSTER} ${HEADDRIVER})"
                fi
                COMMAND="${COMMAND} prepare"

                echo
                echo "    ===== Load Data =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
                echo "        Driver Connection : ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER})"
                echo "        COMMAND = ${COMMAND}"

                time ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                    COMMAND="'${COMMAND}'"
                    echo "        Driver: $(uname -n)"
                    echo "        COMMAND = ${COMMAND}"
                    export LUA_PATH="/data/cbench/driver/lua//?.lua;;"
                    ${COMMAND}
                '
                ;;

            *)  echo "Unsupported Benchmark for loading from data generator : BENCHMARK = ${BENCHMARK}";
                echo -e "$USAGE";
                exit 1;;
        esac

        LOADTIME=$(stop_timer)

        echo
        echo "    ===== Analyze Tables  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        if [[ ${DATABASE} == 'mariadb' ]] ; then
            time {
                for TABLE in $(mariadb -sN $(get_database_connection) -e 'show tables' ${SCHEMA}) ; do
                    mariadb -vvv $(get_database_connection) -e "analyze table ${TABLE}" ${SCHEMA}
                done
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).analyze.tables.log 2>&1
        fi

        echo
        echo "    ===== Check Data  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        if [[ ${DATABASE} == 'mariadb' ]] ; then

            time {
                mariadb -vvv $(get_database_connection) ${SCHEMA} -e 'SELECT VERSION(); SHOW TABLES;'

                TABLES=( $(mariadb -sN $(get_database_connection) ${SCHEMA} -e 'SHOW TABLES') )
                for TABLE in ${TABLES[*]} ; do
                    mariadb -vvv $(get_database_connection) ${SCHEMA} -e "SHOW CREATE TABLE ${TABLE}\G"
                done

                case ${BENCHMARK} in
                    sysbench)
                        TABLES=( $(mariadb -sN $(get_database_connection) ${SCHEMA} -e 'SHOW TABLES') )
                        for TABLE in ${TABLES[*]} ; do
                            mariadb -vvv $(get_database_connection) ${SCHEMA} -e "
                                EXPLAIN SELECT * FROM ${TABLE}\G
                                SELECT * FROM ${TABLE} LIMIT 1\G
                                SELECT COUNT(*), MIN(id), MAX(id) FROM ${TABLE};
                            "
                        done
                esac

            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).check.data.log 2>&1

            echo
            echo "    ===== Check Data Size =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            echo
            printf "        DataSize: %10.3f GB\n" $(echo "SELECT SUM(data_length + index_length)/1024/1024/1024 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '${SCHEMA}'" | select_data)

        fi

        [[ ${LOADTIME} ]] && {
            echo
            echo "        LOADTIME = ${LOADTIME} Seconds"
        }

        echo
        echo "    ===== Gather post-Load Snapshot =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        time {
            gather_postload_snapshot ${CLUSTER}
            stop_monitors
            stop_raft_monitors
            stop_mariadb_status_monitors
        }

    elif [[ ${LOAD_OPTION} == 'clean' ]] ; then
        echo "    ===== LOAD_OPTION = ${LOAD_OPTION} ====="
        echo
        echo "        Drop database ${SCHEMA}"
        echo "            mariadb -vvv $(get_database_connection)"
        mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"

    else
        echo "    ===== LOAD_OPTION = ${LOAD_OPTION} ====="
        echo
        echo "    no instrucions how to handle, ignoring it"

    fi

    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
