#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global

# -------------------
# configuration
# -------------------
ENGINE=InnoDB
SCALE=32
TABLES=10
LUA_ARGS_PREPARE="--use-fk=0 --insert-default=yes --mysql-db=sbt"
LUA_ARGS_RUN="--use-fk=0 --mysql-db=sbt --histogram"
THREADS=$(thread_range $(($(n_cpu) / 2)) $(($(n_cpu) * 4)))
RUNTIME=900
REPORT=5
POSTPROCESS="performancecurve timeseries"


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
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS sbt"
        $MYSQL -S $SOCKET -u root -e "CREATE DATABASE sbt"
        $SYSBENCH ${RT_HOME}/lua/tpcc.lua ${LUA_ARGS_PREPARE} \
          --scale=$SCALE --tables=$TABLES --threads=$(($(n_cpu)*2)) \
          --mysql-storage-engine=$ENGINE \
          --mysql-socket=$SOCKET --mysql-user=root prepare
        [[ ${ENGINE} == "InnoDB" ]] && checkpoint_innodb
    } 2>&1 > ${LOGDIRECTORY}/prepare.log

    collect_server_stats before

    #run benchmark
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t25th \tmedian \t75th" > ${LOGDIRECTORY}/summary.log

    info -n $(date --utc "+%F %T   running sysbench (${THREADS} thds):")
    for thread in $THREADS
    do
       info -n " ${thread} ..."
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

       numactl ${CPU_MASK_SYSBENCH:-"--all"} ${SYSBENCH} ${RT_HOME}/lua/tpcc.lua ${LUA_ARGS_RUN} \
         --scale=$SCALE --tables=$TABLES --threads=$thread \
         --report-interval=$REPORT --time=$RUNTIME --forced-shutdown=60 --events=0 \
         --mysql-socket=$SOCKET --mysql-user=root run 2>&1 > ${LOGDIRECTORY}/sysbench.$thread.log

       wait $PIDLIST
       summarize_sysbench ${LOGDIRECTORY}/sysbench.$thread.log >> ${LOGDIRECTORY}/summary.log
       checkpoint_innodb > ${LOGDIRECTORY}/checkpoint.$thread.log
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

