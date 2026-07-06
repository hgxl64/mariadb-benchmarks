#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

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
    echo "ERROR: monitorlog not specified "; echo -e "$USAGE"; exit 1;
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
NUM_SLAVES=$(head -n1 ${MONITOR_LOG} | awk '{ print NF-2 }')

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
    echo "set xlabel 'Time (Intervals)'"
    echo "set grid ytics"
    echo "set key bottom center outside horizontal noenhanced"
    echo "set output '${REPORTDIRECTORY}/$4'"
    echo "set title '$1'"
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

# Interval Seconds
gen_graph "Interval Seconds" "Seconds" 10 "interval:interval seconds"

# Slave Lag per Host
pngfile="slave_lag.png"
{
    echo "set terminal png size $GRAPH_SIZE enhanced font '$GRAPH_FONT' 11 linewidth 2"
    echo "set yrange [0:*]"
    echo "set xrange [0:*]"
    echo "set ylabel 'GTIDs'"
    echo "set xlabel 'Time (Intervals)'"
    echo "set grid ytics"
    echo "set output '${REPORTDIRECTORY}/$pngfile'"
    echo "set title 'Slave Lag'"
    echo "set key top left"
    echo "set datafile missing 'NaN'"
    echo "plot \\"
    for i in $(seq ${NUM_SLAVES}); do
        echo "'${MONITOR_LOG}' using ( \$2-\$$((${i}+2)) ) title 'slave ${i}' with lines, \\"
    done
    echo
    echo 'exit'
} | gnuplot 2>/dev/null

html_chart "Slave Lag" "$pngfile"

# Average Slave Lag
pngfile="average_slave_lag.png"
{
    echo "set terminal png size $GRAPH_SIZE enhanced font '$GRAPH_FONT' 11 linewidth 2"
    echo "set yrange [0:*]"
    echo "set xrange [0:*]"
    echo "set ylabel 'GTIDs'"
    echo "set xlabel 'Time (Intervals)'"
    echo "set grid ytics"
    echo "set output '${REPORTDIRECTORY}/$pngfile'"
    echo "set title 'Slave Lag'"
    echo "set key top left"
    echo "set datafile missing 'NaN'"
    echo -n "plot '${MONITOR_LOG}' using (${NUM_SLAVES}*\$2"
    for i in $(seq ${NUM_SLAVES}); do
        echo -n "-\$$((${i}+2))"
    done
    echo ")/${NUM_SLAVES} with lines title 'avg slave lag'"
    echo
    echo 'exit'
} | gnuplot 2>/dev/null

html_chart "Average Slave Lag" "$pngfile"

