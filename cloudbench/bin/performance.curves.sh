#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0

    Run multiple performance curves

    Parameters:

    --cluster           the CLUSTER this runs for; mandatory

    --repeats           how many repeats and
    --intertestdelay    the delay between

    --grafana           snapshot Grafana for the time of execution

    --                  separator; additional parameter will be passed
                        to performance.curve.sh
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --cluster)          CLUSTER="$1"; shift;;

        --repeats)          OPTION_REPEATS="$1"; shift;;
        --intertestdelay)   OPTION_INTER_TEST_DELAY="$1"; shift;;

        --grafana)          OPTION_GRAFANA=TRUE;;

        -h|--help)          echo -e "$USAGE"; exit 1;;

        --)                 break;;

        *) echo "Invalid input switch: $key"; echo -e "$0 ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


[[ ${CLUSTER} ]] || error "Required CLUSTER not specified"

# repetition control
[[ ${OPTION_REPEATS} ]] || OPTION_REPEATS=1
[[ ${OPTION_INTER_TEST_DELAY} ]] || OPTION_INTER_TEST_DELAY=20

#logging
TEST_NAME="performance.curves"
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

    [[ ${OPTION_GRAFANA} == TRUE ]] && start_grafana

    for (( IDX = 1 ; IDX <= ${OPTION_REPEATS} ; IDX++ )) ; do

        # run first curve with warmup
        if [[ ${IDX} == 1 ]] ; then
            export WARMUP_TIME=60
        else
            export WARMUP_TIME=0
        fi

        echo
        echo "    ===== Run Performance Curve - Pass ${IDX} - Cluster ${CLUSTER} - ${START_STREAMS}..${MAX_STREAMS} Streams =====  [ $(date -u '+%Y-%m-%d %H:%M:%S.%3N') ]"
        time {
            COMMAND="performance.curve.sh --cluster ${CLUSTER} $@"
            echo
            echo "        COMMAND = ${COMMAND}"
            ${COMMAND} > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).performance.curve.${CLUSTER}.log 2>&1
        }

        echo
        echo "    ===== Test Complete - Plot results =====  [ $(date -u  +'%Y-%m-%d %H:%M:%S') ]"
        TITLE="${TESTID} - ${CLUSTER} - Performance Curves"
        CURVES_PLOT=${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).performance.curves
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

    [[ ${OPTION_GRAFANA} == TRUE ]] && stop_grafana > ${LOGDIRECTORY}/$(date +%y%m%d.%H%M%S%3N).grafana.snapshot.log 2>&1

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
