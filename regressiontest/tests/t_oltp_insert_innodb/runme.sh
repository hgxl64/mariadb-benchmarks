#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global

# -------------------
# configuration
# -------------------
ENGINE=InnoDB
TABLES=16
ROWS=0
LUA_PREPARE=rt_read_write.lua
LUA_ARGS_PREPARE=""
LUA_RUN=rt_insert.lua
LUA_ARGS_RUN="--rand-type=uniform --histogram --skip-trx=true"
THREADS=$(thread_range 1 $(($(n_cpu) * 16)))
RUNTIME=100
REPORT=2
POSTPROCESS="performancecurve"


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
    info $(date --utc "+%F %T   starting server from '${TARGETDIR}'")
    start_server > ${LOGDIRECTORY}/start.server.log 2>&1

    info $(date --utc "+%F %T   loading data set")
    {
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS sbtest"
        $MYSQL -S $SOCKET -u root -e "CREATE DATABASE sbtest"
    } 2>&1 > ${LOGDIRECTORY}/prepare.log

    collect_server_stats before

    #run benchmark
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t25th \tmedian \t75th" > ${LOGDIRECTORY}/summary.log

    info -n $(date --utc "+%F %T   running sysbench (${THREADS} thds):")
    for thread in $THREADS
    do
       info -n " ${thread} ..."

       $SYSBENCH ${RT_HOME}/lua/${LUA_PREPARE} ${LUA_ARGS_PREPARE} \
         --tables=$TABLES --table-size=$ROWS --mysql-storage-engine=$ENGINE \
         --mysql-socket=$SOCKET --mysql-user=root prepare 2>&1 > ${LOGDIRECTORY}/prepare.$thread.log

       numactl ${CPU_MASK_SYSBENCH:-"--all"} iostat -mx $REPORT $(($RUNTIME/$REPORT+1))  >> ${LOGDIRECTORY}/iostat.$thread.log &
       PIDLIST=$!
       if [[ -x ./dump_status.sh ]]
       then
           numactl ${CPU_MASK_SYSBENCH:-"--all"} ./dump_status.sh $RUNTIME >> ${LOGDIRECTORY}/status.$thread.log &
           PIDLIST="$PIDLIST $!"
       fi
       if [[ -x ./dump_pfs.sh ]]
       then
           numactl ${CPU_MASK_SYSBENCH:-"--all"} ./dump_pfs.sh $(($RUNTIME+$EXTRATIME)) >> ${LOGDIRECTORY}/pfs.$thread.log &
           PIDLIST="$PIDLIST $!"
       fi

       numactl ${CPU_MASK_SYSBENCH:-"--all"} ${SYSBENCH} ${RT_HOME}/lua/${LUA_RUN} ${LUA_ARGS_RUN} \
         --tables=$TABLES --table-size=$ROWS --threads=$thread \
         --report-interval=$REPORT --time=$RUNTIME --forced-shutdown=60 --events=0 \
         --mysql-socket=$SOCKET --mysql-user=root run 2>&1 > ${LOGDIRECTORY}/sysbench.$thread.log

       wait $PIDLIST
       summarize_sysbench ${LOGDIRECTORY}/sysbench.$thread.log >> ${LOGDIRECTORY}/summary.log

       $SYSBENCH ${RT_HOME}/lua/${LUA_PREPARE} ${LUA_ARGS_PREPARE} --tables=$TABLES \
         --mysql-socket=$SOCKET --mysql-user=root cleanup 2>&1 > ${LOGDIRECTORY}/cleanup.$thread.log

    done
    info " sysbench finished"

    collect_server_stats after

    info $(date --utc "+%F %T   stopping server")
    stop_server > ${LOGDIRECTORY}/stop.server.log 2>&1

} 2>&1 | tee ${LOGDIRECTORY}/${TEST_NAME}.log

echo ${POSTPROCESS} > ${LOGDIRECTORY}/POSTPROCESS

for f in DESC my.cnf runme.sh
do
    [[ -e $f ]] && cp $f ${LOGDIRECTORY}/
done

