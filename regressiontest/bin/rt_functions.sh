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

    if [[ ${RUN_FSTRIM} ]]
    then
        sudo fstrim -a
    fi

    my_inst_db="$my_inst_db --basedir=${TARGETDIR}/${SERVER} --datadir=${DATADIR} --verbose"
    [[ ${IS_MARIADB:-0} -eq 1 ]] && my_inst_db="$my_inst_db --auth-root-authentication-method=normal"
    [[ -e my.cnf ]] && my_inst_db="$my_inst_db --defaults-file=$PWD/my.cnf"
    debug "running ${my_inst_db}"
    $my_inst_db

    #start server
    CMD="numactl ${CPU_MASK_MYSQLD:-'--all'} ./bin/${MYSQLD_SAFE}"
    #optional my.cnf
    [[ -e my.cnf ]] && CMD="${CMD} --defaults-file=$PWD/my.cnf"
    #optional MALLOC_LIB
    [[ ${MALLOC_LIB} ]] && CMD="${CMD} --malloc-lib=${MALLOC_LIB}"
    CMD="$CMD --datadir=${DATADIR} --pid-file=/tmp/mysqld.pid.sysbench --socket=${SOCKET}"
    #optional extra options when using PERFORMANCE SCHEMA
    if [[ ${DUMP_PFS:-0} -eq 1 ]]
    then
        CMD="$CMD --performance-schema=true"
        CMD="$CMD --performance-schema-consumer-events_waits_current=on"
        CMD="$CMD --performance-schema-consumer-events_statements_current=off"
        CMD="$CMD --performance-schema-consumer-statements_digest=off"
        CMD="$CMD --performance-schema-instrument=%=off"
        CMD="$CMD --performance-schema-instrument=wait/synch/mutex/%=on"
        CMD="$CMD --performance-schema-instrument=wait/synch/rwlock/%=on"
    fi
    #optional extra commandline parameters from environment
    if [[ ${EXTRAMYCNF} ]]
    then
        CMD="$CMD ${EXTRAMYCNF}"
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

    #run SQL to create time zone tables
    if [[ ${IS_MARIADB:-0} -eq 1 ]]
    then
        info "loading time zone tables ..."
        echo "use mysql;"                           > /tmp/tzdata.sql
        mariadb-tzinfo-to-sql /usr/share/zoneinfo/ >> /tmp/tzdata.sql
        echo "SET GLOBAL time_zone='UTC';"         >> /tmp/tzdata.sql
        $MYSQL -S ${SOCKET} -u root < /tmp/tzdata.sql
        rm /tmp/tzdata.sql
    fi

    #optional extra SQL to run
    if [[ ${EXTRASQL} ]]
    then
        echo "running SQL from ${EXTRASQL}"
        $MYSQL -S ${SOCKET} -u root -v -v < ${EXTRASQL}
    fi

    #optional async SQL to run
    if [[ ${ASYNCSQL} ]]
    then
        echo "running asynchronous SQL: '${ASYNCSQL}'"
        $MYSQL -S ${SOCKET} -u root -v -v -e "${ASYNCSQL}" &
        export ASYNCPID=$!
        echo "async pid is ${ASYNCPID}"
    fi
}


# stop a running MariaDB/MySQL server
stop_server() {
    if [[ ${ASYNCPID} ]]
    then
        kill -TERM ${ASYNCPID}
       wait ${ASYNCPID}
    fi

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

    #copy the slow query log to log dir
    SLOWLOG=${DATADIR}/slow.log
    if [[ -f $SLOWLOG ]]
    then
        cp $SLOWLOG $LOGDIRECTORY/slow.log
        chmod a+r $LOGDIRECTORY/slow.log
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
    cat /proc/$(pidof ${MYSQLD})/status > ${LOGDIRECTORY}/${prefix}_${MYSQLD}_status.txt
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


#calculate moving average over column 2
#of file $1 and write result to file $2
average_col2()
{
    perl -e '
      my @data_x = ();
      my @data_y = ();

      while (<>) {
          chomp;
          my ($x, $y, undef) = split "\t";
          push @data_x, $x;
          push @data_y, $y;
      }

      my @avg_y = do {
        my $sum = 0;
        my @summers = ();
        map {
          $sum += $_;
          push @summers, $_;
          $sum -= shift @summers if @summers > '${SMOOTHING:-3}';
          $sum / @summers;
        } @data_y;
      };

      for my $x (@data_x) {
          print $x, "\t", shift @avg_y, "\n";
      }
    ' <$1 >$2
}


#calculate moving average over columns 2 and 3
#of file $1 and write result to file $2
average_col23()
{
    perl -e '
      my @data_x = ();
      my @data_y = ();
      my @data_z = ();

      while (<>) {
          chomp;
          my ($x, $y, $z, undef) = split "\t";
          push @data_x, $x;
          push @data_y, $y;
          push @data_z, $z;
      }

      my @avg_y = do {
        my $sum = 0;
        my @summers = ();
        map {
          $sum += $_;
          push @summers, $_;
          $sum -= shift @summers if @summers > '${SMOOTHING:-3}';
          $sum / @summers;
        } @data_y;
      };

      my @avg_z = do {
        my $sum = 0;
        my @summers = ();
        map {
          $sum += $_;
          push @summers, $_;
          $sum -= shift @summers if @summers > '${SMOOTHING:-3}';
          $sum / @summers;
        } @data_z;
      };

      for my $x (@data_x) {
          print $x, "\t", shift @avg_y, "\t", shift @avg_z, "\n";
      }
    ' <$1 >$2
}


#extract change rate of variable $3 from status dump $1
#and write timestamp and rate to file $2
extract_status_rate()
{
    perl -e '
      my $start = undef;
      my $laststamp = undef;
      my $lastval = undef;
      <>;
      do {
          my %d = ();
          while (<>) {
              chomp;
              my ($k, $v) = split "\t";
              last if ($k eq "Variable_name");
              $d{$k} = $v;
          }
          if (not defined $start) {
              $start = $d{"Uptime"};
          }
          my $rate = 0;
          if (not defined $lastval) {
              $lastval = $d{'$3'};
              $laststamp = $d{"Uptime"};
          } else {
              $rate = ($d{'$3'}-$lastval) / ($d{"Uptime"}-$laststamp);
          }

          printf "%d\t%.1f\n", $d{"Uptime"}-$start, $rate;
          $lastval = $d{'$3'};
          $laststamp = $d{"Uptime"};
      } while (not eof);
    ' <$1 >$2
}


#extract value of variable $3 from status dump $1
#and write timestamp and rate to file $2
extract_status_gauge()
{
    perl -e '
      my $start = undef;
      <>;
      do {
          my %d = ();
          while (<>) {
              chomp;
              my ($k, $v) = split "\t";
              last if ($k eq "Variable_name");
              $d{$k} = $v;
          }
          if (not defined $start) {
              $start = $d{"Uptime"};
          }
          printf "%d\t%s\n", $d{"Uptime"}-$start, $d{'$3'};
      } while (not eof);
    ' <$1 >$2
}


#extract mutex ranks from PFS dump $1 and write to $2
extract_mutex_ranks()
{
    perl -e '
      my %d=();
      while (<>) {
          next if (/^\| event/o);
          if (my ($mutex, $events, $waits) = /^\| (.*?)[\| ]+(\d+)[\| ]+(\d+)/) {
              my $n = $waits;
              $d{$mutex} = (exists $d{$mutex} ? $d{$mutex} : 0) + $n;
          }
      }
      foreach my $mutex (sort { $d{$b} <=> $d{$a} } keys %d) {
          printf "%s\t%d\n", $mutex, $d{$mutex};
      }
    ' <$1 >$2
}


#extract mutex $3 events and waits from PFS dump $1 and write to $2
extract_mutex()
{
    perl -e '
      my $stamp= 0;
      my $step= 1;
      while (<>) {
          if (/sleep\((\d+)\)/) {
              $step= $1+0;
              last;
          }
      }
      while (<>) {
          if (/^Bye/) {
              $stamp += $step;
          }
          if (/^\|/) {
              my $line = $_;
              $line =~ s/^\| //s;
              if ($line =~ /'$3'[\| ]+(\d+)[\| ]+(\d+)/) {
                  print $stamp, "\t", $1, "\t", $2, "\n";
              }
          }
      }
    ' <$1 >$2
}


# create plots in test subdir
create_plots_for_test()
{
    pushd $LOGDIRECTORY/$1 > /dev/null

    #get short description of test
    local desc=$(head -1 DESC)

    #postprocessing variables for this test
    local timestep=$(fgrep 'TIMESTEP=' POSTPROCESS | cut -d = -f 2)
    local runtime=$(fgrep 'RUNTIME=' POSTPROCESS | cut -d = -f 2)
    local engine=$(fgrep 'ENGINE=' POSTPROCESS | cut -d = -f 2)
    local thds=$(fgrep 'THREADS=' POSTPROCESS | cut -d = -f 2)
    local writes=$(fgrep 'WRITES=' POSTPROCESS | cut -d = -f 2)
    local binlog=$(fgrep 'BINLOG=' POSTPROCESS | cut -d = -f 2)

    [[ -d plots ]] && rm -rf plots
    mkdir plots

    local html='plots/index.html'

    #and off we go!
    echo "<html><head>" > $html
    echo "<title>All Plots</title>" >> $html
    echo "</head><body>" >> $html

    #create summary plots
    echo "<h1>Summary for test $1</h1>" >> $html
    echo "<pre>" >> $html
    cat DESC >> $html
    echo "</pre><hline><pre>" >> $html
    cat ../desc.yaml >> $html
    if [[ -f ../build.properties ]]
    then
        echo "</pre><hline><pre>" >> $html
        cat ../build.properties >> $html
    fi
    echo "</pre><hline><pre>" >> $html
    fgrep -v "TIMESTAMP" ../commit_info.yaml >> $html
    echo "</pre><hline><pre>" >> $html
    cat ../uname.txt >> $html
    echo "</pre>" >> $html

    echo "<h2>Performancecurve</h2>" >> $html
    echo "<p><img src=\"performancecurve.png\"><br><a href=\"../summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set logscale y 2
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
      set ylabel 'avg latency [ms]'
      set xlabel 'tps'
      set output 'plots/performancecurve.png'
      set title '${desc}'
      plot 'summary.log' using 2:4 notitle with linespoints lc 'blue' pointtype 7, \
           '' using 2:4:1 with labels center offset 1.5, -0.5 notitle
    " | gnuplot

    echo "<h2>TPS</h2>" >> $html
    echo "<p><img src=\"tps_bars.png\"><br><a href=\"../summary.log\">raw data</a></p>" >> $html
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
      set output 'plots/tps_bars.png'
      set title '${desc}'
      plot 'summary.log' using 0:2:xtic(1) with boxes fc 'blue' notitle
    " | gnuplot

    echo "<h2>Latency</h2>" >> $html
    echo "<p><img src=\"latency_bars.png\"><br><a href=\"../summary.log\">raw data</a></p>" >> $html
    echo "
      set terminal png medium nocrop enhanced size 960,480 background '#FCFCFC' linewidth 2 font 'Arial,12'
      set xrange [0:]
      set logscale y 2
      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
      set ylabel 'latency [ms]'
      set xlabel 'threads'
      set style fill empty
      set boxwidth 0.3
      set offsets -0.5,0.5,0,0
      set output 'plots/latency_bars.png'
      set title '${desc} - shows {min, 25%, median(dot), 75%, 95%}'
      plot 'summary.log' using 0:7:3:6:9:xtic(1) with candlesticks whiskerbars 0.5 lc 'black' notitle, \
           '' using 0:8 with points lc 'black' pointtype 7 notitle
    " | gnuplot

    echo "<h2>TPS + Latency combined</h2>" >> $html
    echo "<p><img src=\"tps+latency_bars.png\"><br><a href=\"../summary.log\">raw data</a></p>" >> $html
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
      set boxwidth 0.3
      set output 'plots/tps+latency_bars.png'
      set title '${desc}'
      plot 'summary.log' using (\$0+0.2):2 with boxes fillstyle solid lc 'blue' axes x1y2 notitle, \
           '' using (\$0-0.2):7:3:6:9:xtic(1) with candlesticks whiskerbars 0.5 lc 'black' notitle, \
           '' using (\$0-0.2):8 with points lc 'black' pointtype 7 notitle
    " | gnuplot


    #create time series plots
    echo "<h1>Timeseries</h1>" >> $html
    for thd in $thds
    do
        echo "<h2>${thd} Threads</h2>"  >> $html
        #
        # sysbench
        #
        if [[ -f sysbench.${thd}.log ]]
        then
            local tmpfile=$(mktemp)
            perl -ne 'if (/^\[ \d+s \]/) {
                        @f = /^\[ (\d+)s \] .* tps: ([\d\.]+) qps: ([\d\.]+)/o;
                        print join("\t", @f), "\n";
                      }' <sysbench.${thd}.log >$tmpfile

            echo "
              set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
              set xrange [0:$runtime]
              set yrange [0:]
              set lmargin 10
              set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
              set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
              set ylabel 'tps'
              set xlabel 'time [s]'
              set output 'plots/tps_over_time.${thd}.png'
              set title '${desc} at ${thd} threads'
              plot '$tmpfile' using 1:2 notitle with lines lc 'blue'
            " | gnuplot

            echo "<p><img src=\"tps_over_time.${thd}.png\" alt=\"${thd} threads\"><br><a href=\"../sysbench.${thd}.log\">raw data</a></p>" >> $html
            rm $tmpfile
        fi

        #
        # iostat (cpu + disk)
        #
        if [[ -f iostat.${thd}.log ]]
        then
            echo "<h3>System monitoring (iostat)</h3>" >> $html
            local tmpfile=$(mktemp)
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
              set xrange [0:$runtime]
              set yrange [0:100]
              set lmargin 10
              set ylabel 'percent cpu'
              set style fill solid
              set key bottom center outside horizontal
              set output 'plots/cpu_over_time.${thd}.png'
              set title 'CPU usage for ${desc} at ${thd} threads'
              plot \
                '$tmpfile' using 1:(\$2+\$4+\$5+\$7) with filledcurves above x1 fc 'red' title 'iowait',\
                '$tmpfile' using 1:(\$2+\$4+\$7)     with filledcurves above x1 fc 'green' title 'idle',\
                '$tmpfile' using 1:(\$2+\$4)         with filledcurves above x1 fc 'orange' title 'system',\
                '$tmpfile' using 1:(\$2)             with filledcurves above x1 fc 'blue' title 'user'
            " | gnuplot

            echo "<p><img src=\"cpu_over_time.${thd}.png\"></p>" >> $html
            rm $tmpfile

            if [[ ${DATADISK} ]]
            then
                for disk in ${DATADISK}
                do
                    local tmpfile=$(mktemp)
                    perl -e '$t=0;
                             while (<>) {
                               next unless /^'${disk}'/;
                               @f=split " ";
                               print $t, "\t", join("\t", @f), "\n";
                               $t+='${timestep}';
                            }' <iostat.${thd}.log >$tmpfile

                    echo "
                      set terminal png medium nocrop enhanced size 960,280 background '#FCFCFC' linewidth 2
                      set xrange [0:$runtime]
                      set yrange [0:]
                      set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                      set style fill solid
                      set key bottom center outside horizontal
                      set title 'disk ${disk} usage for ${desc} at ${thd} threads'
                      set ylabel 'iops'
                      set output 'plots/disk_${disk}_ops_over_time.${thd}.png'
                      plot \
                        '$tmpfile' using 1:3 with filledcurves above x1 fc 'green' title 'read',\
                        '$tmpfile' using 1:9 with lines lc 'blue' title 'write'
                      set ylabel 'MB per second'
                      set output 'plots/disk_${disk}_mb_over_time.${thd}.png'
                      plot \
                        '$tmpfile' using 1:4 with filledcurves above x1 fc 'green' title 'read',\
                        '$tmpfile' using 1:10 with lines lc 'blue' title 'write'
                    " | gnuplot

                    echo "<p><img src=\"disk_${disk}_ops_over_time.${thd}.png\"></p>" >> $html
                    echo "<p><img src=\"disk_${disk}_mb_over_time.${thd}.png\"></p>" >> $html

                    rm $tmpfile
                done
            fi
            echo "<p><a href=\"../iostat.${thd}.log\">raw data</a></p>" >> $html

        fi

        #
        # global status
        #
        if [[ -f status.${thd}.log ]]
        then

            echo "<h3>Server Global Status Variables</h3>" >> $html
            #
            # Bytes received/sent
            #
            local tmpfile1=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile1 "Bytes_received"
            average_col2 $tmpfile1 $tmpfile1.avg
            local tmpfile2=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile2 "Bytes_sent"
            average_col2 $tmpfile2 $tmpfile2.avg

            echo "
              set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
              set xrange [0:$runtime]
              set yrange [0:]
              set lmargin 10
                  set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                  set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
              set ylabel 'MB/s'
              set key bottom center outside horizontal
              set output 'plots/bytes_rcvd_sent_over_time.${thd}.png'
              set title 'Server network/socket usage (SQL traffic) for ${desc} at ${thd} threads'
              plot '$tmpfile1' using 1:(\$2/1024/1024) with dots lc 'green' notitle,\
               '$tmpfile1.avg' using 1:(\$2/1024/1024) with lines lc 'green' title 'received',\
               '$tmpfile2'     using 1:(\$2/1024/1024) with dots lc 'blue' notitle,\
               '$tmpfile2.avg' using 1:(\$2/1024/1024) with lines lc 'blue' title 'sent'
              " | gnuplot
            echo "<p><img src=\"bytes_rcvd_sent_over_time.${thd}.png\"></p>" >> $html

            rm ${tmpfile1} ${tmpfile1}.avg
            rm ${tmpfile2} ${tmpfile2}.avg

            #
            # Statement types
            #
            local tmpfile1=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile1 "Com_select"
            average_col2 $tmpfile1 $tmpfile1.avg
            local tmpfile2=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile2 "Com_insert"
            average_col2 $tmpfile2 $tmpfile2.avg
            local tmpfile3=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile3 "Com_update"
            average_col2 $tmpfile3 $tmpfile3.avg
            local tmpfile4=$(mktemp)
            extract_status_rate status.${thd}.log $tmpfile4 "Com_delete"
            average_col2 $tmpfile4 $tmpfile4.avg

            echo "
              set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
              set xrange [0:$runtime]
              set yrange [0:]
              set lmargin 10
                  set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                  set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
              set ylabel 'stmt/s'
              set key bottom center outside horizontal
              set output 'plots/stmts_over_time.${thd}.png'
              set title 'SQL statements for ${desc} at ${thd} threads'
              plot '$tmpfile1' using 1:2 with dots lc 'green' notitle,\
               '$tmpfile1.avg' using 1:2 with lines lc 'green' title 'SELECT',\
               '$tmpfile2'     using 1:2 with dots lc 'red' notitle,\
               '$tmpfile2.avg' using 1:2 with lines lc 'red' title 'INSERT',\
               '$tmpfile3'     using 1:2 with dots lc 'blue' notitle,\
               '$tmpfile3.avg' using 1:2 with lines lc 'blue' title 'UPDATE',\
               '$tmpfile4'     using 1:2 with dots lc 'cyan' notitle,\
               '$tmpfile4.avg' using 1:2 with lines lc 'cyan' title 'DELETE'
              " | gnuplot
            echo "<p><img src=\"stmts_over_time.${thd}.png\"></p>" >> $html

            rm ${tmpfile1} ${tmpfile1}.avg
            rm ${tmpfile2} ${tmpfile2}.avg
            rm ${tmpfile3} ${tmpfile3}.avg
            rm ${tmpfile4} ${tmpfile4}.avg

            if [[ ${binlog} = "yes" ]]
            then
                #
                # Binlog group commits
                #
                local tmpfile1=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile1 "Binlog_commits"
                average_col2 $tmpfile1 $tmpfile1.avg
                local tmpfile2=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile2 "Binlog_group_commits"
                average_col2 $tmpfile2 $tmpfile2.avg

                echo "
                  set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                  set xrange [0:$runtime]
                  set yrange [0:]
                  set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                  set ylabel 'commits/s'
                  set key bottom center outside horizontal
                  set output 'plots/binlog_commits.${thd}.png'
                  set title 'binlog commits for ${desc} at ${thd} threads'
                  plot '$tmpfile1' using 1:2 with dots lc 'green' notitle,\
                   '$tmpfile1.avg' using 1:2 with lines lc 'green' title 'binlog commits',\
                   '$tmpfile2'     using 1:2 with dots lc 'blue' notitle,\
                   '$tmpfile2.avg' using 1:2 with lines lc 'blue' title 'binlog group commits'
                  " | gnuplot
                echo "<p><img src=\"binlog_commits.${thd}.png\"></p>" >> $html

                rm ${tmpfile1} ${tmpfile1}.avg
                rm ${tmpfile2} ${tmpfile2}.avg
            fi


            if [[ ${engine} = "Aria" ]]
            then
                echo "<h3>Aria Global Status Variables</h3>" >> $html
                #
                # Pagecache Reads
                #
                local tmpfile1=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile1 "Aria_pagecache_read_requests"
                average_col2 $tmpfile1 $tmpfile1.avg
                local tmpfile2=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile2 "Aria_pagecache_reads"
                average_col2 $tmpfile2 $tmpfile2.avg

                echo "
                  set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                  set xrange [0:$runtime]
                  set yrange [0:]
                  set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                  set ylabel 'MB/s'
                  set key bottom center outside horizontal
                  set output 'plots/aria_pc_reads_over_time.${thd}.png'
                  set title 'Aria page cache reads for ${desc} at ${thd} threads'
                  plot '$tmpfile1' using 1:2 with dots lc 'green' notitle,\
                   '$tmpfile1.avg' using 1:2 with lines lc 'green' title 'read requests',\
                   '$tmpfile2'     using 1:2 with dots lc 'blue' notitle,\
                   '$tmpfile2.avg' using 1:2 with lines lc 'blue' title 'reads'
                  " | gnuplot
                echo "<p><img src=\"aria_pc_reads_over_time.${thd}.png\"></p>" >> $html

                rm ${tmpfile1} ${tmpfile1}.avg
                rm ${tmpfile2} ${tmpfile2}.avg

            fi


            if [[ ${engine} = "InnoDB" ]]
            then
                echo "<h3>InnoDB Global Status Variables</h3>" >> $html

                #
                # InnoDB pages data/dirty
                #
                local tmpfile1=$(mktemp)
                extract_status_gauge status.${thd}.log $tmpfile1 "Innodb_buffer_pool_pages_data"
                average_col2 $tmpfile1 $tmpfile1.avg
                local tmpfile2=$(mktemp)
                extract_status_gauge status.${thd}.log $tmpfile2 "Innodb_buffer_pool_pages_dirty"
                average_col2 $tmpfile2 $tmpfile2.avg

                echo "
                  set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                  set xrange [0:$runtime]
                  set yrange [0:]
                  set lmargin 10
                  set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                  set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                  set ylabel 'kpages'
                  set key bottom center outside horizontal
                  set output 'plots/ib_pages_over_time.${thd}.png'
                  set title 'Buffer pool usage for ${desc} at ${thd} threads'
                  plot '$tmpfile1' using 1:(\$2/1000) with dots lc 'blue' notitle,\
                   '$tmpfile1.avg' using 1:(\$2/1000) with lines lc 'blue' title 'pages data',\
                   '$tmpfile2'     using 1:(\$2/1000) with dots lc 'red' notitle,\
                   '$tmpfile2.avg' using 1:(\$2/1000) with lines lc 'red' title 'pages dirty'
                  " | gnuplot
                echo "<p><img src=\"ib_pages_over_time.${thd}.png\"></p>" >> $html

                rm ${tmpfile1} ${tmpfile1}.avg
                rm ${tmpfile2} ${tmpfile2}.avg

                if [[ ${writes} = "yes" ]]
                then
                    #
                    # InnoDB page flushes / LRU flushes
                    #
                    local tmpfile1=$(mktemp)
                    extract_status_rate status.${thd}.log $tmpfile1 "Innodb_buffer_pool_pages_flushed"
                    average_col2 $tmpfile1 $tmpfile1.avg
                    local tmpfile2=$(mktemp)
                    extract_status_rate status.${thd}.log $tmpfile2 "Innodb_buffer_pool_pages_lru_flushed"
                    average_col2 $tmpfile2 $tmpfile2.avg

                    echo "
                      set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                      set xrange [0:$runtime]
                      set yrange [0:]
                      set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                      set ylabel 'kpages/s'
                      set key bottom center outside horizontal
                      set output 'plots/ib_flush_over_time.${thd}.png'
                      set title 'Buffer pool flushes for ${desc} at ${thd} threads'
                      plot '$tmpfile1' using 1:(\$2/1000) with dots lc 'blue' notitle,\
                       '$tmpfile1.avg' using 1:(\$2/1000) with lines lc 'blue' title 'pages flushed',\
                       '$tmpfile2'     using 1:(\$2/1000) with dots lc 'red' notitle,\
                       '$tmpfile2.avg' using 1:(\$2/1000) with lines lc 'red' title 'pages LRU flushed'
                      " | gnuplot
                    echo "<p><img src=\"ib_flush_over_time.${thd}.png\"></p>" >> $html

                    rm ${tmpfile1} ${tmpfile1}.avg
                    rm ${tmpfile2} ${tmpfile2}.avg

                    #
                    # InnoDB checkpoint age
                    #
                    if fgrep -q "Innodb_checkpoint_age" status.${thd}.log
                    then
                        local tmpfile1=$(mktemp)
                        extract_status_gauge status.${thd}.log $tmpfile1 "Innodb_checkpoint_age"
                        average_col2 $tmpfile1 $tmpfile1.avg

                        echo "
                          set terminal png medium nocrop enhanced size 960,280 background '#FCFCFC' linewidth 2
                          set xrange [0:$runtime]
                          set yrange [0:]
                          set lmargin 10
                          set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                          set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                          set ylabel 'MB'
                          set key top right
                          set output 'plots/ib_chkpt_over_time.${thd}.png'
                          set title 'Checkpoint age for ${desc} at ${thd} threads'
                          plot '$tmpfile1' using 1:(\$2/1024/1024) with dots lc 'blue' notitle,\
                           '$tmpfile1.avg' using 1:(\$2/1024/1024) with lines lc 'blue' title 'checkpoint age',\
                          " | gnuplot
                        echo "<p><img src=\"ib_chkpt_over_time.${thd}.png\"></p>" >> $html

                        rm ${tmpfile1} ${tmpfile1}.avg
                    fi

                    #
                    # InnoDB history list length
                    #
                    if fgrep -q "Innodb_history_list_length" status.${thd}.log
                    then
                        local tmpfile1=$(mktemp)
                        extract_status_gauge status.${thd}.log $tmpfile1 "Innodb_history_list_length"
                        average_col2 $tmpfile1 $tmpfile1.avg

                        echo "
                          set terminal png medium nocrop enhanced size 960,280 background '#FCFCFC' linewidth 2
                          set xrange [0:$runtime]
                          set yrange [0:]
                          set lmargin 10
                          set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                          set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                          set ylabel 'TRX'
                          set key top right
                          set output 'plots/ib_hist_over_time.${thd}.png'
                          set title 'History list length for ${desc} at ${thd} threads'
                          plot '$tmpfile1' using 1:(\$2) with dots lc 'blue' notitle,\
                           '$tmpfile1.avg' using 1:(\$2) with lines lc 'blue' title 'History List Length',\
                          " | gnuplot
                        echo "<p><img src=\"ib_hist_over_time.${thd}.png\"></p>" >> $html

                        rm ${tmpfile1} ${tmpfile1}.avg
                    fi

                    #
                    # InnoDB log writes
                    #
                    local tmpfile1=$(mktemp)
                    extract_status_rate status.${thd}.log $tmpfile1 "Innodb_os_log_written"
                    average_col2 $tmpfile1 $tmpfile1.avg

                    echo "
                      set terminal png medium nocrop enhanced size 960,280 background '#FCFCFC' linewidth 2
                      set xrange [0:$runtime]
                      set yrange [0:]
                      set lmargin 10
                          set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                          set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                      set ylabel 'MB/s'
                      set key bottom right
                      set output 'plots/ib_log_over_time.${thd}.png'
                      set title 'InnoDB log writes for ${desc} at ${thd} threads'
                      plot '$tmpfile1' using 1:(\$2/1024/1024) with dots lc 'blue' notitle,\
                       '$tmpfile1.avg' using 1:(\$2/1024/1024) with lines lc 'blue' title 'log writes',\
                      " | gnuplot
                    echo "<p><img src=\"ib_log_over_time.${thd}.png\"></p>" >> $html

                    rm ${tmpfile1} ${tmpfile1}.avg
                fi

                #
                # InnoDB data reads / writes
                #
                local tmpfile1=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile1 "Innodb_data_read"
                average_col2 $tmpfile1 $tmpfile1.avg
                local tmpfile2=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile2 "Innodb_data_written"
                average_col2 $tmpfile2 $tmpfile2.avg

                echo "
                  set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                  set xrange [0:$runtime]
                  set yrange [0:]
                  set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                  set ylabel 'MB/s'
                  set key bottom center outside horizontal
                  set output 'plots/ib_writes_over_time.${thd}.png'
                  set title 'InnoDB disk usage for ${desc} at ${thd} threads'
                  plot '$tmpfile1' using 1:(\$2/1024/1024) with dots lc 'green' notitle,\
                   '$tmpfile1.avg' using 1:(\$2/1024/1024) with lines lc 'green' title 'data read',\
                   '$tmpfile2'     using 1:(\$2/1024/1024) with dots lc 'blue' notitle,\
                   '$tmpfile2.avg' using 1:(\$2/1024/1024) with lines lc 'blue' title 'data write'
                  " | gnuplot
                echo "<p><img src=\"ib_writes_over_time.${thd}.png\"></p>" >> $html

                rm ${tmpfile1} ${tmpfile1}.avg
                rm ${tmpfile2} ${tmpfile2}.avg

            fi


            if [[ ${engine} = "MyISAM" ]]
            then
                echo "<h3>MyISAM Global Status Variables</h3>" >> $html
                #
                # Key Cache Reads
                #
                local tmpfile1=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile1 "Key_read_requests"
                average_col2 $tmpfile1 $tmpfile1.avg
                local tmpfile2=$(mktemp)
                extract_status_rate status.${thd}.log $tmpfile2 "Key_reads"
                average_col2 $tmpfile2 $tmpfile2.avg

                echo "
                  set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2
                  set xrange [0:$runtime]
                  set yrange [0:]
                  set lmargin 10
                      set grid xtics lc rgb '#bbbbbb' lw 1 lt 0
                      set grid ytics lc rgb '#bbbbbb' lw 1 lt 0
                  set ylabel 'MB/s'
                  set key bottom center outside horizontal
                  set output 'plots/key_reads_over_time.${thd}.png'
                  set title 'MyISAM key cache reads for ${desc} at ${thd} threads'
                  plot '$tmpfile1' using 1:2 with dots lc 'green' notitle,\
                   '$tmpfile1.avg' using 1:2 with lines lc 'green' title 'read requests',\
                   '$tmpfile2'     using 1:2 with dots lc 'blue' notitle,\
                   '$tmpfile2.avg' using 1:2 with lines lc 'blue' title 'reads'
                  " | gnuplot
                echo "<p><img src=\"key_reads_over_time.${thd}.png\"></p>" >> $html

                rm ${tmpfile1} ${tmpfile1}.avg
                rm ${tmpfile2} ${tmpfile2}.avg

            fi

            #
            #  End
            #
            echo "<p><a href=\"../status.${thd}.log\">raw data</a></p>" >> $html
        fi

        #
        # mutex stats from PFS
        #
        if [[ -f pfs.${thd}.log ]]
        then
            echo "<h3>Performance Schema monitoring</h3>" >> $html
            extract_mutex_ranks pfs.${thd}.log pfs-ranks.${thd}.log

            #
            # server mutexes
            #
            echo "<h4>Top Server Mutexes</h4>" >> $html
            fgrep '/sql/' pfs-ranks.${thd}.log | head -n ${PFS_TOP:-4} | cut -f 1 > pfs-ranks-server.${thd}.log

            unset datafile dataname
            while read mutex
            do
                local mutexname=$(echo $mutex | sed 's/.*\///')
                local tmpfile=$(mktemp)
                extract_mutex pfs.${thd}.log $tmpfile $mutexname
                average_col23 $tmpfile $tmpfile.avg
                datafile+=($tmpfile)
                dataname+=($mutexname)
            done < pfs-ranks-server.${thd}.log
            rm pfs-ranks-server.${thd}.log

            if [[ ${#datafile[@]} -gt 0 ]]
            then
                local plotfile=$(mktemp)
                echo "set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2" >  $plotfile
                echo "set colorsequence classic"                                                             >> $plotfile
                echo "set xrange [0:$runtime]"                                                               >> $plotfile
                echo "set yrange [0:]"                                                                       >> $plotfile
                echo "set lmargin 10"                                                                        >> $plotfile
                echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                echo "set key bottom center outside horizontal"                                              >> $plotfile
                echo "set ylabel 'mio events'"                                                               >> $plotfile
                echo "set output 'plots/server_mutex_events.${thd}.png'"                                     >> $plotfile
                echo "set title 'mutex events for ${desc} at ${thd} threads'"                                >> $plotfile
                for i in ${!datafile[@]}
                do
                    ii=$(($i+1))
                    if [[ $i -eq 0 ]]
                    then
                        echo -n "plot "                                                                      >> $plotfile
                    else
                    echo -n ", "                                                                             >> $plotfile
                    fi
                    echo -n "'${datafile[$i]}'     using 1:(\$2/1e6) with dots  linestyle $ii notitle, "               >> $plotfile
                    echo -n "'${datafile[$i]}.avg' using 1:(\$2/1e6) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                done
                echo >> $plotfile
                echo "set ylabel 'sum waits [s]'"                                                            >> $plotfile
                echo "set output 'plots/server_mutex_waits.${thd}.png'"                                      >> $plotfile
                echo "set title 'mutex waits for ${desc} at ${thd} threads'"                                 >> $plotfile
                for i in ${!datafile[@]}
                do
                    ii=$(($i+1))
                    if [[ $i -eq 0 ]]
                    then
                        echo -n "plot "                                                                      >> $plotfile
                    else
                    echo -n ", "                                                                             >> $plotfile
                    fi
                    echo -n "'${datafile[$i]}'     using 1:(\$3/1e12) with dots  linestyle $ii notitle, "               >> $plotfile
                    echo -n "'${datafile[$i]}.avg' using 1:(\$3/1e12) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                done
                gnuplot $plotfile
                echo "<p><img src=\"server_mutex_events.${thd}.png\"></p>" >> $html
                echo "<p><img src=\"server_mutex_waits.${thd}.png\"></p>"  >> $html
                rm $plotfile
            fi

            for i in ${!datafile[@]}
            do
                rm ${datafile[$i]} ${datafile[$i]}.avg
            done


            if [[ ${engine} = "Aria" ]]
            then
                #
                # aria engine mutexes
                #
                echo "<h4>Top Aria Mutexes</h4>" >> $html
                fgrep '/aria/' pfs-ranks.${thd}.log | head -n ${PFS_TOP:-4} | cut -f 1 > pfs-ranks-aria.${thd}.log

                unset datafile dataname
                while read mutex
                do
                    local mutexname=$(echo $mutex | sed 's/.*\///')
                    local tmpfile=$(mktemp)
                    extract_mutex pfs.${thd}.log $tmpfile $mutexname
                    average_col23 $tmpfile $tmpfile.avg
                    datafile+=($tmpfile)
                    dataname+=($mutexname)
                done < pfs-ranks-aria.${thd}.log
                rm pfs-ranks-aria.${thd}.log

                if [[ ${#datafile[@]} -gt 0 ]]
                then
                    local plotfile=$(mktemp)
                    echo "set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2" >  $plotfile
                    echo "set colorsequence classic"                                                             >> $plotfile
                    echo "set xrange [0:$runtime]"                                                               >> $plotfile
                    echo "set yrange [0:]"                                                                       >> $plotfile
                    echo "set lmargin 10"                                                                        >> $plotfile
                    echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set key bottom center outside horizontal"                                              >> $plotfile
                    echo "set ylabel 'mio events'"                                                               >> $plotfile
                    echo "set output 'plots/aria_mutex_events.${thd}.png'"                                     >> $plotfile
                    echo "set title 'mutex events for ${desc} at ${thd} threads'"                                >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$2/1e6) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$2/1e6) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    echo >> $plotfile
                    echo "set ylabel 'sum waits [s]'"                                                            >> $plotfile
                    echo "set output 'plots/aria_mutex_waits.${thd}.png'"                                      >> $plotfile
                    echo "set title 'mutex waits for ${desc} at ${thd} threads'"                                 >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$3/1e12) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$3/1e12) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    gnuplot $plotfile
                    echo "<p><img src=\"aria_mutex_events.${thd}.png\"></p>" >> $html
                    echo "<p><img src=\"aria_mutex_waits.${thd}.png\"></p>"  >> $html
                    rm $plotfile
                fi

                for i in ${!datafile[@]}
                do
                    rm ${datafile[$i]} ${datafile[$i]}.avg
                done
            fi

            if [[ ${engine} = "InnoDB" ]]
            then
                #
                # InnoDB engine mutexes
                #
                echo "<h4>Top InnoDB Mutexes</h4>" >> $html
                fgrep '/innodb/' pfs-ranks.${thd}.log | head -n ${PFS_TOP:-4} | cut -f 1 > pfs-ranks-innodb.${thd}.log

                unset datafile dataname
                while read mutex
                do
                    local mutexname=$(echo $mutex | sed 's/.*\///')
                    local tmpfile=$(mktemp)
                    extract_mutex pfs.${thd}.log $tmpfile $mutexname
                    average_col23 $tmpfile $tmpfile.avg
                    datafile+=($tmpfile)
                    dataname+=($mutexname)
                done < pfs-ranks-innodb.${thd}.log
                rm pfs-ranks-innodb.${thd}.log

                if [[ ${#datafile[@]} -gt 0 ]]
                then
                    local plotfile=$(mktemp)
                    echo "set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2" >  $plotfile
                    echo "set colorsequence classic"                                                             >> $plotfile
                    echo "set xrange [0:$runtime]"                                                               >> $plotfile
                    echo "set yrange [0:]"                                                                       >> $plotfile
                    echo "set lmargin 10"                                                                        >> $plotfile
                    echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set key bottom center outside horizontal"                                              >> $plotfile
                    echo "set ylabel 'mio events'"                                                               >> $plotfile
                    echo "set output 'plots/innodb_mutex_events.${thd}.png'"                                     >> $plotfile
                    echo "set title 'mutex events for ${desc} at ${thd} threads'"                                >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$2/1e6) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$2/1e6) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    echo >> $plotfile
                    echo "set ylabel 'sum waits [s]'"                                                            >> $plotfile
                    echo "set output 'plots/innodb_mutex_waits.${thd}.png'"                                      >> $plotfile
                    echo "set title 'mutex waits for ${desc} at ${thd} threads'"                                 >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$3/1e12) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$3/1e12) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    gnuplot $plotfile
                    echo "<p><img src=\"innodb_mutex_events.${thd}.png\"></p>" >> $html
                    echo "<p><img src=\"innodb_mutex_waits.${thd}.png\"></p>"  >> $html
                    rm $plotfile
                fi

                for i in ${!datafile[@]}
                do
                    rm ${datafile[$i]} ${datafile[$i]}.avg
                done
            fi

            if [[ ${engine} = "MyISAM" ]]
            then
                #
                # MyISAM engine mutexes
                #
                echo "<h4>Top MyISAM Mutexes</h4>" >> $html
                grep -P '/my(isam)|(sys)/' pfs-ranks.${thd}.log | head -n ${PFS_TOP:-4} | cut -f 1 > pfs-ranks-myisam.${thd}.log

                unset datafile dataname
                while read mutex
                do
                    local mutexname=$(echo $mutex | sed 's/.*\///')
                    local tmpfile=$(mktemp)
                    extract_mutex pfs.${thd}.log $tmpfile $mutexname
                    average_col23 $tmpfile $tmpfile.avg
                    datafile+=($tmpfile)
                    dataname+=($mutexname)
                done < pfs-ranks-myisam.${thd}.log
                rm pfs-ranks-myisam.${thd}.log

                if [[ ${#datafile[@]} -gt 0 ]]
                then
                    local plotfile=$(mktemp)
                    echo "set terminal png medium nocrop enhanced size 960,300 background '#FCFCFC' linewidth 2" >  $plotfile
                    echo "set colorsequence classic"                                                             >> $plotfile
                    echo "set xrange [0:$runtime]"                                                               >> $plotfile
                    echo "set yrange [0:]"                                                                       >> $plotfile
                    echo "set lmargin 10"                                                                        >> $plotfile
                    echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0"                                             >> $plotfile
                    echo "set key bottom center outside horizontal"                                              >> $plotfile
                    echo "set ylabel 'mio events'"                                                               >> $plotfile
                    echo "set output 'plots/myisam_mutex_events.${thd}.png'"                                     >> $plotfile
                    echo "set title 'mutex events for ${desc} at ${thd} threads'"                                >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$2/1e6) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$2/1e6) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    echo >> $plotfile
                    echo "set ylabel 'sum waits [s]'"                                                            >> $plotfile
                    echo "set output 'plots/myisam_mutex_waits.${thd}.png'"                                      >> $plotfile
                    echo "set title 'mutex waits for ${desc} at ${thd} threads'"                                 >> $plotfile
                    for i in ${!datafile[@]}
                    do
                        ii=$(($i+1))
                        if [[ $i -eq 0 ]]
                        then
                            echo -n "plot "                                                                      >> $plotfile
                        else
                        echo -n ", "                                                                             >> $plotfile
                        fi
                        echo -n "'${datafile[$i]}'     using 1:(\$3/1e12) with dots  linestyle $ii notitle, "               >> $plotfile
                        echo -n "'${datafile[$i]}.avg' using 1:(\$3/1e12) with lines linestyle $ii title '${dataname[$i]}'" >> $plotfile
                    done
                    gnuplot $plotfile
                    echo "<p><img src=\"myisam_mutex_events.${thd}.png\"></p>" >> $html
                    echo "<p><img src=\"myisam_mutex_waits.${thd}.png\"></p>"  >> $html
                    rm $plotfile
                fi

                for i in ${!datafile[@]}
                do
                    rm ${datafile[$i]} ${datafile[$i]}.avg
                done
            fi

            echo "<p><a href=\"../pfs.${thd}.log\">raw data</a></p>" >> $html
            rm pfs-ranks.${thd}.log
        fi

        #flame graphs
        if [[ ${FLAMEGRAPH} && -d ${FLAMEGRAPH} && -f perf.${thd}.data ]]
        then
            date --utc "+%F %T   creating flamegraph from perf.${thd}.data"
            tmpfile=$(mktemp)
            perf script -i perf.${thd}.data | ${FLAMEGRAPH}/stackcollapse-perf.pl > ${tmpfile}
            ${FLAMEGRAPH}/flamegraph.pl ${tmpfile} > plots/flamegraph.${thd}.svg
            rm ${tmpfile}
            date --utc "+%F %T   done"
            echo "<h3>Flame Graph</h3>" >> $html
            echo "<p><a href=\"flamegraph.${thd}.svg\"><img src=\"flamegraph.${thd}.svg\" width=\"900\" height=\"280\"></a></p>" >> $html

        fi

    done

    echo "</body></html>" >> $html

    popd > /dev/null
}


