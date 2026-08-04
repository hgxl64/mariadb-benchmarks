#!/usr/bin/gnuplot

reset
set terminal pdfcairo size 8, 8 font 'Arial,12' noenhanced

set xtics border nomirror
unset x2tics
set xrange [0:540]
set xlabel 'benchmark runtime [seconds]'

set ytics border nomirror
unset y2tics
set yrange [0:*]
set ylabel 'tps'
set grid ytics lc rgb '#a0a0a0' lw 1 lt 0

set key bottom left

set style line 1 linewidth 2
set style line 2 linewidth 2

set lmargin 10

#put label on each plot
set label "rtt=10ms" at graph 0.16, 0.55 center
set label "rtt=20ms" at graph 0.38, 0.55 center
set label "rtt=40ms" at graph 0.61, 0.55 center
set label "rtt=80ms" at graph 0.83, 0.55 center

set output sprintf("timeseries_cluster.100.pdf")

do for [workload in "5050_splittable 2080_splittable readwrite"] {

  set multiplot layout 3, 1 \
    title sprintf("3-node cluster, load applied to leader, workload: %s", workload) font ',16'

  do for [thd in "12 24 48"] {

    set title sprintf("%s threads", thd)
    plot sprintf("galera/summary.perf-453A.100/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 1 title "Galera",\
         sprintf("raft/summary.perf-453A.100/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 2 title "Raft"
  }

  unset multiplot

}


set output sprintf("timeseries_cluster.110.pdf")

do for [workload in "5050_splittable 2080_splittable readwrite"] {

  set multiplot layout 3, 1 \
    title sprintf("3-node cluster, load applied to leader + 1 near node, workload: %s", workload) font ',16'

  do for [thd in "24 48 96"] {

    set title sprintf("%s threads", thd)
    plot sprintf("galera/summary.perf-453A.110/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 1 title "Galera",\
         sprintf("raft/summary.perf-453A.110/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 2 title "Raft"
  }

  unset multiplot

}


set output sprintf("timeseries_cluster.full.pdf")

do for [workload in "5050_splittable 2080_splittable readwrite"] {

  set multiplot layout 3, 1 \
    title sprintf("3-node cluster, load applied to all 3 nodes, workload: %s", workload) font ',16'

  do for [thd in "36 72 144"] {

    set title sprintf("%s threads", thd)
    plot sprintf("galera/summary.perf-453A/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 1 title "Galera",\
         sprintf("raft/summary.perf-453A/%s.%s.interval.data", workload, thd) \
           using ($0*5):3 with lines linestyle 2 title "Raft"
  }

  unset multiplot

}

