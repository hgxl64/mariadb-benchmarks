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
export THREADS=$(thread_range $(($(n_cpu) / 2)) $(($(n_cpu) * 4)))
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
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS sbtest"
        $MYSQL -S $SOCKET -u root -e "CREATE DATABASE sbtest"
        $SYSBENCH ${RT_HOME}/lua/tpcc.lua ${LUA_ARGS_PREPARE} \
          --scale=$SCALE --tables=$TABLES --threads=$(($(n_cpu)*2)) \
          --mysql-storage-engine=$ENGINE \
          --mysql-socket=$SOCKET --mysql-user=root prepare
        [[ ${ENGINE} == "InnoDB" ]] && checkpoint_innodb
    } 2>&1 > ${LOGDIRECTORY}/prepare.log

    if [[ ${DUMP_STATUS:-0} -eq 1 ]]
    then
        debug -n "[status dumps active] "
    fi
    if [[ ${DUMP_PFS:-0} -eq 1 ]]
    then
        info -n "[PFS dumps active] "
    fi
    if [[ ${DUMP_PERF:-0} -eq 1 ]]
    then
        info "[perf dumps active]"
    fi

    collect_server_stats before

    #run benchmark
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t25th \tmedian \t75th" > ${LOGDIRECTORY}/summary.log

    info -n $(date --utc "+%F %T   running sysbench (${THREADS} thds):")
    for thread in $THREADS
    do
       info -n " ${thread} ..."
       numactl ${CPU_MASK_SYSBENCH:-"--all"} iostat -mx $REPORT $(($RUNTIME/$REPORT+1)) >> ${LOGDIRECTORY}/iostat.$thread.log &
       PIDLIST=$!
       if [[ ${DUMP_STATUS:-0} -eq 1 ]]
       then
           numactl ${CPU_MASK_SYSBENCH:-"--all"} dump_status.sh >> ${LOGDIRECTORY}/status.$thread.log &
           PIDLIST="$PIDLIST $!"
       fi
       if [[ ${DUMP_PFS:-0} -eq 1 ]]
       then
           numactl ${CPU_MASK_SYSBENCH:-"--all"} dump_pfs.sh >> ${LOGDIRECTORY}/pfs.$thread.log &
           PIDLIST="$PIDLIST $!"
       fi
       if [[ ${DUMP_PERF:-0} -eq 1 ]]
       then
           numactl ${CPU_MASK_SYSBENCH:-"--all"} dump_perf.sh ${LOGDIRECTORY}/perf.$thread.data >> ${LOGDIRECTORY}/perf.$thread.log 2>&1 &
           PIDLIST="$PIDLIST $!"
       fi

       numactl ${CPU_MASK_SYSBENCH:-"--all"} ${SYSBENCH} ${RT_HOME}/lua/tpcc.lua ${LUA_ARGS_RUN} \
         --scale=$SCALE --tables=$TABLES --threads=$thread \
         --report-interval=$REPORT --time=$RUNTIME --forced-shutdown=60 --events=0 \
         --mysql-socket=$SOCKET --mysql-user=root run 2>&1 > ${LOGDIRECTORY}/sysbench.$thread.log

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
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS sbtest"
    fi

} 2>&1 | tee ${LOGDIRECTORY}/${TEST_NAME}.log


# -------------------
# house keeping
# -------------------

echo "TIMESTEP=$REPORT" >  ${LOGDIRECTORY}/POSTPROCESS
echo "RUNTIME=$RUNTIME" >> ${LOGDIRECTORY}/POSTPROCESS
echo "ENGINE=$ENGINE"   >> ${LOGDIRECTORY}/POSTPROCESS
echo "THREADS=$THREADS" >> ${LOGDIRECTORY}/POSTPROCESS
echo "WRITES=yes"       >> ${LOGDIRECTORY}/POSTPROCESS

for f in DESC my.cnf runme.sh
do
    [[ -e $f ]] && cp $f ${LOGDIRECTORY}/
done

