#!/bin/bash
#
# create a comparison plot from a list of named directories
#
# Axel "XL" Schwenke for MariaDB

source rt_functions.sh


# -------------------
# command line processing
# -------------------

COMMAND_LINE="$@"
RUNHOST="(unknown)"
OUTFILE=plot.pdf
unset RESULTS

while [[ $# > 0 ]] ; do
    arg="$1"; shift;
    case ${arg} in
        --host)         RUNHOST="$1"; shift;;
        --plot)         OUTFILE="$1"; shift;;
        --keep)         KEEP=1;;
        *) if [[ -d ${arg} ]]
           then
               RESULTS=(${RESULTS[*]} ${arg})
           else
               error "'$arg' is not a directory!"
           fi
           ;;
    esac
done

debug "RUNHOST = '${RUNHOST}'"
debug "OUTFILE = '${OUTFILE}'"
debug "DIRS = '${RESULTS[*]}'"


#find tests (use first dir)
unset TESTS
cd ${RESULTS[0]}
DIRS=$(ls -1d t_*)
for DIR in $DIRS
do
    [[ -d ${DIR} ]] && TESTS=(${TESTS[*]} ${DIR})
done
cd ..
debug "TESTS = '${TESTS[*]}'"


#creating GNUPLOT file
plotfile=$(mktemp)
info "creating GNUPLOT script in ${plotfile}"

echo "set terminal pdfcairo size 8, 5 font 'Arial,12' noenhanced

set xrange [0:*]
set xtics border nomirror
unset x2tics
set xlabel 'Throughput [tps]'

set logscale y 2
set ytics border nomirror
unset y2tics
set ylabel 'avg Latency [ms]'

set key left top
set colorsequence classic

" >> $plotfile

for i in $(seq ${#RESULTS[@]})
do
    echo "set style line $i linewidth 2" >> $plotfile
done
echo >> $plotfile

echo "set output '${OUTFILE}'" >> $plotfile
echo >> $plotfile

echo "do for [test in '${TESTS[*]}'] {
  set title sprintf('%s (@${RUNHOST})', test) font ',14'
  plot \\" >> $plotfile

i=0
for RES in ${RESULTS[*]}
do
    i=$(($i + 1))
    commit=$(grep '^ABBRV_COMMIT:' ${RES}/commit_info.yaml | sed 's/^ABBRV_COMMIT: //')
    stamp=$(grep '^TIMESTAMP:' ${RES}/commit_info.yaml | sed 's/^TIMESTAMP: //')
    date=$(date --date=@${stamp} --utc '+%Y-%m-%d %H:%M:%S UTC')
    release=$(grep '^RELEASE:' ${RES}/desc.yaml | sed 's/^RELEASE: //')
    [[ -n ${release} ]] && title="${release}, ${date}" || title="${commit}, ${date}"
    echo "    sprintf('${RES}/%s/summary.log', test) using 2:4 with linespoints linestyle ${i} linewidth 2 pointtype 6 title '${title}',\\" >> $plotfile
    echo "    '' index 0 using 2:4:1 with labels center offset 1.5, 0.5 notitle,\\" >> $plotfile
done
echo >> $plotfile

echo "}" >> $plotfile

#creating plot
gnuplot ${plotfile}

[[ ${KEEP} ]] || rm ${plotfile}

