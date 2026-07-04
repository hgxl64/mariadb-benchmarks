#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
    Runs a performance curve using the specified driver/benchmark/workload
    Options:

        [ -h|--help ]
    Notes:
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in

        --driver)               BENCHMARK_DRIVER="$1"; shift;;
        --benchmark)            BENCHMARK="$1"; shift;;
        --workload)             WORKLOAD="$1"; shift;;

         # Connection Info
        --cluster)              CLUSTER="$1"; shift;;
        --system)               CLUSTER="$1"; shift;;

        # Performance Curve Controls
        --streams)              START_STREAMS="$1"; shift;;
        --start_streams)        START_STREAMS="$1"; shift;;
        --max_streams)          MAX_STREAMS="$1"; shift;;
        --target_latency)       TARGET_LATENCY="$1"; shift;;
        --start_delay)          START_DELAY="$1"; shift;;
        --intertest_delay)      INTER_TEST_DELAY="$1"; shift;;
        --stop_delay)           STOP_DELAY="$1"; shift;;
        --slave_delay)          OPTION_SLAVE_DELAY=TRUE;;

        # Benchmark/Workload Controls
        --schema)               SCHEMA="$1"; shift;;
        --dbscale)              DBSCALE="$1"; shift;;
        --cleanup)              OPTION_CLEANUP=TRUE;;

        --duration)             CBENCH_ARGS="${CBENCH_ARGS} --duration $1"; shift;;
        --exectime)             CBENCH_ARGS="${CBENCH_ARGS} --duration $1"; shift;;
        --reportinterval)       CBENCH_ARGS="${CBENCH_ARGS} --reportinterval $1"; shift;;
        --testid)               TESTID="$1"; shift;;

        # Sysbench Options
        --tables)               SYSBENCH_TABLE_ARGS="${SYSBENCH_TABLE_ARGS} --tables $1"; shift;;
        --sbtables)             SYSBENCH_TABLE_ARGS="${SYSBENCH_TABLE_ARGS} --tables $1"; shift;;
        --dbtables)             SYSBENCH_TABLE_ARGS="${SYSBENCH_TABLE_ARGS} --tables $1"; shift;;
        --tablesize)            SYSBENCH_TABLE_ARGS="${SYSBENCH_TABLE_ARGS} --tablesize $1"; shift;;
        --sbtablesize)          SYSBENCH_TABLE_ARGS="${SYSBENCH_TABLE_ARGS} --tablesize $1"; shift;;
        --randtype)             SYSBENCH_ARGS="${SYSBENCH_ARGS} --randtype $1"; shift;;
        --threadinittimeout)    SYSBENCH_ARGS="${SYSBENCH_ARGS} --threadinittimeout $1"; shift;;
        --distribution)         SYSBENCH_ARGS="${SYSBENCH_ARGS} --distribution $1"; shift;;
        --autocommit)           SYSBENCH_ARGS="${SYSBENCH_ARGS} --skiptransaction";;
        --skiptransaction)      SYSBENCH_ARGS="${SYSBENCH_ARGS} --skiptransaction";;
        --ignoreerrors)         SYSBENCH_ARGS="${SYSBENCH_ARGS} --ignoreerrors";;
        --reconnect)            SYSBENCH_ARGS="${SYSBENCH_ARGS} --reconnect $1"; shift;;
        --ssl)                  SYSBENCH_ARGS="${SYSBENCH_ARGS} --ssl";;
        --skipbinlog)           SYSBENCH_ARGS="${SYSBENCH_ARGS} --skipbinlog";;
        --histogram)            SYSBENCH_ARGS="${SYSBENCH_ARGS} --histogram";;

        # HammerDB Options
        --allwarehouse)         ALLWAREHOUSE=TRUE;;

        # CBENCH Options
        --binlogging)           ENABLE_BINLOGGING=TRUE;;

        --force_innodb_checkpoint) OPTION_FORCE_INNODB_CHECKPOINT=TRUE;;

        --skipmonitor)          OPTION_PERFMONITOR=FALSE;;
        --skipsnapshot)         export OPTION_SNAPSHOT=FALSE;;
        --skipcheck)            export OPTION_SKIPCHECK=TRUE;;
        --grafana)              OPTION_GRAFANA=TRUE;;

        -h|--help)              echo -e "$USAGE"; exit 1;;

        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;

    esac
done

process_connection_info

[[ ${OPTION_PERFMONITOR} ]] || OPTION_PERFMONITOR=FALSE
[[ ${OPTION_GRAFANA} ]] || OPTION_GRAFANA=FALSE

[[ ${DATABASE} ]] || DATABASE='mariadb'
[[ ${INTER_TEST_DELAY} ]] || INTER_TEST_DELAY=10

case ${BENCHMARK} in
    tproc-c)
        [[ ${BENCHMARK_DRIVER} ]] || BENCHMARK_DRIVER='hammerdb'
        [[ ${START_STREAMS} ]] || START_STREAMS=8
        [[ ${MAX_STREAMS} ]] || MAX_STREAMS=1024
        [[ ${TARGET_LATENCY} ]] || TARGET_LATENCY=20
        ;;
    sysbench-tpcc)
        [[ ${BENCHMARK_DRIVER} ]] || BENCHMARK_DRIVER='sysbench'
        [[ ${START_STREAMS} ]] || START_STREAMS=8
        [[ ${MAX_STREAMS} ]] || MAX_STREAMS=1024
        [[ ${TARGET_LATENCY} ]] || TARGET_LATENCY=50
        ;;
    sysbench)
        [[ ${BENCHMARK_DRIVER} ]] || BENCHMARK_DRIVER='sysbench'
        [[ ${START_STREAMS} ]] || START_STREAMS=8
        [[ ${MAX_STREAMS} ]] || MAX_STREAMS=$(( 2048 * ${NUMOFDRIVERS} ))
        if [[ ! ${TARGET_LATENCY} ]] ; then
             #  Target latency should be 40% higher than "top of the chart"
            case ${WORKLOAD} in
                pointselect|oltp_point_select) TARGET_LATENCY=10;;
                pointupdate|oltp_insert) TARGET_LATENCY=20;;
                9010|90-10) TARGET_LATENCY=50;;
                *) TARGET_LATENCY=70;;
            esac
        fi
        ;;
esac


if [[ ${ENABLE_BINLOGGING} ]] ; then
    if [[ ${WORKLOAD} ]] ; then
        TEST_NAME=${BENCHMARK}.${WORKLOAD}.binlog.curve
    else
        TEST_NAME=${BENCHMARK}.binlog.curve
    fi
else
    if [[ ${WORKLOAD} ]] ; then
        TEST_NAME=${BENCHMARK}.${WORKLOAD}.curve
    else
        TEST_NAME=${BENCHMARK}.curve
    fi
fi

[[ ${TESTID} ]] || TESTID=$(date +%y%m%d.%H%M%S).${CLUSTER}
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}.${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

time {

    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    STARTSECONDS=$SECONDS

    echo "
        $0 ${COMMAND_LINE}

            TESTID                  = ${TESTID}

            DATABASE                = ${DATABASE}
            DRIVER                  = ${BENCHMARK_DRIVER}
            BENCHMARK               = ${BENCHMARK}
            WORKLOAD                = ${WORKLOAD}

            CLUSTER / SYSTEM        = ${CLUSTER}

            NUMOFNODES              = ${NUMOFNODES}
            CLUSTER_NODES           = ${CLUSTER_NODES[*]}
            NUMOFDRIVERS            = ${NUMOFDRIVERS}
            DRIVER_NODES            = ${DRIVER_NODES[*]}

            SCHEMA                  = ${SCHEMA}
            DBSCALE                 = ${DBSCALE}
            LOAD_OPTIONS            = ${LOAD_OPTIONS}
            OPTION_CLEANUP          = ${OPTION_CLEANUP}

            START_STREAMS           = ${START_STREAMS}
            MAX_STREAMS             = ${MAX_STREAMS}
            TARGET_LATENCY          = ${TARGET_LATENCY}

            CBENCH_ARGS             = ${CBENCH_ARGS}
            SYSBENCH_ARGS           = ${SYSBENCH_ARGS}

            LOGDIRECTORY            = ${LOGDIRECTORY}
        "

    echo
    echo "    ===== Pre Test Processing  =====       [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "            Database Version : $(get_database_version)"
    echo
    echo "            Properties File:"
    showproperties
    echo

    time {

        if [[ ! ${OPTION_SKIPCHECK} ]] ; then
            echo
            echo "    ===== Check System/Cluster =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time check_cluster
        fi

        echo
        echo "    ===== Gather Pretest Snapshot =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time {
            gather_pretest_snapshot ${CLUSTER}
            ping_test ${CLUSTER}
        }

        echo
        echo "    ===== Capture env settings =====    [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time env

        [[ ${OPTION_SLAVE_DELAY} ]] && wait_for_slaves

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).preprocessing.log 2>&1

    echo
    echo "    ===== Start Performance Monitors =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time start_performance_monitor ${CLUSTER} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).start.performance.monitor 2>&1

    [[ ${OPTION_GRAFANA} == TRUE ]] && start_grafana

    echo
    echo "    ===== Run Performance Curve =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        echo -e 'streams''\t''throughput''\t''avg_latency''\t''elapsed_secs''\t''transactions''\t''path_length''\t''qps''\t''errors'  > ${LOGDIRECTORY}/test.data

        CURRENT_LATENCY=0.0

        if [[ ${START_DELAY} ]] ; then
            echo
            echo "    Start Delay:  Sleeping for ${START_DELAY} seconds.        [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            sleep ${START_DELAY}
        fi

        for (( STREAMS = ${START_STREAMS} ; STREAMS <= ${MAX_STREAMS} ; STREAMS = ${STREAMS} * 2 )) ; do

            echo
            echo "    CURRENT_STREAMS : ${STREAMS} , MAX_STREAMS : ${MAX_STREAMS} "
            echo "    CURRENT_LATENCY : ${CURRENT_LATENCY} , TARGET_LATENCY : ${TARGET_LATENCY} "

            #  Test will cycle until average latency is above the target latency
            if (( $(echo "${CURRENT_LATENCY} ${TARGET_LATENCY}" | awk '{print ($1 <= $2)}') )) ; then

                echo
                echo "    ===== Inter Test Processing =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                time {
                    [[ ${OPTION_FORCE_INNODB_CHECKPOINT} ]] && force_innodb_checkpoint
                    [[ ${OPTION_SLAVE_DELAY} ]] && wait_for_slaves
                    [[ ${OPTION_SLAVE_DELAY} ]] && purge_binary_logs
                    [[ ${OPTION_SLAVE_DELAY} ]] || trim_binary_logs
                    if [[ ${INTER_TEST_DELAY} ]] ; then
                        echo
                        echo "        Inter Test Delay : Sleeping for ${INTER_TEST_DELAY} seconds.        [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                        sleep ${INTER_TEST_DELAY}
                    fi
                }

                echo
                echo "    ===== Run Performance Test - Streams ${STREAMS} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
                STREAMS_LIST="${STREAMS_LIST} ${STREAMS}"
                echo
                echo "        Running ${BENCHMARK_DRIVER} driver, ${STREAMS} total streams."

                if [[ ${BENCHMARK_DRIVER} == sysbench* ]] ; then
                    COMMAND="sysbench.run.sh --cluster ${CLUSTER} --skipcheck --benchmark ${BENCHMARK}"
                    [[ ${WORKLOAD} ]] && COMMAND="${COMMAND} --workload ${WORKLOAD}"
                    [[ ${BENCHMARK_DRIVER} ]] && COMMAND="${COMMAND} --driver ${BENCHMARK_DRIVER}"
                    [[ ${SCHEMA} ]] && COMMAND="${COMMAND} --schema ${SCHEMA}"
                    [[ ${DBSCALE} ]] && COMMAND="${COMMAND} --dbscale ${DBSCALE}"
                    [[ ${STREAMS} ]] && COMMAND="${COMMAND} --totalstreams ${STREAMS}"
                    [[ ${CBENCH_ARGS} ]] && COMMAND="${COMMAND} ${CBENCH_ARGS}"
                    [[ ${SYSBENCH_TABLE_ARGS} ]] && COMMAND="${COMMAND} ${SYSBENCH_TABLE_ARGS}"
                    [[ ${SYSBENCH_ARGS} ]] && COMMAND="${COMMAND} ${SYSBENCH_ARGS}"
                elif [[ ${BENCHMARK_DRIVER} == "hammerdb" ]] ; then
                    COMMAND="hammerdb.run.sh --cluster ${CLUSTER} --skipcheck --benchmark ${BENCHMARK}"
                    [[ ${SCHEMA} ]] && COMMAND="${COMMAND} --schema ${SCHEMA}"
                    [[ ${DBSCALE} ]] && COMMAND="${COMMAND} --dbscale ${DBSCALE}"
                    [[ ${STREAMS} ]] && COMMAND="${COMMAND} --totalstreams ${STREAMS}"
                    [[ ${CBENCH_ARGS} ]] && COMMAND="${COMMAND} ${CBENCH_ARGS}"
                    [[ ${ALLWAREHOUSE} ]] && COMMAND="${COMMAND} --allwarehouse"
                fi
                echo "        COMMAND = ${COMMAND}"

                time ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${BENCHMARK}.run.${STREAMS}.log 2>&1

                if [[ ${BENCHMARK_DRIVER} == sysbench* ]] ; then

                    {
                        echo ${CLUSTER}
                        echo
                        echo ${TESTID}.${TEST_NAME}
                        printf "%-11s %12s %12s %12s %8s\n" 'concurrency' 'throughput' 'avg_latency' '95th_latency' 'errors'
                        for RESULT_FILE in ${LOGDIRECTORY}/*.run/*.consolidated.test.results.txt ; do
                            cat ${RESULT_FILE} | awk '
                                / Concurrency: / { concurrency = $2 }
                                / transactions: / { throughput = $4 }
                                / avg: / { avg_latency = $2 }
                                / 95th percentile: / { latency_95th = $3 }
                                / Errors: / { errors = $2 }
                                END {
                                    printf "%-11d %12.2f %12.3f %12.3f %8d\n", concurrency, throughput, avg_latency, latency_95th, errors;
                                }
                                '
                        done
                    } > ${LOGDIRECTORY}/test.data

                    ERRORS=$( tail -1 ${LOGDIRECTORY}/test.data | awk '{ print $5 }')

                elif [[ ${BENCHMARK_DRIVER} == "hammerdb" ]] ; then
                    {
                        echo ${CLUSTER}
                        echo
                        echo ${TESTID}.${TEST_NAME}
                        printf "%-11s %12s %12s %8s\n" 'concurrency' 'throughput' 'avg_latency' 'errors'
                        for RESULT_FILE in ${LOGDIRECTORY}/*.run/test.data ; do
                            tail -1 ${RESULT_FILE} | awk '{ printf "%-11d %12.2f %12.3f %8d\n", $1, $2, $3, $8 }'
                        done
                    } > ${LOGDIRECTORY}/test.data

                    ERRORS=$( tail -1 ${LOGDIRECTORY}/test.data | awk '{ print $4 }')
                fi

                echo
                cat ${LOGDIRECTORY}/test.data
                echo

                CURRENT_LATENCY=$( tail -1 ${LOGDIRECTORY}/test.data | awk '{ print $3 }')
                #  if latency is 0, then assume something has gone wrong and exit
                (( $(echo "${CURRENT_LATENCY} 0" | awk '{print ($1 == $2)}') )) && (( CURRENT_LATENCY = TARGET_LATENCY + 1 ))

                #  if prior test had errors, then assume something has gone wrong and exit
                [[ ${ERRORS} ]] && (( ${ERRORS} != 0 )) && (( CURRENT_LATENCY = TARGET_LATENCY + 1 ))

                #  run only first benchmark with warmup
                [[ ${WARMUP_TIME} > 0 ]] && export WARMUP_TIME=0

                generate_performance_curve_graph

            else
                echo ${STREAMS} >> ${LOGDIRECTORY}/test.data
            fi

        done

    }

    echo
    echo "    ===== Test Complete =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

    [[ ${OPTION_SLAVE_DELAY} ]] && wait_for_slaves

    echo "    ===== Test Results =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo "${TESTID}.${TEST_NAME}"
    cat ${LOGDIRECTORY}/test.data
    echo

    if [[ ${STOP_DELAY} ]] ; then
        echo
        echo "    Stop Delay : Sleeping for ${STOP_DELAY} seconds.        [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        sleep ${STOP_DELAY}
    fi

    echo
    echo "    ===== Post Processing =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    time {

        stop_monitors;

        [[ ${OPTION_GRAFANA} == TRUE ]] && stop_grafana > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.log 2>&1

        gather_posttest_snapshot ${CLUSTER};

        if [[ ${OPTION_CLEANUP} ]] ; then
            echo "    ===== Clean Up : Delete Data =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            mariadb -vvv $(get_database_connection) -e "drop database ${SCHEMA}" > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).delete.data.log 2>&1
        fi

    } > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).post.processing.log 2>&1

    echo
    echo "        LOGDIRECTORY            = ${LOGDIRECTORY}"
    echo
    echo "    ===== End $0 ( Elapsed Seconds = $(( $SECONDS - $STARTSECONDS )) ) =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
