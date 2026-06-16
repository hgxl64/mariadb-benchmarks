#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Runs a HammerDB performance test.
    Options:
        [ --benchmark <<benchmark>> ]
        [ --cluster <<clustername>> ]
        [ --schema  <<schemaname>> ]
        [ --dbscale <<dbscale>> ]
        [ --streams <<streams>> ]
        [ --exectime <<exectime>> ]
        [ --reload ]
        [ --durability <<levelofdurability>> ]
        [ -h|--help ]
    Notes:
        1.  cluster : name of the cluster identified by properties file clustername.properties.  Default : look in dbconnect.properties
        2.  dbscale : size of the database in million of records.  Default : sysbench.default.dbscale defined in properties file or 10
        3.  streams : number of streams per driver.  Default : sysbench.default.streams defined in properties file or 100
        4.  load|reload : option to load fresh or restore from backup.  Default : neither
        5.  exectime : Length of test in seconds.  Default : 300
        6.  durability: Controls level of durability the test will run. (Values: default, strict, relaxed)  Default : relaxed
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --benchmark)            BENCHMARK="$1"; shift;;

        # Connection Info
        --cluster)              CLUSTER="$1"; shift;;

        --database)             DATABASE="$1"; shift;;
        --drivers)              DRIVERS="$1"; shift;;

        # Benchmark Controls
        --schema)               SCHEMA="$1"; shift;;
        --dbscale)              DBSCALE="$1"; shift;;
        --duration)             DURATION="$1"; shift;;
        --exectime)             DURATION="$1"; shift;;
        --rampuptime)           RAMPUP="$1"; shift;;
        --warmtime)             RAMPUP="$1"; shift;;
        --streams)              TOTAL_STREAMS="$1"; shift;;
        --totalstreams)         TOTAL_STREAMS="$1"; shift;;
        --reload)               OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --restore";;
        --load)                 OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --load";;
        --restore)              OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --restore";;
        --import)               OPTION_LOADTABLES=TRUE;LOAD_OPTIONS="${LOAD_OPTIONS} --import";;
        --noload)               LOAD_OPTIONS="${LOAD_OPTIONS} --noload";;
        --slices)               LOAD_OPTIONS="${LOAD_OPTIONS} --slices $1"; shift;;
        --replicas)             LOAD_OPTIONS="${LOAD_OPTIONS} --replicas $1"; shift;;
        --dbversion)            LOAD_OPTIONS="${LOAD_OPTIONS} --dbversion $1"; shift;;
        --engine)               LOAD_OPTIONS="${LOAD_OPTIONS} --engine $1"; ENGINE="$1"; shift;;

        # HammerDB Options
        --ssl)                  OPTION_SSL=TRUE;;
        --prepared)             PREPARED=TRUE;;
        --allwarehouse)         ALLWAREHOUSE=TRUE;;


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

[[ ${OPTION_SNAPSHOT} ]] || OPTION_SNAPSHOT=TRUE
[[ ${OPTION_PERFMONITOR} ]] || OPTION_PERFMONITOR=FALSE

[[ ${PREPARED} ]] || PREPARED=TRUE
[[ ${STOREDPROC} ]] || STOREDPROC=TRUE
[[ ${ALLWAREHOUSE} ]] || ALLWAREHOUSE=FALSE

[[ ${DURATION} ]] || DURATION=300

#round duration to whole minutes
DURATION_MINUTES=$(( ${DURATION} / 60 ))
if [[ $(( ${DURATION_MINUTES} * 60 )) < ${DURATION} ]] ; then
    DURATION_MINUTES=$(( ${DURATION_MINUTES} + 1 ))
    DURATION=$(( ${DURATION_MINUTES} * 60 ))
fi

[[ ${RAMPUP} ]] || RAMPUP=60

#round ramp-up time to whole minutes
RAMPUP_MINUTES=$(( ${RAMPUP} / 60 ))
if [[ $(( ${RAMPUP_MINUTES} * 60 )) < ${RAMPUP} ]] ; then
    RAMPUP_MINUTES=$(( ${RAMPUP_MINUTES} + 1 ))
    RAMPUP=$(( ${RAMPUP_MINUTES} * 60 ))
fi

DURATION=$(( ${DURATION} + ${RAMPUP} ))


process_connection_info;

[[ ${DATABASE} ]] || DATABASE='mariadb'
[[ ${ENGINE} ]] || ENGINE='innodb'
[[ ${BENCHMARK} ]] || BENCHMARK='tproc-c'

if [[ ${BENCHMARK} == 'tproc-c' ]] ; then
    BENCHMARK_DRIVER='hammerdbcli'
    [[ ${SCHEMA} ]] || SCHEMA='tprocc'
    [[ ${DBSCALE} ]] || DBSCALE=100
    # Single driver
    NUMOFDRIVERS=1
    DRIVER_NODE=( ${DRIVER_NODES[0]} )
else
    echo "$0 : don't know how to handle benchmark ${BENCHMARK}"
    exit 1
fi

[[ ${TOTAL_STREAMS} ]] || TOTAL_STREAMS=$(( ${DBSCALE} / 10 ))


TEST_NAME=${BENCHMARK}.run
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
    print_variable_report 12 TESTID "" BENCHMARK "" CLUSTER DATABASE "" \
        NUMOFNODES CLUSTER_NODES NUMOFDRIVERS DRIVER_NODES "" \
        SCHEMA DBSCALE TOTAL_STREAMS RAMPUP_MINUTES DURATION_MINUTES \
        LOAD_OPTIONS "" ALLWAREHOUSE STOREDPROC PREPARED ""
    print_variable_report 12 OPTION_SKIPCHECK OPTION_CLEANUP OPTION_SNAPSHOT "" LOGDIRECTORY

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
            time set_max_prepared_stmt_count ${CLUSTER} $(( 100 * ${TOTAL_STREAMS} ))
        fi
        time set_max_connections ${CLUSTER} $(( ${TOTAL_STREAMS} + 10 ))

        if [[ ${OPTION_SSL} ]] ; then
            echo "            Option SSL : not implemented; FIXME!"
        fi

        if [[ ! ${OPTION_SKIPCHECK} || ${OPTION_LOADTABLES} ]] ; then
            echo
            echo "    ===== Check/Load Data =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            COMMAND="load.data.sh --cluster ${CLUSTER} --benchmark ${BENCHMARK} --schema ${SCHEMA} --dbscale ${DBSCALE} ${LOAD_OPTIONS}"
            echo "        COMMAND = ${COMMAND}"
            time ${COMMAND}
        fi

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

        start_performance_monitor ${CLUSTER};

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).preprocessing.log 2>&1

    echo
    echo "            Operating System : $(get_os_version)"
    echo "            Database Version : $(get_database_version)"

    echo
    echo "    ===== Run Performance Test =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo
        echo "        Running ${TOTAL_STREAMS} total threads."

        SCRIPT="/data/cbench/run-tprocc.tcl"

        case ${BENCHMARK} in

            tproc-c)

                DBHOST=$(get_database_internal_host ${CLUSTER})
                DBPORT=$(get_database_port ${CLUSTER})
                DBUSER=$(get_database_user ${CLUSTER})
                DBPASS=$(get_database_password ${CLUSTER})

                if [[ ${DATABASE} == 'mariadb' ]] ; then
                    ssh $(get_ssh_connection ${CLUSTER} ${DRIVER_NODE}) '
                        DBHOST="'${DBHOST}'"
                        DBPORT="'${DBPORT}'"
                        DBUSER="'${DBUSER}'"
                        DBPASS="'${DBPASS}'"
                        SCHEMA="'${SCHEMA}'"
                        DBSCALE="'${DBSCALE}'"
                        TOTAL_STREAMS="'${TOTAL_STREAMS}'"
                        RAMPUP_MINUTES="'${RAMPUP_MINUTES}'"
                        DURATION_MINUTES="'${DURATION_MINUTES}'"
                        DURATION="'${DURATION}'"
                        ALLWAREHOUSE="'${ALLWAREHOUSE}'"
                        ENGINE="'${ENGINE}'"
                        SCRIPT="'${SCRIPT}'"
                        [[ -f ${SCRIPT} ]] && rm -f ${SCRIPT}
                        echo "dbset db maria"                                >> ${SCRIPT}
                        echo "diset connection maria_host ${DBHOST}"         >> ${SCRIPT}
                        echo "diset connection maria_port ${DBPORT}"         >> ${SCRIPT}
                        echo "diset tpcc maria_user ${DBUSER}"               >> ${SCRIPT}
                        echo "diset tpcc maria_pass ${DBPASS}"               >> ${SCRIPT}
                        echo "diset tpcc maria_dbase ${SCHEMA}"              >> ${SCRIPT}
                        echo "diset tpcc maria_storage_engine ${ENGINE}"     >> ${SCRIPT}
                        echo "diset tpcc maria_count_ware ${DBSCALE}"        >> ${SCRIPT}
                        echo "diset tpcc maria_rampup ${RAMPUP_MINUTES}"     >> ${SCRIPT}
                        echo "diset tpcc maria_duration ${DURATION_MINUTES}" >> ${SCRIPT}
                        echo "diset tpcc maria_timeprofile true"             >> ${SCRIPT}
                        if [[ ${ALLWAREHOUSE} == TRUE ]] ; then
                            echo "diset tpcc maria_allwarehouse true"        >> ${SCRIPT}
                        fi
                        echo "diset tpcc maria_prepared true"                >> ${SCRIPT}
                        echo "diset tpcc maria_raiseerror false"             >> ${SCRIPT}
                        echo "tcset logtotemp 1"                             >> ${SCRIPT}
                        echo "tcset timestamps 1"                            >> ${SCRIPT}
                        echo "loadscript"                                    >> ${SCRIPT}
                        echo "vuset vu ${TOTAL_STREAMS}"                     >> ${SCRIPT}
                        echo "vuset delay 10"                                >> ${SCRIPT}
                        echo "print dict"                                    >> ${SCRIPT}
                        echo "print tcconf"                                  >> ${SCRIPT}
                        echo "vucreate"                                      >> ${SCRIPT}
                        echo "tcstart"                                       >> ${SCRIPT}
                        echo "vurun"                                         >> ${SCRIPT}
                        echo "after 5000"                                    >> ${SCRIPT}
                        echo "tcstop"                                        >> ${SCRIPT}
                        echo "after 5000"                                    >> ${SCRIPT}
                        echo "vudestroy"                                     >> ${SCRIPT}
                        echo
                        echo "    ===== TCL script ${SCRIPT} created for MariaDB ====="
                        echo
                        cat ${SCRIPT}
                        echo
                    '
                fi
                ;;
        esac

        COMMAND="./${BENCHMARK_DRIVER} auto ${SCRIPT}"

        echo "        COMMAND = ${COMMAND}"

        {
             ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
                 COMMAND="'${COMMAND}'"
                 SCRIPT="'${SCRIPT}'"
                 echo "    Driver: $(uname -n)"
                 echo "    COMMAND = ${COMMAND}"
                 echo
                 cd /data/cbench/HammerDB-5.0
                 [[ -d tmp ]] && rm -rf tmp
                 mkdir tmp
                 TMP=$(pwd)/tmp ${COMMAND}
             '
        } 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).driver.${DRIVER_NODE}.log &

        wait $!

        sleep 10

        scp $(get_scp_copy_from_connection ${CLUSTER} ${DRIVER_NODE} ${SCRIPT} ${LOGDIRECTORY}/. )
        scp $(get_scp_copy_from_connection ${CLUSTER} ${DRIVER_NODE} /data/cbench/HammerDB-5.0/tmp/hdbxtprofile.log ${LOGDIRECTORY}/. )
        scp $(get_scp_copy_from_connection ${CLUSTER} ${DRIVER_NODE} /data/cbench/HammerDB-5.0/tmp/hdbtcount.log    ${LOGDIRECTORY}/. )

        ssh $(get_ssh_connection ${CLUSTER} ${HEADDRIVER}) '
            cd /data/cbench/HammerDB-5.0
            [[ -d tmp ]] && rm -rf tmp
        '

        touch ${LOGDIRECTORY}/hdbxtprofile.log
        touch ${LOGDIRECTORY}/hdbtcount.log

        perl -e '
        my %trx= ();
        my $p= undef;

        while (<>) {
            if (/SUMMARY/) {

                while (<>) {
                    if (/PROC: (.*)/) {
                        $p= $1;
                        next;
                    }
                    if (/CALLS: (\d+)/) {
                        $trx{$p}{"calls"} = $1;
                    }
                    if (/TOTAL: (\d+\.\d+)ms/) {
                        $trx{$p}{"time"} = $1;
                    }
                    if (/P95: (\d+\.\d+)ms/) {
                        $trx{$p}{"p95"} = $1;
                    }
                    if (/^\+\-/) {
                        last;
                    }
                }

                my ($calls, $total, $p95) = (0, 0, 0);
                print "#trx              calls   total[s]    avg[ms]    p95[ms]\n";
                for my $k (sort keys %trx) {
                    printf "%-12s %10d %10.2f %10.3f %10.3f\n", $k, $trx{$k}{"calls"},
                        $trx{$k}{"time"}/1000, $trx{$k}{"time"}/$trx{$k}{"calls"}, $trx{$k}{"p95"};
                    $calls += $trx{$k}{"calls"};
                    $total += $trx{$k}{"time"};
                    $p95   += $trx{$k}{"calls"} * $trx{$k}{"p95"};
                }
                print "#-------------------------------------------------------\n";
                printf "%-12s %10d %10.2f %10.3f %10.3f\n", "SUMMARY", $calls, $total/1000,
                    $total/$calls, $p95/$calls;

            }
        }
        ' ${LOGDIRECTORY}/hdbxtprofile.log >${LOGDIRECTORY}/transaction.data

        TRANSACTIONS=$(cat ${LOGDIRECTORY}/transaction.data | grep 'SUMMARY' | awk '{ print $2 }')
        AVGLATENCY=$(cat ${LOGDIRECTORY}/transaction.data | grep 'SUMMARY' | awk '{ print $4 }')
        PERCENTILE95=$(cat ${LOGDIRECTORY}/transaction.data | grep 'SUMMARY' | awk '{ print $5 }')
        THROUGHPUT_TPS=$(( ${TRANSACTIONS} / ${DURATION} ))

        echo "    TOTAL_STREAMS  = ${TOTAL_STREAMS}"
        echo "    TRANSACTIONS   = ${TRANSACTIONS}"
        echo "    THROUGHPUT     = ${THROUGHPUT_TPS}"
        echo "    AVGLATENCY     = ${AVGLATENCY}"
        echo "    PERCENTILE95   = ${PERCENTILE95}"
        echo "    ELAPSEDSECONDS = ${DURATION}"

        echo -e 'streams''\t''throughput''\t''avg_latency''\t''elapsed_secs''\t''transactions''\t''path_length''\t''qps''\t''fatalerrors'  > ${LOGDIRECTORY}/test.data
        echo -e ${TOTAL_STREAMS}'\t'${THROUGHPUT_TPS}'\t'${AVGLATENCY}'\t'${DURATION}'\t'${TRANSACTIONS}'\t'0'\t'0'\t'0 >> ${LOGDIRECTORY}/test.data

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
            echo "Consolidated HammerDB Test Results:"
            echo
            echo "    Test Configuration:"
            echo "        DBScale:                    ${DBSCALE}"
            echo "        Concurrency:                ${TOTAL_STREAMS}"
            echo
            echo "    TPM:"
            echo "        NOTPM:                      "$(cat ${LOGDIRECTORY}/*.run.log | grep "TEST RESULT" | awk '{ print $7 }')
            echo "        total:                      "$(cat ${LOGDIRECTORY}/*.run.log | grep "TEST RESULT" | awk '{ print $10 }')
            echo
            echo "    Transaction statistics:"
            echo
            pr -o 8 -l 1 ${LOGDIRECTORY}/transaction.data
            echo
        } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).consolidated.test.results.txt

        echo
        echo "    ===== Gather After Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        gather_after_data

        echo
        echo "        ===== Stop Performance Monitors =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time stop_monitors

        echo
        echo "        ===== Post Test Snapshot =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time gather_posttest_snapshot ${CLUSTER};

        if [[ ${OPTION_CLEANUP} ]] ; then
            echo
            echo "        ===== Clean Up:  Delete Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time mysql -vvv $(get_database_connection) -e "drop database ${SCHEMA}"
        fi

        echo
        echo "        ===== Generate Interval Graph =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time generate_interval_graph;

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
