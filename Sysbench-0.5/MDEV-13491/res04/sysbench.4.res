sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 783.70, reads: 0.00, writes: 15710.07, response time: 7.19ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 785.00, reads: 0.00, writes: 15671.08, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 839.50, reads: 0.00, writes: 16792.49, response time: 7.20ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 824.99, reads: 0.00, writes: 16526.81, response time: 7.24ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 802.01, reads: 0.00, writes: 16036.17, response time: 7.43ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 813.50, reads: 0.00, writes: 16277.47, response time: 7.27ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 799.99, reads: 0.00, writes: 15993.77, response time: 7.27ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 764.51, reads: 0.00, writes: 15287.64, response time: 7.54ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 808.01, reads: 0.00, writes: 16151.11, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 795.50, reads: 0.00, writes: 15927.49, response time: 7.17ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 779.00, reads: 0.00, writes: 15570.02, response time: 7.49ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 795.50, reads: 0.00, writes: 15911.49, response time: 7.37ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 765.99, reads: 0.00, writes: 15326.35, response time: 7.63ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 783.51, reads: 0.00, writes: 15660.64, response time: 7.38ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 813.50, reads: 0.00, writes: 16275.47, response time: 7.24ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 803.00, reads: 0.00, writes: 16062.52, response time: 7.21ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 769.00, reads: 0.00, writes: 15372.52, response time: 8.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 780.00, reads: 0.00, writes: 15600.99, response time: 7.74ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 801.00, reads: 0.00, writes: 16026.51, response time: 7.25ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 784.50, reads: 0.00, writes: 15686.49, response time: 7.94ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 785.50, reads: 0.00, writes: 15701.52, response time: 7.46ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 791.50, reads: 0.00, writes: 15818.97, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 799.50, reads: 0.00, writes: 16016.51, response time: 7.19ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 828.00, reads: 0.00, writes: 16547.99, response time: 7.23ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 805.50, reads: 0.00, writes: 16118.52, response time: 7.31ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           812440
        other:                           81244
        total:                           893684
    transactions:                        40622  (796.48 per sec.)
    read/write requests:                 812440 (15929.55 per sec.)
    other operations:                    81244  (1592.96 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0021s
    total number of events:              40622
    total time taken by event execution: 203.9159s
    response time:
         min:                                  1.60ms
         avg:                                  5.02ms
         max:                                 20.87ms
         approx.  95 percentile:               7.36ms

Threads fairness:
    events (avg/stddev):           10155.5000/8.62
    execution time (avg/stddev):   50.9790/0.00

