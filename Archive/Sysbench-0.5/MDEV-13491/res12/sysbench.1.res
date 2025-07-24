sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 372.09, reads: 0.00, writes: 3725.85, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 370.50, reads: 0.00, writes: 3704.97, response time: 3.79ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 390.00, reads: 0.00, writes: 3899.99, response time: 3.67ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 381.50, reads: 0.00, writes: 3815.00, response time: 3.67ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 378.00, reads: 0.00, writes: 3776.00, response time: 3.76ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 390.00, reads: 0.00, writes: 3903.01, response time: 3.66ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 381.00, reads: 0.00, writes: 3811.00, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 371.00, reads: 0.00, writes: 3710.00, response time: 3.76ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 376.50, reads: 0.00, writes: 3760.00, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 368.00, reads: 0.00, writes: 3683.00, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 364.00, reads: 0.00, writes: 3642.00, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 359.50, reads: 0.00, writes: 3595.00, response time: 3.98ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 363.00, reads: 0.00, writes: 3629.99, response time: 3.98ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 366.50, reads: 0.00, writes: 3661.01, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 366.00, reads: 0.00, writes: 3663.99, response time: 3.88ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 366.50, reads: 0.00, writes: 3664.98, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 381.00, reads: 0.00, writes: 3809.99, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 375.00, reads: 0.00, writes: 3748.53, response time: 3.81ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 376.00, reads: 0.00, writes: 3761.49, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 365.50, reads: 0.00, writes: 3655.03, response time: 3.99ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 358.50, reads: 0.00, writes: 3585.00, response time: 3.89ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 370.50, reads: 0.00, writes: 3704.98, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 376.00, reads: 0.00, writes: 3755.04, response time: 3.80ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 379.49, reads: 0.00, writes: 3799.94, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 383.00, reads: 0.00, writes: 3830.00, response time: 3.73ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           190410
        other:                           38082
        total:                           228492
    transactions:                        19041  (373.34 per sec.)
    read/write requests:                 190410 (3733.43 per sec.)
    other operations:                    38082  (746.69 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0014s
    total number of events:              19041
    total time taken by event execution: 50.9715s
    response time:
         min:                                  0.92ms
         avg:                                  2.68ms
         max:                                 17.61ms
         approx.  95 percentile:               3.80ms

Threads fairness:
    events (avg/stddev):           19041.0000/0.00
    execution time (avg/stddev):   50.9715/0.00

