#!/bin/bash

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

        --benchmark)            BENCHMARK="$1"; shift;;

        # Connection Info
        --cluster)              CLUSTER="$1"; shift;;
        --system)               CLUSTER="$1"; shift;;
        --database)             DATABASE="$1"; shift;;

        --schema)               SCHEMA="$1"; shift;;
        --dbscale)              DBSCALE="$1"; shift;;

        --load)                 LOAD_OPTION='load';;
        --noload)               LOAD_OPTION='noload';;
        --check)                LOAD_OPTION='noload';;

        --streams)              STREAMS="$1"; shift;;
        --totalstreams)         STREAMS="$1"; shift;;
        --batchsize)            BATCHSIZE="$1"; shift;;
        --skipdrop)             OPTION_SKIP_DROP=TRUE;;
        --ignore)               OPTION_IGNORE=TRUE;;
        --loaddirect)           OPTION_LOADDIRECT=TRUE;;

        --snapshot)             OPTION_SNAPSHOT=TRUE;;

        # HammerDB specific
        --prepared)             PREPARED=TRUE;;
        --storedproc)           STOREDPROC=TRUE;;
        --partition)            PARTITION=TRUE;;

        # Sysbench specific
        --tables)               SYSBENCH_TABLES="$1"; shift;;
        --sbtables)             SYSBENCH_TABLES="$1"; shift;;
        --tablesize)            SYSBENCH_TABLESIZE="$1";shift;;
        --table-size)           SYSBENCH_TABLESIZE="$1";shift;;
        --sbtablesize)          SYSBENCH_TABLESIZE="$1";shift;;
        --seedmethod)           SYSBENCH_SEED_METHOD=TRUE;;
        --noautoinc)            OPTION_NOAUTOINC=TRUE;;
        --directexec)           OPTION_DIRECTEXEC=TRUE;;
        --nosecondary)          OPTION_NOSECONDARY=TRUE;;
        --engine)               OPTION_ENGINE="$1"; shift;;
        --charset)              OPTION_CHARSET="$1"; shift;;
        --ssl)                  OPTION_SSL=TRUE;;
        --skipbinlog)           SKIP_BINLOG=TRUE;;
        --luascript)            SYSBENCH_SCRIPT="$1"; shift;;

        # 200616 Workaround for loading Galera Master/Master.  Do the load through a single node.
        --single_host_load)     OPTION_SINGLE_HOST_LOAD=TRUE;;

        --skipcheck)            OPTION_SKIPCHECK=TRUE;;
        --snapshot)             OPTION_SNAPSHOT=TRUE;;
        --cloud)                OPTION_CLOUD="--cloud";;
        --gcp_import)           OPTION_GCP_IMPORT=TRUE;;
        --aws_import)           OPTION_AWS=TRUE;;
        --aws)                  OPTION_AWS=TRUE;;
        --skipindex)            OPTION_SKIPINDEX=TRUE;;

        --character_set)        OPTION_CHARACTER_SET="$1";shift;;

        --testid)               TESTID="$1";        shift;;

        -h|--help)             echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

if [[ ! ${BENCHMARK} ]] ; then echo "Benchmark parameter required."; echo -e "$USAGE"; exit 1; fi

process_connection_info;

[[ ${CLUSTER_TYPE} ]] || CLUSTER_TYPE=$(get_property ${CLUSTER} cluster.type)
[[ ${LOAD_OPTION} ]] || LOAD_OPTION=noload
[[ ${OPTION_SNAPSHOT} ]] || OPTION_SNAPSHOT=FALSE

case ${BENCHMARK} in
    tproc-c)
        [[ ${SCHEMA} ]] || SCHEMA='tprocc'
        [[ ${DBSCALE} ]] || DBSCALE=100
        ;;
    sysbench-tpcc)
        [[ ${SCHEMA} ]] || SCHEMA='sysbench_tpcc'
        [[ ${DBSCALE} ]] || DBSCALE=100
        [[ ${SYSBENCH_TABLES} ]] || SYSBENCH_TABLES=10
        ;;
    sysbench)
        [[ ${DBSCALE} ]] || DBSCALE=10
        [[ ${SYSBENCH_TABLES} ]] || SYSBENCH_TABLES=${DBSCALE}
        [[ ${SYSBENCH_TABLESIZE} ]] || (( SYSBENCH_TABLESIZE = ${DBSCALE} * 1000000 / ${SYSBENCH_TABLES} ))
        [[ ${SYSBENCH_SCRIPT} ]] || SYSBENCH_SCRIPT='oltp_read_write.lua'
        ;;
    *) echo "Unsupported Benchmark : BENCHMARK = ${BENCHMARK}"; echo -e "$USAGE"; exit 1;;
esac

[[ ${SCHEMA} ]] || SCHEMA=${BENCHMARK}

TEST_NAME=${BENCHMARK}.load
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo
    echo "===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

    STARTSECONDS=$SECONDS

    echo
    echo "         $0 ${COMMAND_LINE}"
    echo
    echo "            TESTID                  = ${TESTID}"
    echo
    echo "            DATABASE                = ${DATABASE}"
    echo "            BENCHMARK               = ${BENCHMARK}"
    echo "            CLUSTER                 = ${CLUSTER}"
    echo
    echo "            SCHEMA                  = ${SCHEMA}"
    echo "            DBSCALE                 = ${DBSCALE}"
    echo "            LOAD_OPTION             = ${LOAD_OPTION}"
    echo "            OPTION_SKIPCHECK        = ${OPTION_SKIPCHECK}"
    echo
    echo "            OPTION_ENGINE           = ${OPTION_ENGINE}"
    echo
    echo "            LOGDIRECTORY            = ${LOGDIRECTORY}"
    if [[ ${BENCHMARK} == sysbench* ]] ; then
        echo
        echo "            SYSBENCH_TABLES         = ${SYSBENCH_TABLES}"
        echo "            SYSBENCH_SEED_METHOD    = ${SYSBENCH_SEED_METHOD}"
    fi

    echo
    echo "            Database Connection     = mariadb $(get_database_connection)"
    mariadb $(get_database_connection) -e 'select version()'

    echo "            Properties File:"
    showproperties

    check_cluster;
    gather_pretest_snapshot ${CLUSTER}
#    start_performance_monitor;

    if [[ ${LOAD_OPTION} != noload ]] ; then

        start_timer

        echo
        echo "    ===== Loading Data : LOAD_OPTION = ${LOAD_OPTION} =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

        if [[ ${LOAD_OPTION} == 'load' ]] ; then

            time {

                case ${BENCHMARK} in

                    tproc-c)
                        # Only use 1 driver
                        echo "        Driver : ${HEADDRIVER}"
                        check_and_update_remote_drivers;
                        echo "        Drop and recreate database"
                        echo "            mariadb -vvv $(get_database_connection)"
                        [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "show databases"
                        # 200317 workaround for maxscale issue with loading initial database info
                        time mariadb -vvv $(get_database_connection) -e "
                            use ${SCHEMA};
                            show tables;
                            "

                        DBHOST=$(get_database_internal_host ${CLUSTER})
                        DBPORT=$(get_database_port ${CLUSTER})
                        DBUSER=$(get_database_user ${CLUSTER})
                        DBPASS=$(get_database_password ${CLUSTER})
                        VUSER=$(ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) 'cat /proc/cpuinfo' | grep -c processor | awk '{ print int($1) }')
                        [[ ${OPTION_ENGINE} ]] || OPTION_ENGINE='innodb'

                        SCRIPT="/data/cbench/load-tprocc.tcl"

                        if [[ ${DATABASE} == 'mariadb' ]] ; then
                            ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                                DBHOST="'${DBHOST}'"
                                DBPORT="'${DBPORT}'"
                                DBUSER="'${DBUSER}'"
                                DBPASS="'${DBPASS}'"
                                SCHEMA="'${SCHEMA}'"
                                DBSCALE="'${DBSCALE}'"
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
                                echo "diset tpcc maria_count_ware ${DBSCALE}"    >> ${SCRIPT}
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
                        check_and_update_remote_drivers;
                        echo "        Drop and recreate database"
                        echo "            mariadb -vvv $(get_database_connection)"
                        [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "show databases"
                        # 200317 workaround for maxscale issue with loading initial database info
                        time mariadb -vvv $(get_database_connection) -e "
                            use ${SCHEMA};
                            show tables;
                            "
                        [[ ${STREAMS} ]] || STREAMS=${SYSBENCH_TABLES}

                        COMMAND="sysbench /data/cbench/driver/lua/tpcc.lua $(get_sysbench_connection ${CLUSTER} ${HEADDRIVER}) --scale=${DBSCALE} --use_fk=0 ${SYSBENCH_OPTIONS}"
                        [[ ${OPTION_ENGINE} ]] && COMMAND="${COMMAND} --mysql_storage_engine=${OPTION_ENGINE}"
                        [[ ${SYSBENCH_TABLES} ]] && COMMAND="${COMMAND} --tables=${SYSBENCH_TABLES} --threads=${SYSBENCH_TABLES}"
                        [[ ${OPTION_NOAUTOINC} ]] && COMMAND="${COMMAND} --auto-inc=off"
                        [[ ${OPTION_DIRECTEXEC} ]] && COMMAND="${COMMAND} --db-ps-mode=disable"
                        [[ ${OPTION_NOSECONDARY} ]] && COMMAND="${COMMAND} --secondary=off --create_secondary=off"
                        [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                        COMMAND="${COMMAND} --mysql-db=${SCHEMA}"
                        COMMAND="${COMMAND} prepare"
                        echo
                        echo "    ===== Load Data =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
                        echo "        COMMAND = ${COMMAND}"
                        time ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                            COMMAND="'${COMMAND}'"
                            echo "        Driver: $(uname -n)"
                            echo "        COMMAND = ${COMMAND}"
                            ${COMMAND}
                        '
                        ;;

                    sysbench)
                        # Only use 1 driver
                        echo "        Driver : ${HEADDRIVER}"
                        check_and_update_remote_drivers;
                        echo "        Drop and recreate database"
                        echo "            mariadb -vvv $(get_database_connection)"
                        [[ ${OPTION_SKIP_DROP} ]] || mariadb -vvv $(get_database_connection) -e "drop database if exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "create database if not exists ${SCHEMA}"
                        mariadb -vvv $(get_database_connection) -e "show databases"
                        # 200317 workaround for maxscale issue with loading initial database info
                        mariadb -vvv $(get_database_connection) -e "
                            use ${SCHEMA};
                            show tables;
                            "
                        [[ ${STREAMS} ]] || STREAMS=${SYSBENCH_TABLES}
                        COMMAND="sysbench /data/cbench/driver/lua/${SYSBENCH_SCRIPT} $(get_sysbench_connection ${CLUSTER} ${HEADDRIVER})"
                        COMMAND="${COMMAND} --mysql-db=${SCHEMA}"
                        COMMAND="${COMMAND} --table-size=${SYSBENCH_TABLESIZE} --tables=${SYSBENCH_TABLES} --threads=${STREAMS} ${SYSBENCH_OPTIONS}"
                        [[ ${OPTION_ENGINE} ]] && COMMAND="${COMMAND} --mysql_storage_engine=${OPTION_ENGINE}"
                        [[ ${OPTION_CHARSET} ]] && COMMAND="${COMMAND} --create_table_options=DEFAULT CHARSET=${OPTION_CHARSET}"
                        [[ ${OPTION_NOAUTOINC} ]] && COMMAND="${COMMAND} --auto-inc=off"
                        [[ ${OPTION_DIRECTEXEC} ]] && COMMAND="${COMMAND} --db-ps-mode=disable"
                        [[ ${OPTION_NOSECONDARY} ]] && COMMAND="${COMMAND} --secondary=off --create_secondary=off"
                        [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                        COMMAND="${COMMAND} prepare"

                        echo
                        echo "    ===== Load Data =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
                        echo "        Driver Connection : ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER})"
                        echo "        COMMAND = ${COMMAND}"

                        time ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                            COMMAND="'${COMMAND}'"
                            echo "        Driver: $(uname -n)"
                            echo "        COMMAND = ${COMMAND}"
                            ${COMMAND}
                        '
                        ;;

                    *) echo "Unsupported Benchmark for loading from data generator : BENCHMARK = ${BENCHMARK}"; echo -e "$USAGE"; exit 1;;
                esac

            }

        fi

        if [[ ${DATABASE} == 'mariadb' ]] ; then
            echo
            echo "    ===== Analyze Tables  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time {
                for TABLE in $(mariadb -sN $(get_database_connection) -e 'show tables' ${SCHEMA}) ; do
                    mariadb -vvv $(get_database_connection) -e "analyze table ${TABLE}" ${SCHEMA}
                done
            } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).analyze.tables.log 2>&1
        fi

        LOADTIME=$(stop_timer)

    fi

    echo
    echo "    ===== Check Data  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        if [[ ${DATABASE} == 'mariadb' ]] ; then
            mariadb -vvv $(get_database_connection) -e "
                select version();
                show tables;
                " ${SCHEMA}
            TABLES=( $(mariadb -sN $(get_database_connection) -e 'show tables' ${SCHEMA}) )
            for TABLE in ${TABLES[@]:0:10} ; do
                mariadb -vvv $(get_database_connection) -e "
                    show create table ${TABLE}\G
                    explain select * from ${TABLE};
                    " ${SCHEMA}
            done
        fi

        case ${BENCHMARK} in
            sysbench)
                mariadb -vvv $(get_database_connection) -e "
                    select version();
                    use ${SCHEMA};
                    show create table sbtest1;
                    explain select * from sbtest1;
                    select count(*) from sbtest1;
                    select count(*), min(id), max(id) from ${SCHEMA}.sbtest1;
                    select * from sbtest1 limit 1\G
                    "
                ;;
        esac

        if [[ ${DATABASE} == 'mariadb' ]] ; then
            echo
            echo "    DataSize (GB)"
            printf "        DataSize: %10.3f\n" $(echo "SELECT SUM(data_length + index_length)/1024/1024/1024 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '${SCHEMA}'" | select_data)
        fi

    }

    gather_posttest_snapshot ${CLUSTER}

#    stop_monitors;

    [[ ${LOADTIME} ]] && {
        echo
        echo "        LOADTIME = ${LOADTIME} Seconds"
    }
    echo
    echo "        LOGDIRECTORY            = ${LOGDIRECTORY}"
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
