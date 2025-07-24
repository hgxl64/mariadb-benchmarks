sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 363.58, reads: 0.00, writes: 3640.76, response time: 3.91ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 373.51, reads: 0.00, writes: 3735.08, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 381.50, reads: 0.00, writes: 3814.98, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 385.50, reads: 0.00, writes: 3854.96, response time: 3.64ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 371.51, reads: 0.00, writes: 3715.05, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 376.50, reads: 0.00, writes: 3762.00, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 375.50, reads: 0.00, writes: 3758.00, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 366.50, reads: 0.00, writes: 3665.00, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 356.00, reads: 0.00, writes: 3560.00, response time: 4.03ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 371.00, reads: 0.00, writes: 3707.54, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 371.00, reads: 0.00, writes: 3712.48, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 362.99, reads: 0.00, writes: 3626.94, response time: 3.89ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 362.00, reads: 0.00, writes: 3623.05, response time: 4.02ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 353.00, reads: 0.00, writes: 3530.04, response time: 3.97ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 366.50, reads: 0.00, writes: 3660.00, response time: 3.92ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 358.00, reads: 0.00, writes: 3582.95, response time: 3.89ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 368.00, reads: 0.00, writes: 3682.01, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 364.00, reads: 0.00, writes: 3639.99, response time: 3.93ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 365.00, reads: 0.00, writes: 3649.99, response time: 3.91ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 364.00, reads: 0.00, writes: 3638.96, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 366.50, reads: 0.00, writes: 3665.05, response time: 3.92ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 359.00, reads: 0.00, writes: 3591.00, response time: 4.02ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 370.50, reads: 0.00, writes: 3704.00, response time: 3.93ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 368.00, reads: 0.00, writes: 3675.98, response time: 3.99ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 379.50, reads: 0.00, writes: 3796.02, response time: 3.79ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           187660
        other:                           37532
        total:                           225192
    transactions:                        18766  (367.94 per sec.)
    read/write requests:                 187660 (3679.44 per sec.)
    other operations:                    37532  (735.89 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0023s
    total number of events:              18766
    total time taken by event execution: 50.9749s
    response time:
         min:                                  0.89ms
         avg:                                  2.72ms
         max:                                 12.69ms
         approx.  95 percentile:               3.86ms

Threads fairness:
    events (avg/stddev):           18766.0000/0.00
    execution time (avg/stddev):   50.9749/0.00

