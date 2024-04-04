#!/bin/bash

#
# Common Functions
#


# unconditional message
msg() {
    echo "$@"
}


# message ist only displayed when $VERBOSE >= 1
info() {
    [[ ${VERBOSE:-0} -gt 0 ]] && echo "$@"
}


# message ist only displayed when $VERBOSE >= 2
debug() {
    [[ ${VERBOSE:-0} -gt 1 ]] && echo "$@"
}


# message and exiting the script/block
error() {
    echo "$@"
    exit 1
}


# read properties from ~/.vault.yaml
vault() {
    local key=$1
    local value=$(fgrep "${key}:" ~/.vault.yaml | sed "s/.*: //")
    echo "${value}"
}


# config_variable name value
# create environment variable if it not exists and export it
# existing env variable will not be changed
config_variable() {
    local ref
    declare -n ref=$1
    if [[ ! ${ref} ]]
    then
        debug "exporting config variable: ${1}=${2}"
        export ref=$2
    else
        debug "using preset config variable: ${1}=${ref}"
    fi
}


# get a global server variable by name
get_server_variable() {
    echo $($MYSQL -S $SOCKET -u root -e "SHOW GLOBAL VARIABLES LIKE '$1'" | tail -1 | cut -f 2)
}


# set a global server variable
set_server_variable() {
   $MYSQL -S $SOCKET -u root -e "SET GLOBAL ${1}=${2}"
}


# set a global server variable, ignoring errors
set_server_variable_failsafe() {
   $MYSQL -S $SOCKET -u root -e "SET GLOBAL ${1}=${2}" 2> /dev/null || true
}


# get a global server status variable by name
get_server_status() {
    echo $($MYSQL -S $SOCKET -u root -e "SHOW GLOBAL STATUS LIKE '$1'" | tail -1 | cut -f 2)
}


# do an InnoDB checkpoint
checkpoint_innodb() {
    info "forcing an InnoDB checkpoint"

    local mdp=$(get_server_variable innodb_max_dirty_pages_pct)
    local lwm=$(get_server_variable innodb_max_dirty_pages_pct_lwm)
    local ioc=$(get_server_variable innodb_io_capacity)
    local prg=$(get_server_variable innodb_purge_threads)
    local dirty
    local hsize
    local dirty_old=0
    local repeat=10
    local t1=$(date +%s)

    set_server_variable_failsafe innodb_purge_threads  32
    set_server_variable innodb_io_capacity             40000
    set_server_variable innodb_max_dirty_pages_pct_lwm 0
    set_server_variable innodb_max_dirty_pages_pct     0

    info -n "(dirty pages);(history list length):"
    while true
    do
        dirty=$(get_server_status innodb_buffer_pool_pages_dirty)
        hsize=$(get_server_status innodb_history_list_length)
        info -n " ${dirty};${hsize}"

        if [[ $dirty -lt 100 ]] || [[ $repeat -le 0 ]]
        then
            break
        fi

        if [[ $dirty -eq $dirty_old ]]
        then
            info -n "($repeat)"
            repeat=$(($repeat - 1))
        else
            repeat=10
        fi

        dirty_old=$dirty
        sleep ${REPORT:-2}
    done
    info " stop"

    dirty=$(get_server_status innodb_buffer_pool_pages_dirty)
    info "stopped with $dirty dirty pages left"
    t2=$(date +%s)
    info "checkpoint time:  $(($t2-$t1)) sec"

    set_server_variable_failsafe innodb_purge_threads  $prg
    set_server_variable innodb_io_capacity             $ioc
    set_server_variable innodb_max_dirty_pages_pct     $mdp
    set_server_variable innodb_max_dirty_pages_pct_lwm $lwm
}


# summarize sysbench run in one line:
# threads tps min avg max 95th 25th median 75th
summarize_sysbench() {
   local RESULTFILE=$1
   local THD=$(fgrep "Number of threads:" $RESULTFILE | sed 's/Number of threads: //')
   local TPS=$(fgrep "transactions:" $RESULTFILE      | sed 's/\s*transactions:.*(\(.*\) per sec.)/\1/')
   local MIN=$(fgrep "min:" $RESULTFILE               | sed 's/\s*min:\s*//')
   local AVG=$(fgrep "avg:" $RESULTFILE               | sed 's/\s*avg:\s*//')
   local MAX=$(fgrep "max:" $RESULTFILE               | sed 's/\s*max:\s*//')
   local P95=$(fgrep "95th percentile:" $RESULTFILE   | sed 's/\s*95th percentile:\s*//')
   local P25=$(fgrep "25pct:" $RESULTFILE             | sed 's/\s*25pct:\s*//')
   local P50=$(fgrep "median:" $RESULTFILE            | sed 's/\s*median:\s*//')
   local P75=$(fgrep "75pct:" $RESULTFILE             | sed 's/\s*75pct:\s*//')

   echo -e "$THD \t$TPS \t$MIN \t$AVG \t$MAX \t$P95 \t$P25 \t$P50 \t$P75"
}


# start server installed in $TARGETDIR with a fresh database
# if ./my.cnf exists, use it as config file
start_server() {
    local subdir
    local my_inst_db
    [[ ! $TARGETDIR ]] && error "\$TARGETDIR not set!"

    #put ${TARGETDIR}/bin into $PATH
    OLDPATH=$PATH
    PATH=${TARGETDIR}/bin:$PATH

    #locate MYSQL_INSTALL_DB
    for subdir in bin scripts
    do
        if [ -x ${TARGETDIR}/${subdir}/${MYSQL_INSTALL_DB} ]
        then
            debug "using ${TARGETDIR}/$subdir/$MYSQL_INSTALL_DB"
            my_inst_db=${TARGETDIR}/$subdir/$MYSQL_INSTALL_DB
            break
        fi
    done
    [[ ! $my_inst_db ]] && error "no $MYSQL_INSTALL_DB in ${TARGETDIR}/{bin,scripts}"

    #create fresh database
    [[ -d ${DATADIR} ]] && rm -rf ${DATADIR}
    my_inst_db="$my_inst_db --basedir=${TARGETDIR}/${SERVER} --datadir=${DATADIR}"
    my_inst_db="$my_inst_db --auth-root-authentication-method=normal --verbose"
    [[ -e my.cnf ]] && my_inst_db="$my_inst_db --defaults-file=$PWD/my.cnf"
    debug "running ${my_inst_db}"
    $my_inst_db

    #start server
    CMD="numactl ${CPU_MASK_MYSQLD:-'--all'} ./bin/${MYSQLD_SAFE}"
    [[ -e my.cnf ]] && CMD="${CMD} --defaults-file=$PWD/my.cnf"
    [[ ${MALLOC_LIB} ]] && CMD="${CMD} --malloc-lib=${MALLOC_LIB}"
    CMD="$CMD --datadir=${DATADIR} --pid-file=/tmp/mysqld.pid.sysbench --socket=${SOCKET}"

    info "starting server with '${CMD}'"
    cd $TARGETDIR
    $CMD &
    export MYSQLD_SAFE_PID=$!

    #wait for server to come up
    sleep 2

    timeo=99
    echo -n "waiting for server to come up "
    while [ $timeo -gt 0 ]
    do
       $MYSQLADMIN -S ${SOCKET} -u root -b -s ping && break
       echo -n "."
       timeo=$(($timeo - 1))
       sleep 1
    done
    echo

    [[ $timeo -eq 0 ]] && error "server from $TARGETDIR not starting!"
}


# stop a running MariaDB/MySQL server
stop_server() {
    $MYSQLADMIN -S ${SOCKET} -u root shutdown
    wait $MYSQLD_SAFE_PID
    unset MYSQLD_SAFE_PID

    #restore PATH
    PATH=$OLDPATH

    #copy server errorlog to log dir
    ERRORLOG=${DATADIR}/$(hostname).err
    [[ -f $ERRORLOG ]] && cp $ERRORLOG $LOGDIRECTORY/error.log
}


# target dir (binary install dir) handling with temporary file
# this is ugly but it works :-/
set_targetdir() {
    echo $1 > /tmp/targetdir
}

get_targetdir() {
    if [[ -e /tmp/targetdir ]]
    then
        cat /tmp/targetdir
    else
        error "/tmp/targetdir : file does not exist"
    fi
}

remove_targetdir() {
    rm -f /tmp/targetdir
}


# pre- and post-collecting server stats
# extend as needed
collect_server_stats() {
    local prefix=$1

    du -s -BM ${DATADIR}/* > ${LOGDIRECTORY}/${prefix}_datadir_size.txt
    $MYSQL -S $SOCKET -u root -e "SHOW GLOBAL VARIABLES" > ${LOGDIRECTORY}/${prefix}_global_variables.txt
    $MYSQL -S $SOCKET -u root -e "SHOW GLOBAL STATUS" > ${LOGDIRECTORY}/${prefix}_global_status.txt
    [[ IS_MARIADB ]] && cat /proc/$(pidof mariadbd)/status > ${LOGDIRECTORY}/${prefix}_mariadbd_status.txt
    [[ IS_MYSQL ]]   && cat /proc/$(pidof mysqld)/status   > ${LOGDIRECTORY}/${prefix}_mysqld_status.txt
    for s in stat interrupts diskstats meminfo mdstat mounts
    do
        cat /proc/${s} > ${LOGDIRECTORY}/${prefix}_${s}.txt
    done
}


# return number of cpu cores, either from config variable or system
n_cpu() {
    if [[ -n ${NCPU} ]]
    then
        echo ${NCPU}
    else
        cat /proc/cpuinfo | grep -c "^processor"
    fi
}


# create sequence of exponentially (factor 2) growing numbers
# starting from $1 and not exceeding $2
thread_range() {
    local start=$1
    local end=$2
    local retval
    while [[ $start -le $end ]]
    do
        if [[ -z $retval ]]
        then
            retval=$start
        else
            retval="$retval $start"
        fi
        start=$(($start * 2))
    done
    echo $retval
}

