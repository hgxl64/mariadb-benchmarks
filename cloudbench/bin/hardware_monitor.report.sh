#!/bin/bash

USAGE="usage: $0
    Creates a report (graphics and html file) from a monitor log.
    Options:
        [ monitorlog|-monitorlog|--monitorlog <<monitorlog>> ]
        [ maxinterval|-maxinterval|--maxinterval <<maxinterval>> ]
        [ maxthroughput|-maxthroughput|--maxthroughput <<maxthroughput>> ]
        [ disk|-disk|--disk ]
        [ interrupts|-interrupts|--interrupts ]
        [ swaps|-swaps|--swaps ]
        [ latency|-latency|--latency ]
        [ network|-network|--network ]
        [ memory|-memory|--memory ]
        [ waits|-waits|--waits ]
        [ -h|--help|help ]
    Notes:
    1.  monitorlog is required.
    2.  ...
"

while [[ $# > 0 ]] ; do
key="$1"; shift;
case ${key} in
    --cluster)          CLUSTER="$1"; shift;;
    --monitorlogs)      MONITOR_LOGS=( $1 ); shift;;
    --monitorreport)    REPORTDIRECTORY="$1"; shift;;
    --maxinterval)      MAX_INTERVAL="$1"; shift;;
    --maxthroughput)    MAX_THROUGHPUT="$1"; shift;;
    --hardware)         OPTION_HARDWARE=TRUE;;
    --disk)             OPTION_DISK=TRUE;;
    --network)          OPTION_NETWORK=TRUE;;
    --memory)           OPTION_MEMORY=TRUE;;
    --diskspace)        OPTION_DISKSPACE=TRUE;;
    --all)              OPTION_ALL=TRUE;;
    -h|--help)          echo -e "$USAGE"; exit 1;;
    *) echo "Invalid input switch: $key"; echo -e "$USAGE"; exit 1;;
esac
done

if [[ ! ${MONITOR_LOGS} ]] ; then
    echo "ERROR: monitorlog not specified "; echo -e "$USAGE"; exit 1;
fi
if [[ ! ${REPORTDIRECTORY} ]] ; then
    echo "ERROR: monitorreport not specified "; echo -e "$USAGE"; exit 1;
fi

if [[ ${OPTION_ALL} ]] ; then
    OPTION_HARDWARE=TRUE;
fi

if [[ ${OPTION_HARDWARE} ]] ; then
    OPTION_CPU=TRUE;
    OPTION_DISK=TRUE;
    OPTION_DISKSPACE=TRUE;
    OPTION_NETWORK=TRUE;
    OPTION_MEMORY=TRUE;
fi

#echo "      MONITOR_LOGS = ${MONITOR_LOGS[*]}"
#echo "      REPORTDIRECTORY = ${REPORTDIRECTORY}"

mkdir -p ${REPORTDIRECTORY}

IDX=3

# Interval Seconds
{
    echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
    echo "set yrange [0:20]"
    echo "set xrange [0:${MAX_INTERVAL}]"
    echo "set ylabel 'Elapsed Seconds'"
    echo "set xlabel 'Time (Intervals)'"
    echo "set grid ytics"
    echo "set key bottom center outside horizontal"
    echo "set output '${REPORTDIRECTORY}/interval_seconds.png'"
    echo "set title 'Interval Seconds'"
    echo "plot \\"
    for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
        if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
        echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
    done
    echo
    echo "exit"
} | gnuplot

(( IDX = IDX + 1 ))

if [[ ${OPTION_CPU} ]] ; then
    # CPU
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:100]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'Cpu Utilization'"
        echo "set grid ytics"
        echo "set key bottom center outside horizontal"
        echo "set output '${REPORTDIRECTORY}/cpu.utilization.png'"
        echo "set title 'CPU Utilization Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 1 ))
fi

if [[ ${OPTION_MEMORY} ]] ; then
    # Memory
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:100]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'Memory Utilization'"
        echo "set grid ytics"
        echo "set key bottom center outside horizontal"
        echo "set output '${REPORTDIRECTORY}/memory.utilization.png'"
        echo "set title 'Memory Utilization Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 5 ))
fi

if [[ ${OPTION_DISKSPACE} ]] ; then
    # Disk Space Usage
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:100]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'Disk Space Utilization'"
        echo "set grid ytics"
        echo "set key bottom center outside horizontal"
        echo "set output '${REPORTDIRECTORY}/diskspace.utilization.png'"
        echo "set title 'Disk Space Utilization Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 4 ))
fi

if [[ ${OPTION_DISK} ]] ; then
    # Disk Stats
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'Disk Operations Per Second (iops)'"
        echo "set grid ytics"
        echo "set key bottom center outside horizontal"
        echo "set output '${REPORTDIRECTORY}/disk.iops.png'"
        echo "set title 'Disk Iops Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 5 ))
fi

if [[ ${OPTION_NETWORK} ]] ; then
    # Net Stats
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'MBytes Per Second'"
        echo "set grid ytics"
        echo "set output '${REPORTDIRECTORY}/network.receive.mbytes.png'"
        echo "set title 'Network Recieve MBytes Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 1 ))
    {
        echo "set terminal png size 1000,500 enhanced font '/usr/share/fonts/liberation/LiberationSans-Regular.ttf' 11 linewidth 2"
        echo "set yrange [0:]"
        echo "set xrange [0:${MAX_INTERVAL}]"
        echo "set ylabel 'MBytes Per Second'"
        echo "set grid ytics"
        echo "set key bottom center outside horizontal"
        echo "set output '${REPORTDIRECTORY}/network.send.mbytes.png'"
        echo "set title 'Network Send MBytes Over Time'"
        echo "plot \\"
        for (( LOG_IDX=0; LOG_IDX<${#MONITOR_LOGS[@]}; LOG_IDX++ )) ; do
            if (( ${LOG_IDX} > 0 )) ; then echo ", \\" ; fi
            echo " '${MONITOR_LOGS[${LOG_IDX}]}' using ${IDX} title '$( echo ${MONITOR_LOGS[${LOG_IDX}]##*/} | cut -d. -f4- | rev | cut -d"." -f2-  | rev )' with lines \\"
        done
        echo
        echo "exit"
    } | gnuplot
    (( IDX = IDX + 2 ))
fi



{
echo '
<html>
<body>
<h2>Hardware Monitor Performance Report</h2>
<h3>Interval Seconds</h3>
<img src="interval_seconds.png" />
'

if [[ ${OPTION_CPU} ]] ; then
echo '
<h2>CPU</h2>
<h3>CPU Utilization</h3>
<img src="cpu.utilization.png" />
'
fi

if [[ ${OPTION_DISK} ]] ; then
echo '
<h2>Disk Stats</h2>
<h3>Disk Operations</h3>
<img src="disk.iops.png" />
'
fi

if [[ ${OPTION_NETWORK} ]] ; then
echo '
<h2>Network Stats</h2>
<h3>Receive Bytes</h3>
<img src="network.receive.mbytes.png" />
<h3>Send Bytes</h3>
<img src="network.send.mbytes.png" />
'
fi

if [[ ${OPTION_MEMORY} ]] ; then
echo '
<h2>Memory</h2>
<h3>Memory Utilization</h3>
<img src="memory.utilization.png" />
'
fi

if [[ ${OPTION_DISKSPACE} ]] ; then
echo '
<h2>Disk Space</h2>
<h3>Disk Space Utilization</h3>
<img src="diskspace.utilization.png" />
'
fi

} > ${REPORTDIRECTORY}/index.html
