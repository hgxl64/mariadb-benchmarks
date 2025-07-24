sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 383.58, reads: 0.00, writes: 3840.84, response time: 3.79ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 391.50, reads: 0.00, writes: 3915.02, response time: 3.61ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 383.50, reads: 0.00, writes: 3834.00, response time: 3.73ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 394.00, reads: 0.00, writes: 3937.50, response time: 3.59ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 381.50, reads: 0.00, writes: 3818.50, response time: 3.75ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 385.50, reads: 0.00, writes: 3855.04, response time: 3.67ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 382.00, reads: 0.00, writes: 3819.99, response time: 3.79ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 375.50, reads: 0.00, writes: 3754.96, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 365.50, reads: 0.00, writes: 3655.00, response time: 3.98ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 358.50, reads: 0.00, writes: 3580.50, response time: 3.90ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 370.00, reads: 0.00, writes: 3704.50, response time: 3.88ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 371.01, reads: 0.00, writes: 3710.05, response time: 3.92ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 371.00, reads: 0.00, writes: 3710.00, response time: 3.80ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 369.50, reads: 0.00, writes: 3693.50, response time: 3.95ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 377.50, reads: 0.00, writes: 3776.50, response time: 3.72ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 371.50, reads: 0.00, writes: 3715.00, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 374.00, reads: 0.00, writes: 3740.00, response time: 3.76ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 364.99, reads: 0.00, writes: 3649.95, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 388.00, reads: 0.00, writes: 3877.50, response time: 3.76ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 374.00, reads: 0.00, writes: 3742.50, response time: 3.69ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 374.00, reads: 0.00, writes: 3737.50, response time: 3.77ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 382.00, reads: 0.00, writes: 3822.49, response time: 3.79ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 373.00, reads: 0.00, writes: 3730.00, response time: 3.73ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 397.00, reads: 0.00, writes: 3970.02, response time: 3.67ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 406.00, reads: 0.00, writes: 4054.97, response time: 3.51ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           193290
        other:                           38658
        total:                           231948
    transactions:                        19329  (378.99 per sec.)
    read/write requests:                 193290 (3789.88 per sec.)
    other operations:                    38658  (757.98 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0016s
    total number of events:              19329
    total time taken by event execution: 50.9742s
    response time:
         min:                                  0.89ms
         avg:                                  2.64ms
         max:                                 12.38ms
         approx.  95 percentile:               3.78ms

Threads fairness:
    events (avg/stddev):           19329.0000/0.00
    execution time (avg/stddev):   50.9742/0.00

