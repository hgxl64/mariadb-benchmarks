#!/bin/bash

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Experiment:  Run Sysbench performance curves

    Parameters:
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)          CLUSTER="$1"; shift;;
        --repeats)          OPTION_REPEATS="$1"; shift;;
        --intertestdelay)   OPTION_INTER_TEST_DELAY="$1"; shift;;
        --engine)           OPTION_ENGINE="$1"; shift;;
        --load)             OPTION_LOAD=TRUE;;
        --skiptransaction)  OPTION_SKIP_TRANSACTION=TRUE;;
        --autocommit)       OPTION_SKIP_TRANSACTION=TRUE;;
        --workload)         OPTION_WORKLOAD="$1"; shift;;
        --ssl)              OPTION_SSL=TRUE;;
        --skipbinlog)       SKIP_BINLOG=TRUE;;
        --start_streams)    START_STREAMS="$1"; shift;;
        --max_streams)      MAX_STREAMS="$1"; shift;;
        --tables)           SBTABLES=$1; shift;;
        --sbtables)         SBTABLES=$1; shift;;
        --dbtables)         SBTABLES=$1; shift;;
        --tablesize)        SBTABLESIZE=$1; shift;;
        --sbtablesize)      SBTABLESIZE=$1; shift;;
        -h|--help)          echo -e "$USAGE"; exit 1;;
        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done

[[ ${CLUSTER} ]] || { echo "Required CLUSTER not specified"; echo -e "$0 ${COMMAND_LINE}"; exit 1; }
[[ ${BENCHMARK} ]] || BENCHMARK='sysbench'
[[ ${OPTION_WORKLOAD} ]] || OPTION_WORKLOAD='9010'
[[ ${OPTION_TABLES} ]] || OPTION_TABLES=10
[[ ${OPTION_REPEATS} ]] || OPTION_REPEATS=1
[[ ${OPTION_INTER_TEST_DELAY} ]] || OPTION_INTER_TEST_DELAY=20

[[ ${WORKLOAD} == 'pointselect' ]] && MAXLATENCY=10
[[ ${WORKLOAD} == 'pointupdate' ]] && MAXLATENCY=10
[[ ${WORKLOAD} ]] || MAXLATENCY=50

TEST_NAME="${BENCHMARK}.${OPTION_WORKLOAD}.curves"
if [[ ! ${TESTID} ]] ; then TESTID=$(date +%y%m%d.%H%M%S).${TEST_NAME}; fi
if [[ ! ${LOGDIRECTORY} ]] ; then
    export LOGDIRECTORY=${CBENCH_LOG_HOME}/${CLUSTER}/${TESTID}
else
    LOGDIRECTORY=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}

{

    echo
    echo "    ===== Begin $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    STARTSECONDS=$SECONDS
    echo
    echo "        TESTID            = ${TESTID}"
    echo
    echo "        CLUSTER           = ${CLUSTER}"
    echo "        COMMAND_LINE      = ${COMMAND_LINE}"
    echo
    echo "        LOGDIRECTORY      = ${LOGDIRECTORY}"

    if [[ ${OPTION_LOAD} ]] ; then
        echo
        echo "    ===== Load Data - Cluster = ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time {
            COMMAND="sysbench.load.sh --cluster ${CLUSTER} --tables ${OPTION_TABLES} --load --noautoinc --cloud"
            [[ ${OPTION_ENGINE} ]] && COMMAND="${COMMAND} --engine ${OPTION_ENGINE}"
            echo
            echo "        COMMAND = ${COMMAND}"
            ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).load.data.${CLUSTER}.log 2>&1
        }
    fi

    [[ ${START_STREAMS} ]] || START_STREAMS=8
    [[ ${MAX_STREAMS} ]] || MAX_STREAMS=2048

    for (( IDX = 1 ; IDX <= ${OPTION_REPEATS} ; IDX++ )) ; do

        # run first curve with warmup
        if [[ ${IDX} == 1 ]] ; then
            export WARMUP_TIME=60
        else
            export WARMUP_TIME=0
        fi

        if [[ ${FORCE_DATABASE_RESTART} ]] ; then
            echo "    ===== Forcing Database Restart - Pass ${IDX} - Cluster ${CLUSTER} =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
            time $(force_database_restart)
            #always warmup after restart
            export WARMUP_TIME=60
        fi

        echo
        echo "    ===== Run Performance Curve - Pass ${IDX} - Cluster ${CLUSTER} - Benchmark ${BENCHMARK} - Workload ${OPTION_WORKLOAD}  - Start Stream ${START_STREAMS} - MaxStream ${MAX_STREAMS}  =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time {
            COMMAND="sysbench.curve.sh --cluster ${CLUSTER} --workload ${OPTION_WORKLOAD} --start_streams ${START_STREAMS} --max_streams ${MAX_STREAMS} --cloud"
            [[ ${SBTABLESIZE} ]]             && COMMAND="${COMMAND} --sbtablesize ${SBTABLESIZE}"
            [[ ${SBTABLES} ]]                && COMMAND="${COMMAND} --sbtables ${SBTABLES}"
            [[ ${OPTION_SKIP_TRANSACTION} ]] && COMMAND="${COMMAND} --skiptransaction"
            [[ ${SKIP_BINLOG} ]]             && COMMAND="${COMMAND} --skipbinlog"
            [[ ${OPTION_SSL} ]]              && COMMAND="${COMMAND} --ssl"
            echo
            echo "        COMMAND = ${COMMAND}"
            ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).performance.curve.${CLUSTER}.log 2>&1
        }

        echo
        echo "    ===== Test Complete - Plot results =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
        TITLE="${TESTID} - ${CLUSTER} - ${BENCHMARK} - ${OPTION_WORKLOAD} - Performance Curves"
        CURVES_PLOT=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${BENCHMARK}.${OPTION_WORKLOAD}.performance.curves
        GNUPLOT_FILE=${CURVES_PLOT}.txt
        OUTPUT=${CURVES_PLOT}.png
        TESTS=( $(ls -d1 ${LOGDIRECTORY}/*.curve) )
        LABELS=( ${LABELS[*]} 'Pass-'${IDX} )
        {
            echo "set terminal png size 960,480 noenhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
            echo "set yrange [0:${MAXLATENCY}]"
            echo "set xrange [0:]"
            echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0"
            echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0"
            echo "set ylabel 'Avg Latency (ms)'"
            echo "set xlabel 'Throughput (tps)'"
            echo "set title '${TITLE}'"
            echo "set key top left"
            echo "set output '${OUTPUT}'"
            echo "plot \\"
            for (( IDX=0; IDX<${#TESTS[@]}; IDX++ )) ; do
                echo " '${TESTS[${IDX}]}/test.data' using 2:3 title '${LABELS[${IDX}]}' with linespoint pointtype 7,\\"
            done
            echo " '' using 2:3:1 with labels center offset 1.5, 0.5 notitle"
            echo "exit"
        } > ${GNUPLOT_FILE}
        cat ${GNUPLOT_FILE} | gnuplot

        if (( ${IDX} != ${OPTION_REPEATS} )) ; then
            echo
            echo "        Sleep for ${OPTION_INTER_TEST_DELAY} seconds."
            sleep ${OPTION_INTER_TEST_DELAY};
        fi
    done

    echo
    echo "    ===== Consolidate Results =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
    {
        echo ${TESTID}
        echo -e 'streams''\t''throughput''\t''avg_latency'
        for (( STREAMS = 1 ; STREAMS < 10000 ; STREAMS = STREAMS * 2 )) ; do
            cat ${LOGDIRECTORY}/*.curve/test.data | grep -P "^${STREAMS} " | awk '
                { streams = $ 1; total_tests++; total_throughput = total_throughput + $2; total_latency = total_latency + $3 }
                END {if (total_tests > 0 ) {printf "%s\t%.2f\t%.2f\n", streams , total_throughput / total_tests, total_latency / total_tests} }
                '
        done
    } > ${LOGDIRECTORY}/test.data

    echo
    echo "    ===== Test Results =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo
    echo ${CLUSTER}
    echo
    echo ${TESTID}
    echo
    IDX=1
    for TEST in $(ls -d1 ${LOGDIRECTORY}/*curve) ; do
        echo
        echo "Pass${IDX}"
        echo
        echo ${TEST}
        cat ${TEST}/test.data
        echo
        (( IDX = ${IDX} + 1 ))
    done
    echo
    cat ${LOGDIRECTORY}/test.data

    echo
    echo "    ===== End $0 =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
    echo

} 2>&1 | tee ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}.log
