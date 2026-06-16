#!/bin/bash

USAGE="usage: $0
    Creates a report (graphics and html file) from a monitor log.
    Options:
        [ --monitorlog <monitorlog> ]
        [ -h|--help|help ]
"

[ "$GRAPH_FONT" ] || GRAPH_FONT='/usr/share/fonts/liberation/LiberationSans-Regular.ttf'
[ "$GRAPH_SIZE" ] || GRAPH_SIZE='1000,500'

while [[ $# > 0 ]] ; do
key="$1"; shift;
case ${key} in
    --monitorlog)   MONITOR_LOG="$1"; shift;;
    -h|--help|help) echo -e "$USAGE"; exit 1;;
    *)              echo "Invalid input switch: $key"; echo -e "$USAGE"; exit 1;;
esac
done

if [[ ! ${MONITOR_LOG} ]] ; then
    echo "ERROR: --monitorlog not specified "; echo -e "$USAGE"; exit 1;
fi

REPORTDIRECTORY="${MONITOR_LOG%.log}.report"
mkdir -p "${REPORTDIRECTORY}"
HTML_TARGET="${REPORTDIRECTORY}/index.html"

html_begin(){
    echo "<html><body>" > $HTML_TARGET
}

html_title(){
    echo "<h2>$1</h2>" >> $HTML_TARGET
}

html_chart(){
    echo "<h3>$1</h3>" >> $HTML_TARGET
    echo "<img src=\"$2\" />" >> $HTML_TARGET
}

HEADERS="$(head -n1 ${MONITOR_LOG})"

colidx(){
    echo $HEADERS | awk -v c="$1" 'NR==1 {for (i=1; i<=NF; i++) if ($i==c) break} {if (i<=NF) print i; else exit 1}' || echo "Missing $1" >&2
}

has_colname(){
    echo $HEADERS | grep "$1" >/dev/null 2>&1 && return 0 || return 1
}

has_colnames(){
    for c in $@; do
        has_colname "$c" || return 1
    done
    return 0
}

build_gnuplot(){
    # $1=graph title, $2=y axis lable, $3=y limit, $4=output file, $5=var1:title1;var2:title2...
    echo "set terminal png size $GRAPH_SIZE enhanced font '$GRAPH_FONT' 11 linewidth 2"
    echo "set yrange [0:$3]"
    echo "set xrange [0:${MAX_INTERVAL}]"
    echo "set ylabel '$2'"
    echo "set grid ytics"
    echo "set output '${REPORTDIRECTORY}/$4'"
    echo "set title '$1'"
    echo "set key bottom center outside horizontal noenhanced"
    echo -n "plot "
    IFS=';' read -ra vars <<< "$5"
    first=true
    for var in "${vars[@]}"; do
        ! $first && echo -n ", "
        $first && first=false
        colname="$(echo $var | awk -F: '{print $1}')"
        coltitle="$(echo $var | awk -F: '{print $2}')"
        echo -n "'${MONITOR_LOG}' using $(colidx $colname) title '$coltitle' with lines"
    done
    echo
    echo 'exit'
}

gen_graph(){
    # $1=graph title, $2=y axis lable, $3=y limit, $4=var1:title1;var2:title2... $5=skip html
    pngfile="$(echo $1 | awk '{print tolower($0)}' | tr ' ' '_').png"
    build_gnuplot "$1" "$2" "$3" "$pngfile" "$4" | gnuplot 2>/dev/null
    [ "$5" ] || html_chart "$1" "$pngfile"
}

html_begin
html_title "MariaDB Performance Monitor 2.0 Report"

# Interval Seconds
gen_graph "Interval Seconds" "Elapsed Seconds" 20 "DELTA_SECS:interval seconds"

html_title "Throughput Stats"
# Throughput (QPS/TPS)
if has_colnames COM_COMMIT QUERIES QUESTIONS; then
    gen_graph "SQL Throughput" "Throughput" "${MAX_THROUGHPUT}" "COM_COMMIT:COM_COMMIT;QUERIES:QUERIES;QUESTIONS:QUESTIONS"
fi

# Statements by Type
if has_colnames COM_SELECT COM_INSERT COM_UPDATE COM_DELETE; then
    gen_graph "Statements by Type" "Statements" "" "COM_SELECT:COM_SELECT;COM_INSERT:COM_INSERT;COM_UPDATE:COM_UPDATE;COM_DELETE:COM_DELETE"
fi

html_title "Concurrency Stats"
if has_colnames CONNECTIONS ; then
    gen_graph "Concurrency - Connections" "Counts" "" "CONNECTIONS:CONNECTIONS"
fi
if has_colnames THREADS_CREATED THREADS_CONNECTED THREADS_RUNNING ; then
    gen_graph "Concurrency - Threads" "Counts" "" "THREADS_CREATED:THREADS_CREATED;THREADS_CONNECTED:THREADS_CONNECTED;THREADS_RUNNING:THREADS_RUNNING"
fi
#if has_colnames THREADPOOL_THREADS THREADPOOL_IDLE_THREADS ; then
#    gen_graph "Concurrency - Thread Pools" "Counts" "" "THREADPOOL_THREADS:THREADPOOL_THREADS;THREADPOOL_IDLE_THREADS:THREADPOOL_IDLE_THREADS"
#fi

html_title "InnoDB Stats"
if has_colnames INNODB_DATA_READS INNODB_DATA_WRITES INNODB_DATA_FSYNCS ; then
    gen_graph "Innodb Data Reads Writes Fsyncs" "Operations" "" "INNODB_DATA_READS:INNODB_DATA_READS;INNODB_DATA_WRITES:INNODB_DATA_WRITES;INNODB_DATA_FSYNCS:INNODB_DATA_FSYNCS"
fi
if has_colnames INNODB_BUFFER_POOL_PAGES_DATA INNODB_BUFFER_POOL_PAGES_DIRTY  INNODB_BUFFER_POOL_PAGES_FREE INNODB_BUFFER_POOL_PAGES_MISC INNODB_BUFFER_POOL_PAGES_TOTAL ; then
    gen_graph "Innodb Buffer Pool Stats Part1" "Counts" "" "INNODB_BUFFER_POOL_PAGES_DATA:INNODB_BUFFER_POOL_PAGES_DATA;INNODB_BUFFER_POOL_PAGES_DIRTY:INNODB_BUFFER_POOL_PAGES_DIRTY;INNODB_BUFFER_POOL_PAGES_FREE:INNODB_BUFFER_POOL_PAGES_FREE;INNODB_BUFFER_POOL_PAGES_MISC:INNODB_BUFFER_POOL_PAGES_MISC;INNODB_BUFFER_POOL_PAGES_TOTAL:INNODB_BUFFER_POOL_PAGES_TOTAL"
fi
if has_colnames INNODB_BUFFER_POOL_PAGES_FLUSHED ; then
    gen_graph "Innodb Buffer Pool Stats Part 2" "Counts" "" "INNODB_BUFFER_POOL_PAGES_FLUSHED:INNODB_BUFFER_POOL_PAGES_FLUSHED"
fi
if has_colnames INNODB_ROWS_DELETED INNODB_ROWS_INSERTED INNODB_ROWS_READ INNODB_ROWS_UPDATED INNODB_SYSTEM_ROWS_DELETED INNODB_SYSTEM_ROWS_INSERTED INNODB_SYSTEM_ROWS_READ INNODB_SYSTEM_ROWS_UPDATED ; then
    gen_graph "Innodb Row Operations" "Counts" "" "INNODB_ROWS_DELETED:INNODB_ROWS_DELETED;INNODB_ROWS_INSERTED:INNODB_ROWS_INSERTED;INNODB_ROWS_READ:INNODB_ROWS_READ;INNODB_ROWS_UPDATED:INNODB_ROWS_UPDATED;INNODB_SYSTEM_ROWS_DELETED:INNODB_SYSTEM_ROWS_DELETED;INNODB_SYSTEM_ROWS_INSERTED:INNODB_SYSTEM_ROWS_INSERTED;INNODB_SYSTEM_ROWS_READ:INNODB_SYSTEM_ROWS_READ;INNODB_SYSTEM_ROWS_UPDATED:INNODB_SYSTEM_ROWS_UPDATED"
fi
if has_colnames INNODB_LOG_WAITS INNODB_LOG_WRITE_REQUESTS INNODB_LOG_WRITES ; then
    gen_graph "Innodb Log Stats" "Counts" "" "INNODB_LOG_WAITS:INNODB_LOG_WAITS;INNODB_LOG_WRITE_REQUESTS:INNODB_LOG_WRITE_REQUESTS;INNODB_LOG_WRITES:INNODB_LOG_WRITES"
fi
if has_colnames INNODB_ROW_LOCK_CURRENT_WAITS INNODB_ROW_LOCK_WAITS ; then
    gen_graph "Innodb Lock Stats" "Counts" "" "INNODB_ROW_LOCK_CURRENT_WAITS:INNODB_ROW_LOCK_CURRENT_WAITS;INNODB_ROW_LOCK_WAITS:INNODB_ROW_LOCK_WAITS"
fi
if has_colnames INNODB_ROW_LOCK_TIME INNODB_ROW_LOCK_TIME_AVG INNODB_ROW_LOCK_TIME_MAX ; then
    gen_graph "Innodb Lock Waits" "Time" "" "INNODB_ROW_LOCK_TIME:INNODB_ROW_LOCK_TIME;INNODB_ROW_LOCK_TIME_AVG:INNODB_ROW_LOCK_TIME_AVG;INNODB_ROW_LOCK_TIME_MAX:INNODB_ROW_LOCK_TIME_MAX"
fi

html_title "Binlog Stats"
if has_colnames BINLOG_BYTES_WRITTEN ; then
    gen_graph "Binlog Bytes" "Bytes" "" "BINLOG_BYTES_WRITTEN:BINLOG_BYTES_WRITTEN"
fi
if has_colnames BINLOG_COMMITS BINLOG_GROUP_COMMITS ; then
    gen_graph "Binlog Commits" "Counts" "" "BINLOG_COMMITS:BINLOG_COMMITS;BINLOG_GROUP_COMMITS:BINLOG_GROUP_COMMITS"
fi
if has_colnames BINLOG_GROUP_COMMIT_TRIGGER_COUNT BINLOG_GROUP_COMMIT_TRIGGER_LOCK_WAIT BINLOG_GROUP_COMMIT_TRIGGER_TIMEOUT ; then
    gen_graph "Binlog Triggers" "Counts" "" "BINLOG_GROUP_COMMIT_TRIGGER_COUNT:BINLOG_GROUP_COMMIT_TRIGGER_COUNT;BINLOG_GROUP_COMMIT_TRIGGER_LOCK_WAIT:BINLOG_GROUP_COMMIT_TRIGGER_LOCK_WAIT;BINLOG_GROUP_COMMIT_TRIGGER_TIMEOUT:BINLOG_GROUP_COMMIT_TRIGGER_TIMEOUT"
fi
if has_colnames BINLOG_SNAPSHOT_POSITION ; then
    gen_graph "Binlog Snapshot" "Bytes" "" "BINLOG_SNAPSHOT_POSITION:BINLOG_SNAPSHOT_POSITION"
fi
if has_colnames BINLOG_CACHE_DISK_USE BINLOG_CACHE_USE BINLOG_STMT_CACHE_DISK_USE BINLOG_STMT_CACHE_USE ; then
    gen_graph "Binlog Cache" "Bytes" "" "BINLOG_CACHE_DISK_USE:BINLOG_CACHE_DISK_USE;BINLOG_CACHE_USE:BINLOG_CACHE_USE;BINLOG_STMT_CACHE_DISK_USE:BINLOG_STMT_CACHE_DISK_USE;BINLOG_STMT_CACHE_USE:BINLOG_STMT_CACHE_USE"
fi

html_title "Galera Stats"
if has_colnames WSREP_REPLICATED WSREP_REPL_KEYS WSREP_RECEIVED WSREP_LOCAL_COMMITS  ; then
    gen_graph "Galera Ops" "Ops" "" "WSREP_REPLICATED:WSREP_REPLICATED;WSREP_REPL_KEYS:WSREP_REPL_KEYS;WSREP_RECEIVED:WSREP_RECEIVED;WSREP_LOCAL_COMMITS:WSREP_LOCAL_COMMITS"
fi
if has_colnames WSREP_REPLICATED_BYTES WSREP_REPL_KEYS_BYTES WSREP_REPL_DATA_BYTES WSREP_REPL_OTHER_BYTES WSREP_RECEIVED_BYTES ; then
    gen_graph "Galera Bytes" "Bytes" "" "WSREP_REPLICATED_BYTES:WSREP_REPLICATED_BYTES;WSREP_REPL_KEYS_BYTES:WSREP_REPL_KEYS_BYTES;WSREP_REPL_DATA_BYTES:WSREP_REPL_DATA_BYTES;WSREP_REPL_OTHER_BYTES:WSREP_REPL_OTHER_BYTES;WSREP_RECEIVED_BYTES:WSREP_RECEIVED_BYTES"
fi
if has_colnames WSREP_LOCAL_CERT_FAILURES WSREP_LOCAL_REPLAYS WSREP_COMMIT_OOOE ; then
    gen_graph "Galera Events" "Events" "" "WSREP_LOCAL_CERT_FAILURES:WSREP_LOCAL_CERT_FAILURES;WSREP_LOCAL_REPLAYS:WSREP_LOCAL_REPLAYS;WSREP_COMMIT_OOOE:WSREP_COMMIT_OOOE"
fi
if has_colnames WSREP_LOCAL_SEND_QUEUE WSREP_LOCAL_SEND_QUEUE_MAX WSREP_LOCAL_SEND_QUEUE_MIN WSREP_LOCAL_SEND_QUEUE_AVG WSREP_LOCAL_RECV_QUEUE WSREP_LOCAL_RECV_QUEUE_MAX WSREP_LOCAL_RECV_QUEUE_MIN ; then
    gen_graph "Galera Queues" "QueueLength" "" "WSREP_LOCAL_SEND_QUEUE:WSREP_LOCAL_SEND_QUEUE;WSREP_LOCAL_SEND_QUEUE_MAX:WSREP_LOCAL_SEND_QUEUE_MAX;WSREP_LOCAL_SEND_QUEUE_MIN:WSREP_LOCAL_SEND_QUEUE_MIN;WSREP_LOCAL_SEND_QUEUE_AVG:WSREP_LOCAL_SEND_QUEUE_AVG;WSREP_LOCAL_RECV_QUEUE:WSREP_LOCAL_RECV_QUEUE;WSREP_LOCAL_RECV_QUEUE_MAX:WSREP_LOCAL_RECV_QUEUE_MAX;WSREP_LOCAL_RECV_QUEUE_MIN:WSREP_LOCAL_RECV_QUEUE_MIN"
fi
if has_colnames WSREP_FLOW_CONTROL_SENT WSREP_FLOW_CONTROL_RECV ; then
    gen_graph "Galera Flow Control" "Ops" "" "WSREP_FLOW_CONTROL_SENT:WSREP_FLOW_CONTROL_SENT;WSREP_FLOW_CONTROL_RECV:WSREP_FLOW_CONTROL_RECV"
fi
if has_colnames WSREP_FLOW_CONTROL_PAUSED_NS ; then
    gen_graph "Galera Flow Control Waits" "Waittime" "" "WSREP_FLOW_CONTROL_PAUSED_NS:WSREP_FLOW_CONTROL_PAUSED_NS"
fi
