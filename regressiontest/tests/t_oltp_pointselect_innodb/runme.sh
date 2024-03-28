#!/bin/bash


# -------------------
# configuration
# -------------------
ENGINE=InnoDB
TABLES=16
ROWS=1000000
LUA_PREPARE=rt_read_write.lua
LUA_ARGS_PREPARE=""
LUA_RUN=rt_point_select.lua
LUA_ARGS_RUN=""
#THREADS="1 2 4 8 16 32 64 128"
THREADS="1 8 16"
RUNTIME=100
REPORT=2


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

source rt_functions.sh
source ${RT_HOME}/config/global


time {
    msg "starting server from ${TARGETDIR}"
    start_server > ${LOGDIRECTORY}/start.server.log 2>&1

    echo "loading data set"
    time {
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS sbtest"
        $MYSQL -S $SOCKET -u root -e "CREATE DATABASE sbtest"
        $SYSBENCH ${RT_HOME}/lua/${LUA_PREPARE} ${LUA_ARGS_PREPARE} \
          --tables=$TABLES --table-size=$ROWS --threads=$TABLES \
          --mysql-storage-engine=$ENGINE --bulk-load=true \
          --mysql-socket=$SOCKET --mysql-user=root prepare
    } 2>&1 | tee ${LOGDIRECTORY}/prepare.log

    msg "forcing an innodb checkpoint"
    time {
        checkpoint_innodb
    } 2>&1 | tee ${LOGDIRECTORY}/checkpoint.log

    #collect extra info
    du -s -BM ${DATADIR}/* > ${LOGDIRECTORY}/data.size.log 2>&1
    $MYSQL -S $SOCKET -u root -t -e "SHOW GLOBAL VARIABLES" > ${LOGDIRECTORY}/global.variables.log 2>&1

    #run benchmark
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t25th \tmedian \t75th" > ${LOGDIRECTORY}/summary.log

    for thread in $THREADS
    do
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
         --tables=$TABLES --table-size=$ROWS --threads=$thread --report-interval=$REPORT \
         --time=$RUNTIME --forced-shutdown=60 --events=0 \
         --mysql-socket=$SOCKET --mysql-user=root run | tee -a ${LOGDIRECTORY}/sysbench.$thread.log

       wait $PIDLIST
       summarize_sysbench ${LOGDIRECTORY}/sysbench.$thread.log >> ${LOGDIRECTORY}/summary.log

       #echo "forcing an innodb checkpoint"
       #checkpoint_innodb

    done

    #
    stop_server > ${LOGDIRECTORY}/stop.server.log 2>&1

} 2>&1 | tee ${LOGDIRECTORY}/${TEST_NAME}.log

