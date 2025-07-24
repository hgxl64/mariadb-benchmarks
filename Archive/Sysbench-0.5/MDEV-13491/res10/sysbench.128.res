sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 5813.70, reads: 0.00, writes: 58416.96, response time: 48.64ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 5856.57, reads: 0.00, writes: 58655.23, response time: 50.22ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 6056.51, reads: 0.00, writes: 60441.59, response time: 48.32ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 6102.50, reads: 0.00, writes: 61037.54, response time: 47.83ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 6411.50, reads: 0.00, writes: 64218.48, response time: 42.93ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 6304.00, reads: 0.00, writes: 63093.45, response time: 44.85ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 6186.51, reads: 0.00, writes: 61799.10, response time: 45.96ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6236.99, reads: 0.00, writes: 62299.93, response time: 45.62ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 6635.00, reads: 0.00, writes: 66442.03, response time: 40.15ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 6617.00, reads: 0.00, writes: 66163.45, response time: 40.18ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 6168.50, reads: 0.00, writes: 61560.51, response time: 46.34ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 6658.50, reads: 0.00, writes: 66704.04, response time: 39.88ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6437.00, reads: 0.00, writes: 64246.51, response time: 42.74ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 5986.99, reads: 0.00, writes: 60025.94, response time: 49.08ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 6394.50, reads: 0.00, writes: 64048.51, response time: 43.87ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 6467.42, reads: 0.00, writes: 64456.22, response time: 42.75ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 6170.08, reads: 0.00, writes: 61827.76, response time: 46.09ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 6473.00, reads: 0.00, writes: 64640.03, response time: 41.71ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6151.00, reads: 0.00, writes: 61577.48, response time: 46.25ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6286.00, reads: 0.00, writes: 62898.05, response time: 45.84ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 6452.46, reads: 0.00, writes: 64357.10, response time: 42.97ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 6295.54, reads: 0.00, writes: 62899.36, response time: 43.88ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 5959.51, reads: 0.00, writes: 59753.57, response time: 52.86ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 6133.99, reads: 0.00, writes: 61353.44, response time: 46.27ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 6118.48, reads: 0.00, writes: 61258.82, response time: 46.36ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3193640
        other:                           638728
        total:                           3832368
    transactions:                        319364 (6260.80 per sec.)
    read/write requests:                 3193640 (62608.00 per sec.)
    other operations:                    638728 (12521.60 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0101s
    total number of events:              319364
    total time taken by event execution: 6527.8824s
    response time:
         min:                                  1.25ms
         avg:                                 20.44ms
         max:                                207.87ms
         approx.  95 percentile:              44.86ms

Threads fairness:
    events (avg/stddev):           2495.0312/27.06
    execution time (avg/stddev):   50.9991/0.00

