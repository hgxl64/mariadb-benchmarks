sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 1274.13, reads: 0.00, writes: 25624.59, response time: 15.59ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 1286.51, reads: 0.00, writes: 25698.22, response time: 15.96ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 1327.00, reads: 0.00, writes: 26490.97, response time: 15.81ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 1269.00, reads: 0.00, writes: 25355.00, response time: 15.53ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 1248.00, reads: 0.00, writes: 25019.46, response time: 16.25ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 1273.01, reads: 0.00, writes: 25440.12, response time: 16.03ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 1332.00, reads: 0.00, writes: 26612.48, response time: 15.80ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 1257.50, reads: 0.00, writes: 25218.02, response time: 16.25ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 1275.00, reads: 0.00, writes: 25510.00, response time: 15.86ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 1314.00, reads: 0.00, writes: 26291.97, response time: 15.48ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 1353.00, reads: 0.00, writes: 27002.03, response time: 15.40ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 1262.00, reads: 0.00, writes: 25301.50, response time: 15.85ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 1308.50, reads: 0.00, writes: 26064.97, response time: 15.26ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 1287.50, reads: 0.00, writes: 25770.48, response time: 15.49ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 1291.50, reads: 0.00, writes: 25839.06, response time: 15.73ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 1284.00, reads: 0.00, writes: 25657.94, response time: 15.87ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 1315.00, reads: 0.00, writes: 26315.01, response time: 15.67ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 1270.50, reads: 0.00, writes: 25424.00, response time: 16.18ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 1296.00, reads: 0.00, writes: 25927.51, response time: 15.95ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 1340.50, reads: 0.00, writes: 26841.52, response time: 15.31ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 1260.99, reads: 0.00, writes: 25152.24, response time: 15.95ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 1324.01, reads: 0.00, writes: 26545.27, response time: 15.52ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 1309.00, reads: 0.00, writes: 26222.96, response time: 15.57ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 1288.50, reads: 0.00, writes: 25732.55, response time: 15.80ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 1369.50, reads: 0.00, writes: 27396.49, response time: 14.72ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1323540
        other:                           132354
        total:                           1455894
    transactions:                        66177  (1297.46 per sec.)
    read/write requests:                 1323540 (25949.19 per sec.)
    other operations:                    132354 (2594.92 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0051s
    total number of events:              66177
    total time taken by event execution: 815.8462s
    response time:
         min:                                  1.83ms
         avg:                                 12.33ms
         max:                                 58.37ms
         approx.  95 percentile:              15.73ms

Threads fairness:
    events (avg/stddev):           4136.0625/14.03
    execution time (avg/stddev):   50.9904/0.00

