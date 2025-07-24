sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 381.09, reads: 0.00, writes: 3815.92, response time: 3.70ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 381.50, reads: 0.00, writes: 3815.01, response time: 3.72ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 386.50, reads: 0.00, writes: 3865.02, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 374.50, reads: 0.00, writes: 3744.98, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 381.50, reads: 0.00, writes: 3815.00, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 385.00, reads: 0.00, writes: 3850.02, response time: 3.72ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 386.00, reads: 0.00, writes: 3860.03, response time: 3.73ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 386.50, reads: 0.00, writes: 3864.96, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 372.50, reads: 0.00, writes: 3722.50, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 377.00, reads: 0.00, writes: 3772.50, response time: 4.03ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 361.00, reads: 0.00, writes: 3610.00, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 378.50, reads: 0.00, writes: 3784.03, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 365.50, reads: 0.00, writes: 3655.96, response time: 4.03ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 369.00, reads: 0.00, writes: 3690.04, response time: 4.04ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 358.00, reads: 0.00, writes: 3580.00, response time: 4.07ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 381.00, reads: 0.00, writes: 3805.47, response time: 3.97ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 364.50, reads: 0.00, writes: 3646.03, response time: 3.90ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 378.50, reads: 0.00, writes: 3788.50, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 374.50, reads: 0.00, writes: 3742.50, response time: 3.83ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 370.50, reads: 0.00, writes: 3707.50, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 361.50, reads: 0.00, writes: 3611.00, response time: 4.26ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 365.50, reads: 0.00, writes: 3659.00, response time: 3.91ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 377.50, reads: 0.00, writes: 3775.00, response time: 3.93ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 372.00, reads: 0.00, writes: 3720.00, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 389.49, reads: 0.00, writes: 3894.95, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           191320
        other:                           38264
        total:                           229584
    transactions:                        19132  (375.13 per sec.)
    read/write requests:                 191320 (3751.25 per sec.)
    other operations:                    38264  (750.25 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0017s
    total number of events:              19132
    total time taken by event execution: 50.9750s
    response time:
         min:                                  0.85ms
         avg:                                  2.66ms
         max:                                 15.62ms
         approx.  95 percentile:               3.85ms

Threads fairness:
    events (avg/stddev):           19132.0000/0.00
    execution time (avg/stddev):   50.9750/0.00

