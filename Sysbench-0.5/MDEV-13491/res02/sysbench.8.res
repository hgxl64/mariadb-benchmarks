sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 469.56, reads: 0.00, writes: 9413.17, response time: 19.26ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 452.00, reads: 0.00, writes: 9031.02, response time: 20.01ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 445.50, reads: 0.00, writes: 8908.50, response time: 20.54ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 433.50, reads: 0.00, writes: 8665.00, response time: 20.74ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 466.00, reads: 0.00, writes: 9333.51, response time: 19.28ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 454.99, reads: 0.00, writes: 9084.38, response time: 19.70ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 447.51, reads: 0.00, writes: 8954.62, response time: 20.22ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 465.99, reads: 0.00, writes: 9321.37, response time: 19.45ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 463.50, reads: 0.00, writes: 9280.06, response time: 20.02ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 432.50, reads: 0.00, writes: 8639.57, response time: 20.76ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 442.00, reads: 0.00, writes: 8840.00, response time: 20.22ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 431.50, reads: 0.00, writes: 8625.98, response time: 20.57ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 445.50, reads: 0.00, writes: 8921.00, response time: 19.92ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 461.50, reads: 0.00, writes: 9234.01, response time: 19.44ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 435.50, reads: 0.00, writes: 8706.99, response time: 20.14ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 437.49, reads: 0.00, writes: 8743.88, response time: 20.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 441.51, reads: 0.00, writes: 8830.12, response time: 20.19ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 444.00, reads: 0.00, writes: 8874.02, response time: 20.15ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 446.00, reads: 0.00, writes: 8933.98, response time: 20.04ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 451.00, reads: 0.00, writes: 9017.99, response time: 19.84ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 459.50, reads: 0.00, writes: 9187.01, response time: 19.77ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 434.99, reads: 0.00, writes: 8704.87, response time: 20.58ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 443.01, reads: 0.00, writes: 8862.11, response time: 20.19ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 435.50, reads: 0.00, writes: 8707.00, response time: 20.25ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 432.50, reads: 0.00, writes: 8642.53, response time: 20.24ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           455740
        other:                           45574
        total:                           501314
    transactions:                        22787  (446.66 per sec.)
    read/write requests:                 455740 (8933.22 per sec.)
    other operations:                    45574  (893.32 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0163s
    total number of events:              22787
    total time taken by event execution: 408.0026s
    response time:
         min:                                  3.77ms
         avg:                                 17.91ms
         max:                                 29.94ms
         approx.  95 percentile:              20.15ms

Threads fairness:
    events (avg/stddev):           2848.3750/1.11
    execution time (avg/stddev):   51.0003/0.01

