sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3375.25, reads: 0.00, writes: 33810.52, response time: 6.87ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3590.49, reads: 0.00, writes: 35924.94, response time: 6.70ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3457.01, reads: 0.00, writes: 34572.08, response time: 6.76ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3481.00, reads: 0.00, writes: 34744.96, response time: 7.02ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3431.50, reads: 0.00, writes: 34337.55, response time: 6.95ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3581.50, reads: 0.00, writes: 35813.51, response time: 6.72ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3632.00, reads: 0.00, writes: 36333.50, response time: 6.66ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3450.00, reads: 0.00, writes: 34525.47, response time: 6.86ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3578.50, reads: 0.00, writes: 35786.01, response time: 6.51ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3460.49, reads: 0.00, writes: 34558.94, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3487.51, reads: 0.00, writes: 34880.10, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3403.00, reads: 0.00, writes: 34021.45, response time: 6.92ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3539.00, reads: 0.00, writes: 35443.47, response time: 6.60ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3515.00, reads: 0.00, writes: 35126.53, response time: 6.76ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3556.00, reads: 0.00, writes: 35580.03, response time: 6.66ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3512.00, reads: 0.00, writes: 35084.97, response time: 6.72ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3426.50, reads: 0.00, writes: 34237.51, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3430.99, reads: 0.00, writes: 34375.94, response time: 7.11ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3360.01, reads: 0.00, writes: 33585.56, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3629.00, reads: 0.00, writes: 36273.00, response time: 6.85ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3559.00, reads: 0.00, writes: 35593.97, response time: 6.74ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3477.00, reads: 0.00, writes: 34795.04, response time: 7.03ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3679.99, reads: 0.00, writes: 36753.39, response time: 6.51ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3646.01, reads: 0.00, writes: 36468.07, response time: 6.66ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3626.01, reads: 0.00, writes: 36301.07, response time: 6.69ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1794200
        other:                           358840
        total:                           2153040
    transactions:                        179420 (3517.80 per sec.)
    read/write requests:                 1794200 (35177.96 per sec.)
    other operations:                    358840 (7035.59 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0035s
    total number of events:              179420
    total time taken by event execution: 815.6156s
    response time:
         min:                                  0.91ms
         avg:                                  4.55ms
         max:                                 48.90ms
         approx.  95 percentile:               6.79ms

Threads fairness:
    events (avg/stddev):           11213.7500/41.07
    execution time (avg/stddev):   50.9760/0.00

