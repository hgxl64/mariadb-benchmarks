sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 269.07, reads: 0.00, writes: 2695.67, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 279.50, reads: 0.00, writes: 2792.50, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 289.50, reads: 0.00, writes: 2897.55, response time: 4.77ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 290.50, reads: 0.00, writes: 2904.97, response time: 4.81ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 288.00, reads: 0.00, writes: 2880.04, response time: 4.78ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 285.00, reads: 0.00, writes: 2847.96, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 275.00, reads: 0.00, writes: 2748.03, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 266.50, reads: 0.00, writes: 2668.97, response time: 4.98ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 271.00, reads: 0.00, writes: 2705.03, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 273.50, reads: 0.00, writes: 2735.96, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 264.00, reads: 0.00, writes: 2641.04, response time: 5.22ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 273.00, reads: 0.00, writes: 2727.96, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 276.51, reads: 0.00, writes: 2769.58, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 274.99, reads: 0.00, writes: 2750.42, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 269.00, reads: 0.00, writes: 2690.03, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 292.00, reads: 0.00, writes: 2915.97, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 269.00, reads: 0.00, writes: 2691.53, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 282.50, reads: 0.00, writes: 2825.96, response time: 4.91ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 283.50, reads: 0.00, writes: 2831.54, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 282.50, reads: 0.00, writes: 2828.97, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 267.00, reads: 0.00, writes: 2671.02, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 282.00, reads: 0.00, writes: 2815.47, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 283.00, reads: 0.00, writes: 2830.54, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 283.50, reads: 0.00, writes: 2838.97, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 276.00, reads: 0.00, writes: 2759.01, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           141670
        other:                           28334
        total:                           170004
    transactions:                        14167  (277.78 per sec.)
    read/write requests:                 141670 (2777.77 per sec.)
    other operations:                    28334  (555.55 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0014s
    total number of events:              14167
    total time taken by event execution: 50.9737s
    response time:
         min:                                  1.60ms
         avg:                                  3.60ms
         max:                                 25.04ms
         approx.  95 percentile:               4.93ms

Threads fairness:
    events (avg/stddev):           14167.0000/0.00
    execution time (avg/stddev):   50.9737/0.00

