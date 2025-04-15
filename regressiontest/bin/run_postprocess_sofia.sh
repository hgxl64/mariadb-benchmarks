#!/bin/bash
#
# post-processing script for hosts located in the Sofia VPN
# to be run on on the machine that holds the common NFS share
#
# Axel "XL" Schwenke for MariaDB

source rt_functions.sh
source ${RT_HOME}/config/global

#arguments to this script are the host and the resultdir
RUNHOST=$1
RESULTDIR=$2


#test if result exists
if [[ ! -d ${NFSBASEDIR}/${RUNHOST}/${RESULTDIR} ]]
then
    error "no result dir '${NFSBASEDIR}/${RUNHOST}/${RESULTDIR}'"
fi


#detect product and branch
WHEN=$(echo ${RESULTDIR} | sed 's/\.regressiontest\..*//')
info "detected timespec '${WHEN}'"
PRODUCT=$(echo ${RESULTDIR} | sed 's/^'${WHEN}'\.regressiontest\.//' | sed 's/\..*//')
info "detected product '${PRODUCT}'"
BRANCH=$(echo ${RESULTDIR} | sed 's/^'${WHEN}'\.regressiontest\.'${PRODUCT}'\.//')
info "detected branch '${BRANCH}'"


#find tests (use list from current)
unset TESTS
cd ${NFSBASEDIR}/${RUNHOST}/${RESULTDIR}
DIRS=$(ls -1d t_*)
for DIR in $DIRS
do
    [[ -d ${DIR} ]] && TESTS=(${TESTS[*]} ${DIR})
done
info "using tests: ${TESTS[*]}"


#find older results
unset RESULTS
left=${HISTORY}
cd ${NFSBASEDIR}/${RUNHOST}
DIRS=$(ls -1rd *.regressiontest.${PRODUCT}.${BRANCH})
for DIR in $DIRS
do
    if [[ ! ${DIR} -nt ${RESULTDIR} ]] && [[ ${left} -gt 0 ]]
    then
        RESULTS=(${DIR} ${RESULTS[*]})
        left=$((${left} - 1))
    fi
done
info "using history: ${RESULTS[*]}"


#set output dir
OUTDIR=${TARGETDIR}/${PRODUCT}-${BRANCH}
[[ -d ${OUTDIR} ]] || mkdir -p ${OUTDIR}
OUTFILE=${OUTDIR}/${WHEN}.pdf


#creating GNUPLOT file
gnuplot=$(mktemp)
info "creating GNUPLOT script in ${gnuplot}"

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

" >> $gnuplot

for i in $(seq ${HISTORY})
do
    echo "set style line $i linewidth 2" >> $gnuplot
done
echo >> $gnuplot

echo "set output '${OUTFILE}'" >> $gnuplot
echo >> $gnuplot

echo "do for [test in '${TESTS[*]}'] {
  set title sprintf('%s', test) font ',14'
  plot \\" >> $gnuplot

i=0
for RES in ${RESULTS[*]}
do
    i=$(($i + 1))
    commit=$(grep '^ABBRV_COMMIT:' ${RES}/commit_info.yaml | sed 's/^ABBRV_COMMIT: //')
    stamp=$(grep '^TIMESTAMP:' ${RES}/commit_info.yaml | sed 's/^TIMESTAMP: //')
    date=$(date --date=@${stamp} --utc '+%Y-%m-%d %H:%M:%S UTC')
    title="${commit}, ${date}"
    echo "    sprintf('${NFSBASEDIR}/${RUNHOST}/${RES}/%s/summary.log', test) using 2:4 with linespoints linestyle ${i} title '${title}',\\" >> $gnuplot
    echo "    '' index 0 using 2:4:1 with labels center offset 1.5, 0.5 notitle,\\" >> $gnuplot
done
echo >> $gnuplot
echo "}" >> $gnuplot

#creating plot
gnuplot ${gnuplot} && rm ${gnuplot}

