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


# message and exit the script/block
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
#    else
#        debug "using preset config variable: ${1}=${ref}"
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
    if [[ ${DUMP_PFS:-0} -eq 1 ]]
    then
        CMD="$CMD --performance-schema=true"
        CMD="$CMD --performance-schema-consumer-events_waits_current=on"
        CMD="$CMD --performance-schema-consumer-events_statements_current=off"
        CMD="$CMD --performance-schema-consumer-statements_digest=off"
        CMD="$CMD --performance-schema-instrument='%=off'"
        CMD="$CMD --performance-schema-instrument='wait/synch/mutex/%=on'"
        CMD="$CMD --performance-schema-instrument='wait/synch/rwlock/%=on'"
    fi

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
    if [[ -f $ERRORLOG ]]
    then
        cp $ERRORLOG $LOGDIRECTORY/error.log
        chmod a+r $LOGDIRECTORY/error.log
    fi
}


# kill a suspected hanging server
kill_server() {
    #try to normally shutdown server
    TIMEOUT=300
    SECONDS=0
    timeout $TIMEOUT $MYSQLADMIN -S ${SOCKET} -u root shutdown

    if [[ $SECONDS -lt $TIMEOUT ]]
    then
        wait $MYSQLD_SAFE_PID
        unset MYSQLD_SAFE_PID
    else
        msg "'$MYSQLADMIN shutdown' timed out after ${TIMEOUT}s"
        msg "killing ${MYSQLD_SAFE}, PID ${MYSQLD_SAFE_PID}"
        kill -KILL $MYSQLD_SAFE_PID
        sleep 1
        MYSQLD_PID=$(cat /tmp/mysqld.pid.sysbench)
        msg "killing ${MYSQLD}, PID ${MYSQLD_PID}"
        kill -KILL $MYSQLD_PID
        sleep 5
    fi

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


set_branches_tested() {
    if [[ -f /tmp/branches_tested ]]
    then
        local bt=$(cat /tmp/branches_tested)
        msg "/tmp/branches_tested reports ${bt} but should not exist!"
        rm -f /tmp/branches_tested
    fi
    echo "${1:-0}" > /tmp/branches_tested
}

get_branches_tested() {
    if [[ -f /tmp/branches_tested ]]
    then
        cat /tmp/branches_tested
    else
        echo 0
    fi
}

inc_branches_tested() {
    local bt=0
    if [[ -f /tmp/branches_tested ]]
    then
        bt=$(cat /tmp/branches_tested)
    fi
    bt=$((${bt} + 1))
    echo $bt > /tmp/branches_tested
}

reset_branches_tested() {
    rm -f /tmp/branches_tested
}


set_rm_logdir() {
    touch /tmp/rm_logdir
}

get_rm_logdir() {
    if [[ -f /tmp/rm_logdir ]]
    then
        echo "1"
    else
        echo "0"
    fi
}

reset_rm_logdir() {
    rm -f /tmp/rm_logdir
}


# pre- and post-collecting server stats
# extend as needed
collect_server_stats() {
    local prefix=$1

    du -s -BM ${DATADIR}/* > ${LOGDIRECTORY}/${prefix}_datadir_size.txt
    $MYSQL -S $SOCKET -u root -e "SHOW GLOBAL VARIABLES" > ${LOGDIRECTORY}/${prefix}_global_variables.txt
    $MYSQL -S $SOCKET -u root -e "SHOW GLOBAL STATUS" > ${LOGDIRECTORY}/${prefix}_global_status.txt
    [[ $IS_MARIADB ]] && cat /proc/$(pidof mariadbd)/status > ${LOGDIRECTORY}/${prefix}_mariadbd_status.txt
    [[ $IS_MYSQL ]]   && cat /proc/$(pidof mysqld)/status   > ${LOGDIRECTORY}/${prefix}_mysqld_status.txt
    for s in stat interrupts diskstats meminfo mdstat mounts
    do
        cat /proc/${s} > ${LOGDIRECTORY}/${prefix}_${s}.txt
    done
}


# collect host info and write them to LOGDIR
collect_host_info() {
    uname -a           > ${LOGDIRECTORY}/uname.txt
    numactl --hardware > ${LOGDIRECTORY}/numactl.txt
    lscpu              > ${LOGDIRECTORY}/lscpu.txt
    lsblk --tree --fs  > ${LOGDIRECTORY}/lsblk.txt
    env | sort         > ${LOGDIRECTORY}/env.txt
}


# log commit info to LOGDIR
commit_info() {

    git show -s --pretty="format:FULL_COMMIT: %H%n"  $1 >  ${LOGDIRECTORY}/commit_info.yaml
    git show -s --pretty="format:ABBRV_COMMIT: %h%n" $1 >> ${LOGDIRECTORY}/commit_info.yaml
    git show -s --pretty="format:TIMESTAMP: %ct%n"   $1 >> ${LOGDIRECTORY}/commit_info.yaml
    git show -s --pretty="format:RFC2822_TS: %cD%n"  $1 >> ${LOGDIRECTORY}/commit_info.yaml
}


# wrapped commit_info
commit_info_safe() {
    local commit=$1
    local here=$PWD

    #make sure git repo is cloned locally
    if [[ ! -d ${LOCAL_GIT_REPO} ]]
    then
        msg "cloning ${GIT_REPO} into ${LOCAL_GIT_REPO}"
        mkdir -p $(dirname ${LOCAL_GIT_REPO})
        cd $(dirname ${LOCAL_GIT_REPO})
        git clone ${GIT_REPO} $(basename ${LOCAL_GIT_REPO}) >> ${LOGDIRECTORY}/git.log 2>&1
    fi

    cd ${LOCAL_GIT_REPO}
    git fetch >> ${LOGDIRECTORY}/git.log 2>&1

    commit_info $commit

    cd $here
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


# postprocess a test subdir
test_postprocess()
{
    pushd $LOGDIRECTORY/$1 > /dev/null

    local desc=$(head -1 DESC)
    local html='!allplots.html'
    #determine the time step for this test
    local timestep=$(grep REPORT= runme.sh | cut -d = -f 2)
    #find thread numbers
    local thds=$(fgrep 'thds)' ${1}.log | sed s/.*\(// | sed 's/thds.*//')

    #and off we go!
    echo "<html><head>" > $html
    echo "<title>All Plots</title>" >> $html
    echo "</head><body>" >> $html

    #create summary plots
    echo "<h1>Summary</h1><h2>Performancecurve</h2>" >> $html
    echo "<p><img src=\"performancecurve.png\"><br><a href=\"summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set logscale y 2
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
      set ylabel 'avg latency [ms]'
      set xlabel 'tps'
      set output 'performancecurve.png'
      set title '${desc}'
      plot 'summary.log' using 2:4 notitle with linespoints pointtype 7, \
           '' using 2:4:1 with labels center offset 0.5, -0.5 notitle
    " | gnuplot

    echo "<h2>TPS</h2>" >> $html
    echo "<p><img src=\"tps_bars.png\"><br><a href=\"summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set yrange [0:]
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
      set ylabel 'tps'
      set xlabel 'threads'
      set style fill solid
      set boxwidth 0.3
      set output 'tps_bars.png'
      set title '${desc}'
      plot 'summary.log' using 0:2:xtic(1) with boxes notitle
    " | gnuplot

    echo "<h2>Latency</h2>" >> $html
    echo "<p><img src=\"latency_bars.png\"><br><a href=\"summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set logscale y 2
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
      set ylabel 'latency [ms]'
      set xlabel 'threads'
      set style fill empty
      set style line 1 lc rgb '#000'
      set boxwidth 0.3
      set offsets -0.5,0.5,0,0
      set output 'latency_bars.png'
      set title '${desc} - shows {min, 25%, median(dot), 75%, 95%}'
      plot 'summary.log' using 0:7:3:6:9:xtic(1) with candlesticks whiskerbars 0.5 linestyle 1 notitle, \
           '' using 0:8 with points linestyle 1 pointtype 7 notitle
    " | gnuplot

    echo "<h2>TPS + Latency combined</h2>" >> $html
    echo "<p><img src=\"tps+latency_bars.png\"><br><a href=\"summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set logscale y 2
      set y2range [0:]
      set ylabel 'latency [ms]'
      set ytics nomirror
      set y2label 'tps'
      set y2tics
      set xlabel 'threads'
      set style fill empty
      set style line 2 lc rgb '#000'
      set boxwidth 0.3
      set output 'tps+latency_bars.png'
      set title '${desc}'
      plot 'summary.log' using (\$0+0.2):2 with boxes fillstyle solid axes x1y2 notitle, \
           '' using (\$0-0.2):7:3:6:9:xtic(1) with candlesticks whiskerbars 0.5 linestyle 2 notitle, \
           '' using (\$0-0.2):8 with points linestyle 2 pointtype 7 notitle
    " | gnuplot


    #create time series plots
    echo "<h1>Timeseries</h1>" >> $html
    for thd in $thds
    do
        echo "<h2>${thd} Threads</h2>"  >> $html

        #sysbench
        if [[ -f sysbench.${thd}.log ]]
        then
            tmpfile=$(mktemp)
            perl -ne 'if (/^\[ \d+s \]/) {
                        @f = /^\[ (\d+)s \] .* tps: ([\d\.]+) qps: ([\d\.]+)/o;
                        print join("\t", @f), "\n";
                      }' <sysbench.${thd}.log >$tmpfile

            echo "
              set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2
              set xrange [0:]
              set yrange [0:]
              set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
              set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
              set ylabel 'tps'
              set xlabel 'time [s]'
              set output 'tps_over_time.${thd}.png'
              set title '${desc} @ ${thd} threads'
              plot '$tmpfile' using 1:2 notitle with lines
            " | gnuplot

            echo "<p><img src=\"tps_over_time.${thd}.png\" alt=\"${thd} threads\"><br><a href=\"sysbench.${thd}.log\">raw data</a></p>" >> $html
            rm $tmpfile
        fi

        #iostat (cpu + disk)
        if [[ -f iostat.${thd}.log ]]
        then
            tmpfile=$(mktemp)
            perl -e '$t=0;
                     while (<>) {
                       next unless /^avg-cpu/;
                       $l=<>;
                       @f=split " ", $l;
                       print $t, "\t", join("\t", @f), "\n";
                       $t+='${timestep}';
                     }' <iostat.${thd}.log >$tmpfile

            echo "
              set terminal png medium nocrop enhanced size 960,280 background '#FCFCFC' linewidth 2
              set xrange [0:]
              set yrange [0:100]
              set ylabel 'percent cpu'
              set xlabel 'time [s]'
              set style line 1
              set style line 2
              set style line 3
              set style line 5
              set output 'cpu_over_time.${thd}.png'
              set title 'CPU usage [usr,sys,idle,iowait] for ${thd} threads'
              plot \
                '$tmpfile' using 1:(\$2+\$4+\$5+\$7) with filledcurves above x1 ls 1 notitle,\
                '$tmpfile' using 1:(\$2+\$4+\$7)     with filledcurves above x1 ls 2 notitle,\
                '$tmpfile' using 1:(\$2+\$4)         with filledcurves above x1 ls 5 notitle,\
                '$tmpfile' using 1:(\$2)             with filledcurves above x1 ls 3 notitle
            " | gnuplot

            echo "<p><img src=\"cpu_over_time.${thd}.png\"><br><a href=\"iostat.${thd}.log\">raw data</a></p>" >> $html
            rm $tmpfile

            if [[ ${DATADISK} ]]
            then
                tmpfile=$(mktemp)
                rm $tmpfile
            fi
        fi

        #performance schema (mutexes & latches)
        if [[ -f pfs.${thd}.data ]]
        then
            echo "<!-- pfs.${thd}.log-->" >> $html
        fi

        #global status
        if [[ -f status.${thd}.data ]]
        then
            echo "<!-- status.${thd}.log-->" >> $html
        fi

        #flame graphs
        if [[ -f perf.${thd}.data ]]
        then
            echo "<!-- perf.${thd}.log-->" >> $html
        fi

    done


    echo "</body></html>" >> $html

    popd > /dev/null
}


