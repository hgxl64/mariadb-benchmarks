#!/usr/bin/gnuplot

reset

set terminal pdfcairo size 8, 5 font 'Arial,12'

set xrange [0:*]
set xtics border nomirror
unset x2tics
set xlabel 'Seconds'

set yrange [0:*]
set ytics border nomirror
unset y2tics
set ylabel 'Transactions'

set style line 1 linewidth 2 
set style line 2 linewidth 2 
set style line 3 linewidth 2 
set key left top


set output 'PERF-542-lag.pdf'

set title 'OLTP read/write (Master only), Slave lag' font ',14'
plot \
'ASYNC.oltp_read_write.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.oltp_read_write.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_read_write.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\


set title 'OLTP write-only (Master only), Slave lag' font ',14'
plot \
'ASYNC.oltp_write_only.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.oltp_write_only.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_write_only.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\


set title 'OLTP update indexed (Master only), Slave lag' font ',14'
plot \
'ASYNC.oltp_update_index2.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.oltp_update_index2.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_update_index2.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\


set title 'OLTP read/write 10% writes (through MaxScale), Slave lag' font ',14'
plot \
'ASYNC.9010_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.9010_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.9010_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\


set title 'OLTP read/write 25% writes (through MaxScale), Slave lag' font ',14'
plot \
'ASYNC.7525_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.7525_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.7525_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\


set title 'OLTP read/write 50% writes (through MaxScale), Slave lag' font ',14'
plot \
'ASYNC.5050_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 1 title 'async repl',\
'SYNC.5050_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 2 title 'semisync wt=sync',\
'COMMIT.5050_splittable.lag.data' using ($0*10):($2-$3) with lines linestyle 3 title 'semisync wt=commit',\

