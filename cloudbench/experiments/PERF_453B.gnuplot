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

set style line 1 linewidth 2
set style line 2 linewidth 2
set style line 3 linewidth 2
set key left top


set output 'PERF-453B.pdf'

set title 'OLTP read/write, 3 nodes, loading one node' font ',14'
plot \
'perf-453.100.galera.oltp_read_write.test.data' using 2:3 with linespoints linestyle 1 pt 6 title 'Galera, leader',\
'perf-453.010.galera.oltp_read_write.test.data' using 2:3 with linespoints linestyle 1 pt 7 title 'Galera, follower',\
'perf-453.100.raft.oltp_read_write.test.data' using 2:3 with linespoints linestyle 2 pt 6 title 'Raft, leader',\
'perf-453.010.raft.oltp_read_write.test.data' using 2:3 with linespoints linestyle 2 pt 7 title 'Raft, follower',\


set title 'OLTP write-only, 3 nodes, loading one node' font ',14'
plot \
'perf-453.100.galera.oltp_write_only.test.data' using 2:3 with linespoints linestyle 1 pt 6 title 'Galera, leader',\
'perf-453.010.galera.oltp_write_only.test.data' using 2:3 with linespoints linestyle 1 pt 7 title 'Galera, follower',\
'perf-453.100.raft.oltp_write_only.test.data' using 2:3 with linespoints linestyle 2 pt 6 title 'Raft, leader',\
'perf-453.010.raft.oltp_write_only.test.data' using 2:3 with linespoints linestyle 2 pt 7 title 'Raft, follower',\


set title 'OLTP update indexed, 3 nodes, loading one node' font ',14'
plot \
'perf-453.100.galera.oltp_oltp_update_index2.test.data' using 2:3 with linespoints linestyle 1 pt 6 title 'Galera, leader',\
'perf-453.010.galera.oltp_oltp_update_index2.test.data' using 2:3 with linespoints linestyle 1 pt 7 title 'Galera, follower',\
'perf-453.100.raft.oltp_oltp_update_index2.test.data' using 2:3 with linespoints linestyle 2 pt 6 title 'Raft, leader',\
'perf-453.010.raft.oltp_oltp_update_index2.test.data' using 2:3 with linespoints linestyle 2 pt 7 title 'Raft, follower',\

