sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3424.72, reads: 0.00, writes: 34327.23, response time: 7.02ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3490.52, reads: 0.00, writes: 34852.16, response time: 6.75ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3430.01, reads: 0.00, writes: 34298.07, response time: 7.06ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3431.99, reads: 0.00, writes: 34370.41, response time: 7.15ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3495.51, reads: 0.00, writes: 34959.59, response time: 6.83ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3625.00, reads: 0.00, writes: 36200.48, response time: 6.65ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3519.00, reads: 0.00, writes: 35234.99, response time: 6.88ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3388.50, reads: 0.00, writes: 33872.46, response time: 7.06ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3572.01, reads: 0.00, writes: 35737.12, response time: 6.97ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3552.49, reads: 0.00, writes: 35524.95, response time: 6.87ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3394.50, reads: 0.00, writes: 33931.52, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3506.00, reads: 0.00, writes: 35015.96, response time: 6.96ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3517.99, reads: 0.00, writes: 35232.89, response time: 7.07ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3358.01, reads: 0.00, writes: 33584.12, response time: 7.37ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3463.50, reads: 0.00, writes: 34589.99, response time: 7.13ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3426.50, reads: 0.00, writes: 34310.48, response time: 6.83ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3564.50, reads: 0.00, writes: 35620.47, response time: 6.72ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3394.50, reads: 0.00, writes: 33965.99, response time: 7.21ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3617.50, reads: 0.00, writes: 36148.55, response time: 6.61ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3672.49, reads: 0.00, writes: 36733.94, response time: 6.83ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3510.51, reads: 0.00, writes: 35126.07, response time: 7.02ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3652.50, reads: 0.00, writes: 36516.50, response time: 6.80ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3628.50, reads: 0.00, writes: 36293.53, response time: 6.66ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3669.49, reads: 0.00, writes: 36690.94, response time: 6.55ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3514.50, reads: 0.00, writes: 35087.00, response time: 6.75ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1793000
        other:                           358600
        total:                           2151600
    transactions:                        179300 (3515.55 per sec.)
    read/write requests:                 1793000 (35155.45 per sec.)
    other operations:                    358600 (7031.09 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0020s
    total number of events:              179300
    total time taken by event execution: 815.6002s
    response time:
         min:                                  0.91ms
         avg:                                  4.55ms
         max:                                 49.49ms
         approx.  95 percentile:               6.91ms

Threads fairness:
    events (avg/stddev):           11206.2500/43.75
    execution time (avg/stddev):   50.9750/0.00

