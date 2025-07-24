sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5769.31, reads: 0.00, writes: 57853.11, response time: 8.46ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6248.01, reads: 0.00, writes: 62363.13, response time: 7.94ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 6267.00, reads: 0.00, writes: 62708.02, response time: 7.72ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6331.00, reads: 0.00, writes: 63354.45, response time: 7.49ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6058.50, reads: 0.00, writes: 60592.99, response time: 7.92ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6052.50, reads: 0.00, writes: 60551.50, response time: 8.34ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 5972.99, reads: 0.00, writes: 59645.37, response time: 8.24ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6166.02, reads: 0.00, writes: 61669.67, response time: 7.62ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 5954.00, reads: 0.00, writes: 59615.02, response time: 8.31ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 5951.00, reads: 0.00, writes: 59434.47, response time: 8.44ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5826.51, reads: 0.00, writes: 58337.56, response time: 8.50ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5844.00, reads: 0.00, writes: 58442.98, response time: 8.23ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 5838.48, reads: 0.00, writes: 58289.82, response time: 8.39ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6151.52, reads: 0.00, writes: 61607.67, response time: 7.91ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 6270.50, reads: 0.00, writes: 62653.48, response time: 7.71ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 5697.00, reads: 0.00, writes: 56954.03, response time: 8.47ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 5734.45, reads: 0.00, writes: 57314.51, response time: 8.82ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 5842.05, reads: 0.00, writes: 58473.95, response time: 8.48ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5775.01, reads: 0.00, writes: 57796.57, response time: 8.38ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 6074.49, reads: 0.00, writes: 60683.45, response time: 7.89ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5891.00, reads: 0.00, writes: 58966.52, response time: 8.27ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 5969.50, reads: 0.00, writes: 59599.48, response time: 8.24ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 6071.00, reads: 0.00, writes: 60801.02, response time: 7.92ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5829.50, reads: 0.00, writes: 58304.48, response time: 8.76ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5824.00, reads: 0.00, writes: 58132.53, response time: 8.47ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3046680
        other:                           609336
        total:                           3656016
    transactions:                        304668 (5973.19 per sec.)
    read/write requests:                 3046680 (59731.87 per sec.)
    other operations:                    609336 (11946.37 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0059s
    total number of events:              304668
    total time taken by event execution: 1631.6984s
    response time:
         min:                                  0.75ms
         avg:                                  5.36ms
         max:                                 44.99ms
         approx.  95 percentile:               8.19ms

Threads fairness:
    events (avg/stddev):           9520.8750/37.48
    execution time (avg/stddev):   50.9906/0.00

