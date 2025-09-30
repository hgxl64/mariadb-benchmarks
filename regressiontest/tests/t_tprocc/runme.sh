#!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global

# -------------------
# configuration
# -------------------
export ENGINE=InnoDB
export SCALE=80
export DBNAME="tpcc"
export THREADS=$(thread_range $(($(n_cpu) / 2)) $(($(n_cpu) * 4)))
export RAMPUP=60     #seconds
export RUNTIME=900   #including ramp-up time
export REPORT=5

# -------------------
# test if HammerDB is installed
# -------------------

[[ ${HAMMERDB} ]] || exit 0
[[ -d ${HAMMERDB} ]] || exit 0
[[ -x ${HAMMERDB}/hammerdbcli ]] || exit 0

# -------------------
# sanity check configuration
# -------------------

#round ramp-up time to whole minutes
RAMPUP_MINUTES=$(( ${RAMPUP} / 60 ))
if [[ $(( ${RAMPUP_MINUTES} * 60 )) < ${RAMPUP} ]]
then
    RAMPUP_MINUTES=$(( ${RAMPUP_MINUTES} + 1 ))
    RAMPUP=$(( ${RAMPUP_MINUTES} * 60 ))
fi

#round runtime to whole minutes
RUNTIME_MINUTES=$(( ${RUNTIME} / 60 ))
if [[ $(( ${RUNTIME_MINUTES} * 60 )) < ${RUNTIME} ]]
then
    RUNTIME_MINUTES=$(( ${RUNTIME_MINUTES} + 1 ))
    RUNTIME=$(( ${RUNTIME_MINUTES} * 60 ))
fi


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
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS ${DBNAME}"
        $MYSQL -S $SOCKET -u root -e "CREATE DATABASE ${DBNAME}"

        local vu=$(($(n_cpu) * 2))
        [[ ${vu} -gt ${SCALE} ]] && vu=${SCALE}

        echo "\
dbset db maria
diset connection maria_host localhost
diset connection maria_socket ${SOCKET}
diset tpcc maria_dbase ${DBNAME}
diset tpcc maria_user root
diset tpcc maria_pass null
diset tpcc maria_storage_engine ${ENGINE}
diset tpcc maria_count_ware ${SCALE}
diset tpcc maria_num_vu ${vu}
diset tpcc maria_raiseerror true
print dict
buildschema
"       > ${LOGDIRECTORY}/hdb_load.tcl

        info $(date --utc "+%F %T   starting HammerDB schema build")
        ${HAMMERDB}/hammerdbcli auto ${LOGDIRECTORY}/hdb_load.tcl >${LOGDIRECTORY}/hdb_load.log
        info $(date --utc "+%F %T   HammerDB schema build finished")

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
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/summary.log
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/neword.log
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/payment.log
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/slev.log
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/delivery.log
    echo -e "thds \ttps \tmin \tavg \tmax \t95th \t99th \tmedian" > ${LOGDIRECTORY}/ostat.log

    info -n $(date --utc "+%F %T   running HammerDB (${THREADS} thds):")
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

       echo "\
dbset db maria
diset connection maria_host localhost
diset connection maria_socket ${SOCKET}
diset tpcc maria_dbase ${DBNAME}
diset tpcc maria_user root
diset tpcc maria_pass null
diset tpcc maria_storage_engine ${ENGINE}
diset tpcc maria_count_ware ${SCALE}
diset tpcc maria_rampup ${RAMPUP_MINUTES}
diset tpcc maria_duration $((${RUNTIME_MINUTES} - ${RAMPUP_MINUTES}))
diset tpcc maria_timeprofile true
diset tpcc maria_allwarehouse true
diset tpcc maria_prepared true
diset tpcc maria_raiseerror false
print dict
tcset logtotemp 1
tcset timestamps 1
tcset refreshrate ${REPORT}
print tcconf
loadscript
vuset vu ${thread}
vuset delay 10
vucreate
tcstart
vurun
after 10000
tcstop
after 10000
vudestroy
"      > ${LOGDIRECTORY}/hdb_run.$thread.tcl

       numactl ${CPU_MASK_SYSBENCH:-"--all"} ${HAMMERDB}/hammerdbcli auto \
         ${LOGDIRECTORY}/hdb_run.$thread.tcl 2>&1 > ${LOGDIRECTORY}/hdb_run.$thread.log

       wait $PIDLIST

       mv /tmp/hdbtcount.log    ${LOGDIRECTORY}/hdbtcount.$thread.log
       mv /tmp/hdbxtprofile.log ${LOGDIRECTORY}/hdbxtprofile.$thread.log

       summarize_hammerdb NEWORD   ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/neword.log
       summarize_hammerdb PAYMENT  ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/payment.log
       summarize_hammerdb DELIVERY ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/delivery.log
       summarize_hammerdb SLEV     ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/slev.log
       summarize_hammerdb OSTAT    ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/ostat.log
       summarize_hammerdb SUMMARY  ${LOGDIRECTORY}/hdbxtprofile.$thread.log >> ${LOGDIRECTORY}/summary.log

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
        $MYSQL -S $SOCKET -u root -e "DROP DATABASE IF EXISTS ${DBNAME}"
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

