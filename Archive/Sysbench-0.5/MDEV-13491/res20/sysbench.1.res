sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 383.10, reads: 0.00, writes: 3835.97, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 390.00, reads: 0.00, writes: 3900.02, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 379.51, reads: 0.00, writes: 3791.05, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 395.49, reads: 0.00, writes: 3953.94, response time: 3.70ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 392.00, reads: 0.00, writes: 3924.99, response time: 3.56ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 389.50, reads: 0.00, writes: 3890.00, response time: 3.66ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 395.50, reads: 0.00, writes: 3960.00, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 397.50, reads: 0.00, writes: 3973.00, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 375.00, reads: 0.00, writes: 3752.00, response time: 3.97ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 383.50, reads: 0.00, writes: 3834.00, response time: 3.84ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 366.01, reads: 0.00, writes: 3661.06, response time: 3.92ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 369.49, reads: 0.00, writes: 3692.44, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 386.00, reads: 0.00, writes: 3860.49, response time: 3.91ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 387.00, reads: 0.00, writes: 3872.02, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 377.51, reads: 0.00, writes: 3771.06, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 371.99, reads: 0.00, writes: 3723.94, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 381.50, reads: 0.00, writes: 3815.00, response time: 3.92ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 374.50, reads: 0.00, writes: 3745.00, response time: 3.93ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 362.50, reads: 0.00, writes: 3623.00, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 387.50, reads: 0.00, writes: 3876.99, response time: 3.76ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 362.50, reads: 0.00, writes: 3624.99, response time: 3.99ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 376.50, reads: 0.00, writes: 3760.51, response time: 3.68ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 387.50, reads: 0.00, writes: 3878.50, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 385.00, reads: 0.00, writes: 3846.00, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 380.50, reads: 0.00, writes: 3810.00, response time: 3.69ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           194470
        other:                           38894
        total:                           233364
    transactions:                        19447  (381.31 per sec.)
    read/write requests:                 194470 (3813.05 per sec.)
    other operations:                    38894  (762.61 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0011s
    total number of events:              19447
    total time taken by event execution: 50.9739s
    response time:
         min:                                  0.89ms
         avg:                                  2.62ms
         max:                                 12.46ms
         approx.  95 percentile:               3.80ms

Threads fairness:
    events (avg/stddev):           19447.0000/0.00
    execution time (avg/stddev):   50.9739/0.00

