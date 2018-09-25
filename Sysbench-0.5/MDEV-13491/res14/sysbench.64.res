sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6212.19, reads: 0.00, writes: 62331.42, response time: 19.24ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6463.09, reads: 0.00, writes: 64725.39, response time: 18.34ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 6509.49, reads: 0.00, writes: 64929.44, response time: 18.65ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 6340.50, reads: 0.00, writes: 63359.03, response time: 19.32ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 6079.00, reads: 0.00, writes: 60914.47, response time: 21.21ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6304.50, reads: 0.00, writes: 63067.52, response time: 18.85ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6202.00, reads: 0.00, writes: 62029.04, response time: 20.36ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 6577.99, reads: 0.00, writes: 65716.45, response time: 17.93ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6239.99, reads: 0.00, writes: 62380.45, response time: 19.97ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 6002.50, reads: 0.00, writes: 59982.00, response time: 21.27ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 6181.01, reads: 0.00, writes: 61844.07, response time: 20.96ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6331.00, reads: 0.00, writes: 63366.95, response time: 19.51ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 6342.50, reads: 0.00, writes: 63472.03, response time: 20.00ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 6339.50, reads: 0.00, writes: 63291.02, response time: 18.94ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6331.49, reads: 0.00, writes: 63285.41, response time: 19.58ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6110.50, reads: 0.00, writes: 61122.49, response time: 20.95ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6139.50, reads: 0.00, writes: 61529.05, response time: 21.02ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6296.00, reads: 0.00, writes: 62886.48, response time: 20.51ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6395.99, reads: 0.00, writes: 63918.42, response time: 19.48ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6387.51, reads: 0.00, writes: 63838.63, response time: 19.30ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 5926.50, reads: 0.00, writes: 59399.51, response time: 22.25ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6271.99, reads: 0.00, writes: 62612.43, response time: 19.85ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 5996.00, reads: 0.00, writes: 60021.51, response time: 22.35ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6184.01, reads: 0.00, writes: 61695.58, response time: 19.74ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6219.50, reads: 0.00, writes: 62267.96, response time: 19.89ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3188310
        other:                           637662
        total:                           3825972
    transactions:                        318831 (6250.97 per sec.)
    read/write requests:                 3188310 (62509.66 per sec.)
    other operations:                    637662 (12501.93 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0051s
    total number of events:              318831
    total time taken by event execution: 3263.6802s
    response time:
         min:                                  1.39ms
         avg:                                 10.24ms
         max:                                106.61ms
         approx.  95 percentile:              19.94ms

Threads fairness:
    events (avg/stddev):           4981.7344/34.24
    execution time (avg/stddev):   50.9950/0.00

