#!/usr/bin/gnuplot

reset

set terminal pdfcairo size 8, 5 font 'Arial,12'

set xrange [0:*]
set xtics border nomirror
unset x2tics
set xlabel 'Throughput [tps]'

set logscale y 2
set ytics border nomirror
unset y2tics
set ylabel 'Latency [ms]'

set style line 1 linewidth 2 pt 6
set style line 2 linewidth 2 pt 6
set style line 3 linewidth 2 pt 6
set key left top


set output 'PERF-542.pdf'

set title 'OLTP read/write' font ',14'
plot \
'ASYNC.oltp_read_write.test.data' using 2:3 with linespoints linestyle 1 title 'async repl',\
'SYNC.oltp_read_write.test.data' using 2:3 with linespoints linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_read_write.test.data' using 2:3 with linespoints linestyle 3 title 'semisync wt=commit',\


set title 'OLTP write-only' font ',14'
plot \
'ASYNC.oltp_write_only.test.data' using 2:3 with linespoints linestyle 1 title 'async repl',\
'SYNC.oltp_write_only.test.data' using 2:3 with linespoints linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_write_only.test.data' using 2:3 with linespoints linestyle 3 title 'semisync wt=commit',\


set title 'OLTP update indexed' font ',14'
plot \
'ASYNC.oltp_update_index2.test.data' using 2:3 with linespoints linestyle 1 title 'async repl',\
'SYNC.oltp_update_index2.test.data' using 2:3 with linespoints linestyle 2 title 'semisync wt=sync',\
'COMMIT.oltp_update_index2.test.data' using 2:3 with linespoints linestyle 3 title 'semisync wt=commit',\

