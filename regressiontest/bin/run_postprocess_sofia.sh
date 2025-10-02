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
debug "detected timespec '${WHEN}'"
PRODUCT=$(echo ${RESULTDIR} | sed 's/^'${WHEN}'\.regressiontest\.//' | sed 's/\..*//')
debug "detected product '${PRODUCT}'"
BRANCH=$(echo ${RESULTDIR} | sed 's/^'${WHEN}'\.regressiontest\.'${PRODUCT}'\.//' | perl -ne '($a,$b)=split /\./; print "$a.$b"')
debug "detected branch '${BRANCH}'"

#find tests (use list from current)
unset TESTS
cd ${NFSBASEDIR}/${RUNHOST}/${RESULTDIR}
DIRS=$(ls -1d t_*)
for DIR in $DIRS
do
    [[ -d ${DIR} ]] && TESTS=(${TESTS[*]} ${DIR})
done
debug "using tests: ${TESTS[*]}"


#find older results
unset RESULTS
left=${HISTORY}
cd ${NFSBASEDIR}/${RUNHOST}
DIRS=$(ls -1rd *.regressiontest.${PRODUCT}.${BRANCH}*)
for DIR in $DIRS
do
    if [[ ! ${DIR} -nt ${RESULTDIR} ]] && [[ ${left} -gt 0 ]]
    then
        RESULTS=(${DIR} ${RESULTS[*]})
        left=$((${left} - 1))
    fi
done
debug "using history: ${RESULTS[*]}"


#set output dir
OUTDIR=${TARGETDIR}/${PRODUCT}-${BRANCH}
[[ ${RUNHOST} = "cheetah01" ]] && OUTDIR=${TARGETDIR}/${PRODUCT}-${BRANCH}-${RUNHOST}
[[ -d ${OUTDIR} ]] || mkdir -p ${OUTDIR}
OUTFILE=${OUTDIR}/${WHEN}.pdf


info $(date --utc "+%F %T create plot of last ${#RESULTS[*]} runs for product ${PRODUCT} branch ${BRANCH}")


#creating GNUPLOT file
plotfile=$(mktemp)
debug "creating GNUPLOT script in ${plotfile}"

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

" >> $plotfile

for i in $(seq ${HISTORY})
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
    title="${commit}, ${date}"
    echo "    sprintf('${NFSBASEDIR}/${RUNHOST}/${RES}/%s/summary.log', test) using 2:4 with linespoints linestyle ${i} title '${title}',\\" >> $plotfile
    echo "    '' index 0 using 2:4:1 with labels center offset 1.5, 0.5 notitle,\\" >> $plotfile
done
echo >> $plotfile
echo "}" >> $plotfile

#creating plot
gnuplot ${plotfile} && rm ${plotfile}

#
# zip resultdir for xfer
#
info $(date --utc "+%F %T zipping ${NFSBASEDIR}/${RUNHOST}/${RESULTDIR} to ${XFERDIR}/${RUNHOST}/${RESULTDIR}.zip")
cd ${NFSBASEDIR}/${RUNHOST}
zip -9rq ${XFERDIR}/${RUNHOST}/${RESULTDIR}.zip ${RESULTDIR}
unzip -tq ${XFERDIR}/${RUNHOST}/${RESULTDIR}.zip


