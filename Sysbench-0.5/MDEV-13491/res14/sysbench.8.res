sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1892.82, reads: 0.00, writes: 18952.73, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1879.50, reads: 0.00, writes: 18785.55, response time: 6.30ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1895.00, reads: 0.00, writes: 18970.03, response time: 6.63ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1853.00, reads: 0.00, writes: 18535.02, response time: 6.59ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1932.00, reads: 0.00, writes: 19305.97, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1922.50, reads: 0.00, writes: 19239.02, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1925.50, reads: 0.00, writes: 19250.49, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1856.00, reads: 0.00, writes: 18563.95, response time: 6.60ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1866.50, reads: 0.00, writes: 18642.04, response time: 6.54ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1902.00, reads: 0.00, writes: 19043.47, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1917.00, reads: 0.00, writes: 19170.04, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1923.50, reads: 0.00, writes: 19217.47, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1948.50, reads: 0.00, writes: 19502.52, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1876.00, reads: 0.00, writes: 18759.99, response time: 6.45ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1896.50, reads: 0.00, writes: 18964.04, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1853.00, reads: 0.00, writes: 18530.97, response time: 6.39ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1955.50, reads: 0.00, writes: 19554.99, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1913.00, reads: 0.00, writes: 19108.97, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1949.00, reads: 0.00, writes: 19492.52, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1897.00, reads: 0.00, writes: 18955.01, response time: 6.32ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1970.50, reads: 0.00, writes: 19738.49, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1861.00, reads: 0.00, writes: 18584.99, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1885.00, reads: 0.00, writes: 18872.04, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1949.00, reads: 0.00, writes: 19484.96, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1898.50, reads: 0.00, writes: 18991.51, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           971840
        other:                           194368
        total:                           1166208
    transactions:                        97184  (1905.51 per sec.)
    read/write requests:                 971840 (19055.07 per sec.)
    other operations:                    194368 (3811.01 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0016s
    total number of events:              97184
    total time taken by event execution: 407.7647s
    response time:
         min:                                  1.06ms
         avg:                                  4.20ms
         max:                                 30.21ms
         approx.  95 percentile:               6.24ms

Threads fairness:
    events (avg/stddev):           12148.0000/19.49
    execution time (avg/stddev):   50.9706/0.00

