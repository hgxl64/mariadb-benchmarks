#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global

# -------------------
# configuration
# -------------------
export ENGINE=InnoDB
export SCALE=16
export TABLES=5
export LUA_ARGS_PREPARE="--use-fk=0 --insert-default=yes"
export LUA_ARGS_RUN="--use-fk=0 --histogram"
export THREADS=$(($(n_cpu) * 4))
export POSTPROCESS="performancecurve timeseries"
export RUNTIME=900
export REPORT=5


# -------------------
# command line processing
# -------------------

USAGE="usage: $0

run regression test $(basename $PWD)'
Options:
    --installed
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --installed)    INSTALLED=1;;
        -h|--help)      error "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# setup logdir
# -------------------

TEST_NAME=$(basename $PWD)
if [[ ! ${LOGDIRECTORY} ]]
then
    export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S%3N).${TEST_NAME}
else
    LOGDIRECTORY=${LOGDIRECTORY}/${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}


# -------------------
# main script
# -------------------

{
    if [[ ${INSTALLED} -ne 1 ]]
    then
        info $(date --utc "+%F %T   starting server from '${TARGETDIR}'")
        start_server > ${LOGDIRECTORY}/start.server.log 2>&1
    fi

    info $(date --utc "+%F %T   loading data set")
    {
        $MYSQL $MYSQL_CONNECTION -e "DROP DATABASE IF EXISTS sbtest"
        $MYSQL $MYSQL_CONNECTION -e "CREATE DATABASE sbtest"
        TIMEOUT=3600
        SECONDS=0
        timeout $TIMEOUT $SYSBENCH ${RT_HOME}/lua/tpcc.lua ${LUA_ARGS_PREPARE} \
          --scale=$SCALE --tables=$TABLES --threads=$(($(n_cpu)*2)) \
          --mysql-storage-engine=$ENGINE \
          $SYSBENCH_CONNECTION prepare
        if [[ $SECONDS -ge $TIMEOUT ]]
        then
            msg "loading data ran into timeout of ${TIMEOUT}s"
            if [[ ${INSTALLED} -ne 1 ]]
            then
                kill_server
                error "server killed"
            fi
        fi
        [[ ${ENGINE} == "InnoDB" ]] && checkpoint_innodb
    } 2>&1 > ${LOGDIRECTORY}/prepare.log

    collect_server_stats before

    #run benchmark
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t25th \tmedian \t75th" > ${LOGDIRECTORY}/summary.log

    info -n $(date --utc "+%F %T   running sysbench (${THREADS} thds):")
    for thread in $THREADS
    do
       info -n " ${thread} ..."
       $REMOTE_SHELL "iostat -mx $REPORT $(($RUNTIME/$REPORT+1))">> ${LOGDIRECTORY}/iostat.$thread.log &
       PIDLIST=$!
       if [[ -x ./dump_status.sh ]]
       then
           debug -n " (dump_status.sh)"
           numactl ${CPU_MASK_SYSBENCH:-"--all"} ./dump_status.sh >> ${LOGDIRECTORY}/status.$thread.log &
           PIDLIST="$PIDLIST $!"
       else
           debug -n " (no dump_status.sh)"
       fi
       if [[ -x ./dump_pfs.sh ]]
       then
           debug -n " (dump_pfs.sh)"
           numactl ${CPU_MASK_SYSBENCH:-"--all"} ./dump_pfs.sh >> ${LOGDIRECTORY}/pfs.$thread.log &
           PIDLIST="$PIDLIST $!"
       else
           debug -n " (no dump_pfs.sh)"
       fi

       TIMEOUT=$((2 * $RUNTIME))
       SECONDS=0
       timeout $TIMEOUT numactl ${CPU_MASK_SYSBENCH:-"--all"} ${SYSBENCH} ${RT_HOME}/lua/tpcc.lua \
         ${LUA_ARGS_RUN} --scale=$SCALE --tables=$TABLES --threads=$thread \
         --report-interval=$REPORT --time=$RUNTIME --forced-shutdown=60 --events=0 \
         $SYSBENCH_CONNECTION run 2>&1 > ${LOGDIRECTORY}/sysbench.$thread.log

       if [[ $SECONDS -ge $TIMEOUT ]]
       then
           msg "sysbench (@ ${thread} threads) ran into timeout of ${TIMEOUT}s"
           if [[ ${INSTALLED} -ne 1 ]]
           then
               kill_server
               error "server killed"
           fi
       fi

       wait $PIDLIST
       summarize_sysbench ${LOGDIRECTORY}/sysbench.$thread.log >> ${LOGDIRECTORY}/summary.log
       checkpoint_innodb > ${LOGDIRECTORY}/checkpoint.$thread.log
    done
    info " end"

    collect_server_stats after

    if [[ ${INSTALLED} -ne 1 ]]
    then
        info $(date --utc "+%F %T   stopping server")
        stop_server > ${LOGDIRECTORY}/stop.server.log 2>&1
    else
        info $(date --utc "+%F %T   cleaning up")
        $MYSQL $MYSQL_CONNECTION -e "DROP DATABASE IF EXISTS sbtest"
    fi

} 2>&1 | tee ${LOGDIRECTORY}/${TEST_NAME}.log

echo ${POSTPROCESS} > ${LOGDIRECTORY}/POSTPROCESS

for f in DESC my.cnf runme.sh
do
    [[ -e $f ]] && cp $f ${LOGDIRECTORY}/
done

