#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Runs a sysbench performance test.
    Options:
        [ --benchmark <<benchmark>> ]
        [ --cluster <<clustername>> ]
        [ --schema  <<schemaname>> ]
        [ --dbscale <<dbscale>> ]
        [ --streams <<streams>> ]
        [ --exectime <<exectime>> ]
        [ --reportinterval <<reportinterval>> ]
        [ --reload ]
        [ --workload <<workload>> ]
        [ --seeded ]
        [ --durability <<levelofdurability>> ]
        [ -h|--help ]
    Notes:
        1.  cluster : name of the cluster identified by properties file clustername.properties.  Default : look in dbconnect.properties
        2.  dbscale : size of the database in million of records.  Default : sysbench.default.dbscale defined in properties file or 10
        3.  streams : number of streams per driver.  Default : sysbench.default.streams defined in properties file or 100
        4.  load|reload : option to load fresh or restore from backup.  Default : neither
        5.  exectime : Length of test in seconds.  Default : 300
        6.  reportinterval : Controls length reporting interval during test.  Default : 10
        7.  workload :  Mix of sysbench.  Default :  9010   Valid values:  pointselect|readonly|connections|pointupdate|9010|8020|writeonly|default
        8.  durability: Controls level of durability the test will run. (Values: default, strict, relaxed)  Default : relaxed
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --benchmark)            BENCHMARK="$1"; shift;;
        --driver)               SYSBENCH_DRIVER="$1"; shift;;

        # Connection Info
        --cluster)              CLUSTER="$1"; shift;;

        --database)             DATABASE="$1"; shift;;
        --drivers)              DRIVERS="$1"; shift;;

        # Benchmark Controls
        --schema)               SCHEMA="$1"; shift;;
        --dbscale)              DBSCALE="$1"; shift;;
        --duration)             DURATION="$1"; shift;;
        --exectime)             DURATION="$1"; shift;;
        --reportinterval)       REPORT_INTERVAL="$1"; shift;;
        --interval_length)      REPORT_INTERVAL="$1"; shift;;
        --streams)              STREAMSPERDRIVER="$1"; shift;;
        --totalstreams)         TOTAL_STREAMS="$1"; shift;;
        --reload)               OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --restore";;
        --load)                 OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --load";;
        --restore)              OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --restore";;
        --import)               OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --import";;
        --noload)               LOAD_OPTIONS="${LOAD_OPTIONS} --noload";;
        --engine)               LOAD_OPTIONS="${LOAD_OPTIONS} --engine $1"; shift;;

        # Sysbench Options
        --workload)             WORKLOAD="$1"; shift;;
        --table)                TABLE="$1"; shift;;
        --tables)               TABLES="$1";shift;;
        --sbtables)             TABLES="$1";shift;;
        --dbtables)             TABLES="$1";shift;;
        --table-size)           TABLESIZE="$1";shift;;
        --tablesize)            TABLESIZE="$1";shift;;
        --sbtablesize)          TABLESIZE="$1";shift;;
        --ssl)                  OPTION_SSL=TRUE;;
        --randtype)             DISTRIBUTION="$1"; shift;;
        --distribution)         DISTRIBUTION="$1"; shift;;
        --autocommit)           SKIP_TRANSACTION=TRUE;;
        --skiptransaction)      SKIP_TRANSACTION=TRUE;;
        --skipbinlog)           SKIP_BINLOG=TRUE;;
        --ignoreerrors)         OPTION_IGNORE_ERRORS=TRUE;;
        --ignoreallerrors)      OPTION_IGNORE_ALL_ERRORS=TRUE;;
        --reconnect)            SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --oltp-reconnect-mode=$1"; shift;;
        --threadinittimeout)    SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --thread-init-timeout=$1"; shift;;
        --seeded)               OPTION_SEEDED=TRUE;;
        --histogram)            ;; #SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --histogram";;
        --directexec)           DIRECTEXEC=TRUE;SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --db-ps-mode=disable";;
        --target_tps)           TARGET_TPS="$1"; shift;;
        --driver_1_to_1)        OPTION_1_TO_1_DRIVER=TRUE;;

        # Profiling Options
        --profile)              PROFILE_TYPE="$1"; shift;;

        # CBENCH Options
        --binlogging)           ENABLE_BINLOGGING=TRUE;;
        --slave_delay)          OPTION_SLAVE_DELAY=TRUE;;

        --testid)               TESTID="$1"; shift;;
        --skipcheck)            OPTION_SKIPCHECK=TRUE;;
        --skipsnapshot)         OPTION_SNAPSHOT=FALSE;;
        --skipstats)            OPTION_SKIPSTATS=TRUE;;
        --cloud)                OPTION_CLOUD="--cloud";;
        --cleanup)              OPTION_CLEANUP=TRUE;;
        --monitor)              OPTION_PERFMONITOR=TRUE;;

        -h|--help)              echo -e "$USAGE"; exit 1;;

        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;

    esac
done


process_connection_info;

[[ ${BENCHMARK} ]] || BENCHMARK='sysbench'
SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --histogram"

[[ ${DATABASE} ]] || DATABASE='mariadb'

if [[ ${BENCHMARK} == 'sysbench-tpcc' ]] ; then
    SYSBENCH_DRIVER='sysbench-tpcc'
    [[ ${SCHEMA} ]] || SCHEMA='sysbench_tpcc'
    [[ ${DBSCALE} ]] || DBSCALE=10
    [[ ${TABLES} ]] || TABLES=10
    # Single driver
    NUMOFDRIVERS=1
    DRIVER_NODES=( ${DRIVER_NODES[0]} )
else
    [[ ${SCHEMA} ]] || SCHEMA=${BENCHMARK}
    [[ ${WORKLOAD} ]] || WORKLOAD=9010
    [[ ${DBSCALE} ]] || DBSCALE=10
    [[ ${TABLES} ]] || TABLES=10
    [[ ${TABLESIZE} ]] || (( TABLESIZE = ${DBSCALE} * 4000000 / ${TABLES} ))
    [[ ! ${DISTRIBUTION} ]] && DISTRIBUTION='uniform'
fi

# TOTAL_STREAMS overrides STREAMS
[[ ${STREAMSPERDRIVER} ]] || STREAMSPERDRIVER=100
[[ ${TOTAL_STREAMS} ]] && (( STREAMSPERDRIVER = ${TOTAL_STREAMS} / ${NUMOFDRIVERS} ))
(( STREAMSPERDRIVER == 0 )) && STREAMSPERDRIVER=1
[[ ${TOTAL_STREAMS} ]] || (( TOTAL_STREAMS = ${STREAMSPERDRIVER} * ${NUMOFDRIVERS} ))

[[ ${DURATION} ]] || DURATION=300
(( TIMEOUT = ${DURATION} * 2 ))
[[ ${REPORT_INTERVAL} ]] || REPORT_INTERVAL=10
[[ ${SYSBENCH_DRIVER} ]] || SYSBENCH_DRIVER='sysbench'

if [[ ${TARGET_TPS} ]]
then
    (( RATE = ${TARGET_TPS} / ${NUMOFDRIVERS} ))
    SYSBENCH_OPTIONS="${SYSBENCH_OPTIONS} --rate=${RATE}"
fi


# logging
TEST_NAME=${BENCHMARK}
[[ ${WORKLOAD} ]] && TEST_NAME="${TEST_NAME}.${WORKLOAD}"
[[ ${ENABLE_BINLOGGING} ]] && TEST_NAME="${TEST_NAME}.binlog"
TEST_NAME=${TEST_NAME}.run
[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}


time {

    print_header "Begin $0"
    STARTSECONDS=$SECONDS
    DB_OPTIONS="$(get_database_connection)"

    echo "$0 ${COMMAND_LINE}"
    print_variable_report 12 TESTID "" BENCHMARK WORKLOAD SYSBENCH_DRIVER "" CLUSTER DATABASE "" \
        NUMOFNODES CLUSTER_NODES NUMOFDRIVERS DRIVER_NODES "" \
        SCHEMA DBSCALE TABLES TABLESIZE TOTAL_STREAMS STREAMS DURATION REPORT_INTERVAL \
        LOAD_OPTIONS "" OPTION_SEEDED SYSBENCH_OPTIONS ""
    print_variable_report 12 ENABLE_BINLOGGING "" OPTION_SKIPCHECK OPTION_CLEANUP "" LOGDIRECTORY

    echo "            Properties File:"
    showproperties

    echo
    echo "    ===== Pre Test Processing  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo "            Properties File:"
        showproperties

        if [[ ! ${OPTION_SKIPCHECK} ]] ; then
            echo
            echo "    ===== Check Cluster/Drivers =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time check_and_update_remote_drivers
            time check_cluster
        fi

        if [[ ! ${DIRECTEXEC} ]] ; then
            time set_max_prepared_stmt_count ${CLUSTER} $(( 10 * ${TABLES} * ${TOTAL_STREAMS} ))
        fi
        time set_max_connections ${CLUSTER} $(( ${TOTAL_STREAMS} + 10 ))

        if [[ ! ${OPTION_SKIPCHECK} || ${OPTION_LOADTABLES} ]] ; then
            echo
            echo "    ===== Check/Load Data =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            COMMAND="sysbench.load.sh --cluster ${CLUSTER} --schema ${SCHEMA} --benchmark ${BENCHMARK} ${OPTION_TABLES} --dbscale ${DBSCALE} ${LOAD_OPTIONS}"
            [[ ${TABLES} ]] && COMMAND="${COMMAND} --tables ${TABLES}"
            [[ ${TABLESIZE} ]] && COMMAND="${COMMAND} --table-size ${TABLESIZE}"
            [[ ${OPTION_SKIPCHECK} ]] && COMMAND="${COMMAND} --skipcheck"
            echo "        COMMAND = ${COMMAND}"
            time ${COMMAND}
        fi

        echo
        echo "    WORKLOAD = ${WORKLOAD}"

        echo
        echo "    ===== Gather Pretest Snapshot =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time gather_pretest_snapshot ${CLUSTER}

        echo
        echo "    ===== Ping Test =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time ping_test ${CLUSTER}

        echo
        echo "    ===== Capture env settings =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time env

        echo
        echo "    ===== Gather Before Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time gather_before_data

        if [[ ${PROFILE_TYPE} ]] ; then
            echo
            echo "    ===== Start Profiling =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            start_profiling ${CLUSTER}
        fi

        start_performance_monitor ${CLUSTER};

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).preprocessing.log 2>&1

    echo
    echo "            Operating System : $(get_os_version)"
    echo "            Database Version : $(get_database_version)"

    echo
    echo "    ===== Run Performance Test =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {


        echo -e 'streams''\t''throughput''\t''avg_latency''\t''elapsed_secs''\t''transactions''\t''path_length''\t''qps''\t''fatalerrors'  > ${LOGDIRECTORY}/test.data

        echo
        echo "        Running ${NUMOFDRIVERS} driver(s), ${STREAMSPERDRIVER} streams per driver, ${TOTAL_STREAMS} total threads."

        begin_pathlength;

        # Streams are allocated such that TOTAL_STREAMS is met, even if TOTAL_STREAMS is not a multiple of NUMOFDRIVERS
        DRIVERID=1
        RUNNING_STREAMS=0

        unset DRIVER_PIDS

        for DRIVER_NODE in ${DRIVER_NODES[*]} ; do

            echo
            echo "        DRIVER_NODE = ${DRIVER_NODE}"

            CURRENT_STREAMS=${STREAMSPERDRIVER}
            (( ${CURRENT_STREAMS} + ${RUNNING_STREAMS} > ${TOTAL_STREAMS} )) && (( CURRENT_STREAMS = ${TOTAL_STREAMS} - ${RUNNING_STREAMS} ))

            echo "            RUNNING_STREAMS = ${RUNNING_STREAMS}, CURRENT_STREAMS = ${CURRENT_STREAMS}, TOTAL_STREAMS = ${TOTAL_STREAMS}"

            if (( ${RUNNING_STREAMS} < ${TOTAL_STREAMS} )) ; then

                case ${SYSBENCH_DRIVER} in

                    sysbench-tpcc)
                        COMMAND="sysbench /data/cbench/driver/lua/tpcc.lua --time=${DURATION} --scale=${DBSCALE} ${SYSBENCH_OPTIONS}"
                        [[ ${REPORT_INTERVAL} ]] && COMMAND="${COMMAND} --report-interval=${REPORT_INTERVAL}"
                        [[ ${TABLES} ]] && COMMAND="${COMMAND} --tables=${TABLES}"
                        [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --mysql-ssl=on"
                        [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                        COMMAND="${COMMAND} --mysql-db=${SCHEMA}"
                        ;;

                    sysbench*)

                        COMMAND='sysbench'
                        case ${WORKLOAD} in
                            pointselect)        COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=1 --range_selects=false --index_updates=0 --non-index_updates=0 --delete_inserts=0 --skip-trx=on";;
                            pointupdate)        COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=0 --range_selects=false --index_updates=0 --non-index_updates=1 --delete_inserts=0 --skip-trx=on";;
                            rangequeries)       COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=0 --range_selects=true --index_updates=0 --non-index_updates=0 --delete_inserts=0 --skip-trx=on";;
                            norangequeries)     COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --range_selects=false";;
                            1000|100-0)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=10 --range-selects=false --index-updates=0 --non-index-updates=0 --delete-inserts=0";;
                            9010|90-10)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=9 --range-selects=false --index-updates=0 --non-index-updates=1 --delete-inserts=0";;
                            8020|80-20)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=8 --range-selects=false --index-updates=0 --non-index-updates=2 --delete-inserts=0";;
                            7030|70-30)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=7 --range-selects=false --index-updates=0 --non-index-updates=3 --delete-inserts=0";;
                            6040|60-40)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=6 --range-selects=false --index-updates=0 --non-index-updates=4 --delete-inserts=0";;
                            5050|50-50)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=5 --range-selects=false --index-updates=0 --non-index-updates=5 --delete-inserts=0";;
                            4060|40-60)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=4 --range-selects=false --index-updates=0 --non-index-updates=6 --delete-inserts=0";;
                            3070|30-70)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=3 --range-selects=false --index-updates=0 --non-index-updates=7 --delete-inserts=0";;
                            2080|20-80)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=2 --range-selects=false --index-updates=0 --non-index-updates=8 --delete-inserts=0";;
                            1090|10-90)         COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=1 --range-selects=false --index-updates=0 --non-index-updates=9 --delete-inserts=0";;
                            0010|0100|0-100)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=0 --range-selects=false --index-updates=0 --non-index-updates=10 --delete-inserts=0";;
                            5050index)          COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua --point-selects=5 --range-selects=false --index-updates=5 --non-index-updates=0 --delete-inserts=0";;
                            readonly)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_only.lua";;
                            writeonly)          COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_write_only.lua";;
                            readwrite)          COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write.lua";;

                            # workloads are LUA script names
                            bulk_insert)            COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_delete)            COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_insert)            COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_point_select)      COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_read_only)         COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_read_write)        COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_update_index)      COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_update_index2)     COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_update_non_index)  COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_update_non_index2) COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            oltp_write_only)        COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            select_random_points)   COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                            select_random_ranges)   COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;

                            # splittable workloads for replication/galera
                            ro_splittable)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua";;
                            9010_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=10";;
                            8020_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=20";;
                            7525_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=25";;
                            7030_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=30";;
                            6040_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=40";;
                            5050_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=50";;
                            4060_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=60";;
                            3070_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=70";;
                            2080_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=80";;
                            1090_splittable)    COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=90";;
                            # versions without range scans
                            9010_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=10 --range-selects=false";;
                            8020_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=20 --range-selects=false";;
                            7525_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=25 --range-selects=false";;
                            7030_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=30 --range-selects=false";;
                            6040_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=40 --range-selects=false";;
                            5050_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=50 --range-selects=false";;
                            4060_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=60 --range-selects=false";;
                            3070_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=70 --range-selects=false";;
                            2080_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=80 --range-selects=false";;
                            1090_split_nr)      COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=90 --range-selects=false";;
                            # and alternate names
                            wl1_9010)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=10";;
                            wl1_8020)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=20";;
                            wl1_7525)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=25";;
                            wl1_7030)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=30";;
                            wl1_6040)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=40";;
                            wl1_5050)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=50";;
                            wl2_9010)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=10 --range-selects=false";;
                            wl2_8020)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=20 --range-selects=false";;
                            wl2_7525)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=25 --range-selects=false";;
                            wl2_7030)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=30 --range-selects=false";;
                            wl2_6040)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=40 --range-selects=false";;
                            wl2_5050)           COMMAND="${COMMAND} /data/cbench/driver/lua/oltp_read_write_split.lua --write-percentage=50 --range-selects=false";;
                            *)                  COMMAND="${COMMAND} /data/cbench/driver/lua/${WORKLOAD}.lua";;
                        esac

                        [[ ${SKIP_TRANSACTION} ]] && COMMAND="${COMMAND} --skip-trx=on"
                        [[ ${DISTRIBUTION} ]] && COMMAND="${COMMAND} --rand-type=${DISTRIBUTION}"
                        [[ ${REPORT_INTERVAL} ]] && COMMAND="${COMMAND} --report-interval=${REPORT_INTERVAL}"
                        [[ ${OPTION_SSL} ]] && COMMAND="${COMMAND} --mysql-ssl=on"
                        [[ ${SKIP_BINLOG} ]] && COMMAND="${COMMAND} --skip-binlog=on"
                        [[ ${WARMUP_TIME} ]] && COMMAND="${COMMAND} --warmup-time=${WARMUP_TIME}"
                        [[ ${TABLES} ]] && COMMAND="${COMMAND} --tables=${TABLES}"
                        [[ ${TABLESIZE} ]] && COMMAND="${COMMAND} --table-size=${TABLESIZE}"
                        COMMAND="${COMMAND} --mysql-db=${SCHEMA}"
                        COMMAND="${COMMAND} --time=${DURATION} ${SYSBENCH_OPTIONS}"
                        # 190920  Added Errno 8005 - a tiDB write conflict
                        [[ ${OPTION_IGNORE_ERRORS} ]] && COMMAND="${COMMAND} --mysql-ignore-errors=1180,1213,1317,8005"
                        [[ ${OPTION_IGNORE_ALL_ERRORS} ]] && COMMAND="${COMMAND} --mysql-ignore-errors=all"
                        ;;
                esac

                [[ ${OPTION_SEEDED} ]] && COMMAND="${COMMAND} --rand-seed=$(( ${DRIVERID} * 1234567 ))"
                COMMAND="${COMMAND} $(get_sysbench_connection ${CLUSTER} ${DRIVER_NODE} ${DRIVERID}) --threads=${CURRENT_STREAMS}"
                COMMAND="${COMMAND} run"

                echo "        COMMAND = ${COMMAND}"

                {

                    ssh $(get_ssh_connection ${CLUSTER} ${DRIVER_NODE}) '
                        DRIVERID="'${DRIVERID}'"
                        COMMAND="'${COMMAND}'"
                        SYSBENCH_DRIVER="'${SYSBENCH_DRIVER}'"
                        TIMEOUT="'${TIMEOUT}'"
                        uname -a
                        echo
                        echo "        DRIVERID = ${DRIVERID}, DRIVER_NODE = $(uname -n) "
                        echo "        ulimit -n = $(ulimit -n),  ulimit -u = $(ulimit -u) "
                        echo "        COMMAND = ${COMMAND}"
                        export LUA_PATH="/data/cbench/driver/lua//?.lua;;"
                        timeout --kill-after=${TIMEOUT} ${TIMEOUT} ${COMMAND}
                    '

                } 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).driver.${DRIVERID}.${DRIVER_NODE}.log &
                DRIVER_PIDS=( ${DRIVER_PIDS} $! )

                (( DRIVERID = ${DRIVERID} + 1 ))
                (( RUNNING_STREAMS = ${RUNNING_STREAMS} + ${CURRENT_STREAMS}))

            fi

        done

        wait ${DRIVER_PIDS[*]}

        sleep 10

        PATHLENGTH=$(calculate_pathlength);

        READS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'read:' | awk 'BEGIN { totl = 0 }; { totl = totl + $2 }; END { printf "%d\n", totl }')
        WRITES=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'write:' | awk 'BEGIN { totl = 0 }; { totl = totl + $2 }; END { printf "%d\n", totl }')
        TRANSACTIONS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'transactions:' | awk 'BEGIN { totl = 0 }; { totl = totl + $2 }; END { printf "%d\n", totl }')
        THROUGHPUT_TPS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'transactions:' | sed 's/(//g' | awk 'BEGIN { totl = 0.0 }; { totl = totl + $3 }; END { printf "%.2f\n", totl }')

        QUERIES=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'queries:' | awk 'BEGIN { totl = 0 }; { totl = totl + $2 }; END { printf "%d\n", totl }')
        THROUGHPUT_QPS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'queries:' | sed 's/(//g' | awk 'BEGIN { totl = 0.0 }; { totl = totl + $3 }; END { printf ("%.2f\n", totl) }')
        TOTALLATENCY=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'sum:' | awk 'BEGIN { totl = 0 }; { totl = totl + $2 }; END { printf "%d\n", totl }')
        AVGLATENCY=$(echo "${TOTALLATENCY} ${TRANSACTIONS}" | awk '{ printf ("%.3f\n",$1/$2) }')
        # 95% ... take the max of what each driver reports.  This is pessimistic, but accurate in that 95% of all response is <= to this time.
        PERCENTILE95=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep '95th percentile:' | sed 's/ms//g' | awk 'BEGIN { max = 0 }; { if ( $3 > max ) { max = $3 } }; END { printf "%.2f", max }')
        ELAPSEDSECONDS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'total time:' | sed 's/s//g' | awk 'BEGIN { totl = 0.0 }; { if ( $3 > totl ) { totl = $3 } }; END { printf "%d\n", totl }')
        TOTALERRORS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'ignored errors:' | awk 'BEGIN { totl = 0 }; { totl = totl + $3 }; END { printf "%.0f", totl }')

        FATALERRORS=$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'FATAL' | wc -l )

        echo "    TOTAL_STREAMS = ${TOTAL_STREAMS}"
        echo "    TRANSACTIONS = ${TRANSACTIONS}"
        echo "    THROUGHPUT = ${THROUGHPUT_TPS}"
        echo "    AVGLATENCY = ${AVGLATENCY}"
        echo "    ELAPSEDSECONDS = ${ELAPSEDSECONDS}"
        echo "    PATHLENGTH = ${PATHLENGTH}"
        echo "    TOTALERRORS = ${TOTALERRORS}"

        echo "    READS = ${READS}"
        echo "    WRITES = ${WRITES}"
        echo "    QUERIES = ${QUERIES}"
        echo "    THROUGHPUT_QPS = ${THROUGHPUT_QPS}"
        echo "    PERCENTILE95 = ${PERCENTILE95}"
        echo "    TOTALLATENCY = ${TOTALLATENCY}"
        echo "    FATALERRORS = ${FATALERRORS}"

        echo -e ${TOTAL_STREAMS}'\t'${THROUGHPUT_TPS}'\t'${AVGLATENCY}'\t'${ELAPSEDSECONDS}'\t'${TRANSACTIONS}'\t'${PATHLENGTH}'\t'${THROUGHPUT_QPS}'\t'${FATALERRORS} >> ${LOGDIRECTORY}/test.data

    }

    echo
    echo "    ===== Test Complete =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"

    if [[ ${STOP_DELAY} ]] ; then
        echo
        echo "    Stop Delay:  Sleeping for ${STOP_DELAY} seconds.        [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time sleep ${STOP_DELAY}
    fi

    echo
    echo "    ===== Post Test Processing =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo
        echo "    ===== Consolidate Test Results =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        {
            echo
            echo "Consolidated Sysbench Test Results:"
            echo
            echo "    Test Configuration:"
            echo "        Workload:                   ${WORKLOAD}"
            echo "        DBScale:                    ${DBSCALE}"
            echo "        Drivers:                    ${#DRIVER_NODES[@]}"
            echo "        Concurrency:                ${TOTAL_STREAMS}"
            echo
            echo "    SQL statistics:"
            echo "        queries performed:"
            echo "            read:                   "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " read: " | awk 'BEGIN { sum = 0 }; { sum = sum + $2 }; END { printf "%d", sum }')
            echo "            write:                  "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " write: " | awk 'BEGIN { sum = 0 }; { sum = sum + $2 }; END { printf "%d", sum }')
            echo "            other:                  "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " other: " | awk 'BEGIN { sum = 0 }; { sum = sum + $2 }; END { printf "%d", sum }')
            echo "            total:                  "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " total: " | awk 'BEGIN { sum = 0 }; { sum = sum + $2 }; END { printf "%d", sum }')
            echo "        transactions:               "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " transactions: " | sed 's/(//g;s/)//g' | awk 'BEGIN { trans = 0; rate = 0.0 }; { trans = trans + $2; rate = rate + $3 }; END { printf "%d ( %.2f per sec. )", trans, rate }')
            echo "        queries:                    "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " queries: " | sed 's/(//g;s/)//g' | awk 'BEGIN { trans = 0; rate = 0.0 }; { trans = trans + $2; rate = rate + $3 }; END { printf "%d ( %.2f per sec. )", trans, rate }')
            echo "        ignored errors:             "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " ignored errors: " | sed 's/(//g;s/)//g' | awk 'BEGIN { trans = 0; rate = 0.0 }; { trans = trans + $3; rate = rate + $4 }; END { printf "%d ( %.2f per sec. )", trans, rate }')
            echo "        reconnects:                 "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " reconnects: " | sed 's/(//g;s/)//g' | awk 'BEGIN { trans = 0; rate = 0.0 }; { trans = trans + $2; rate = rate + $3 }; END { printf "%d ( %.2f per sec. )", trans, rate }')
            echo
            echo "    Throughput:"
            echo "        events/s (eps):             "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " eps" | awk 'BEGIN { sum = 0.0 }; { sum = sum + $3 }; END { printf "%.4f", sum }')
            echo "        time elapsed:               "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " time elapsed:" | sed 's/s//g' | awk 'BEGIN { count = 0; sum = 0 }; { count = count + 1; sum = sum + $3 }; END { printf "%.4f", sum/count }')
            echo "        total number of events:     "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " total number of events:" | awk 'BEGIN { sum = 0 }; { sum = sum + $5 }; END { printf "%d", sum }')
            echo
            echo "    Latency (ms):"
            echo "        min:                        "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " min:" | awk 'BEGIN { min = 999999 }; { if ( $2 < min ) { min = $2 } }; END { printf "%.2f", min }')
            echo "        avg:                        "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " avg:" | awk 'BEGIN { count = 0; sum = 0 }; { count = count + 1; sum = sum + $2 }; END { printf "%.2f", sum/count }')
            echo "        max:                        "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " max:" | awk 'BEGIN { max = 0 }; { if ( $2 > max ) { max = $2 } }; END { printf "%.2f", max }')
            echo "        95th percentile:            "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " 95th percentile:" | awk 'BEGIN { max = 0 }; { if ( $3 > max ) { max = $3 } }; END { printf "%.2f", max }')
            echo "        sum:                        "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep " sum:" | awk 'BEGIN { sum = 0 }; { sum = sum + $2 }; END { printf "%.2f", sum }')
            echo
            echo "    Errors:                         "$(cat ${LOGDIRECTORY}/*.driver.*.log | grep 'FATAL' | wc -l )
            echo
        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).consolidated.test.results.txt

        echo
        echo "    ===== Gather After Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        gather_after_data

        echo
        echo "        ===== Stop Performance Monitors =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time stop_monitors

        if [[ ${OPTION_CLEANUP} ]] ; then
            echo
            echo "        ===== Clean Up:  Delete Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time mariadb -vvv $(get_database_connection) -e "drop database ${SCHEMA}"
        fi

        echo
        echo "        ===== Generate Interval Graph =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time generate_interval_graph;

        if [[ ${PROFILE_TYPE} ]] ; then
            echo
            echo "    ===== Copy Profiles =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time stop_profiling ${CLUSTER}
        fi

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).post.processing.log 2>&1

    echo
    echo "    ===== Final Results =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    cat ${LOGDIRECTORY}/*.consolidated.test.results.txt
    echo
    cat ${LOGDIRECTORY}/test.data
    echo

    echo
    echo "        LOGDIRECTORY            = ${LOGDIRECTORY}"
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( ${SECONDS} - ${STARTSECONDS} )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
