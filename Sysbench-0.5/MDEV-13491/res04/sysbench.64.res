sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 1269.44, reads: 0.00, writes: 25752.20, response time: 60.75ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 1336.51, reads: 0.00, writes: 26663.78, response time: 53.48ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 1323.00, reads: 0.00, writes: 26449.96, response time: 52.87ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 1353.50, reads: 0.00, writes: 27105.91, response time: 51.72ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 1340.49, reads: 0.00, writes: 26796.21, response time: 53.16ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 1407.52, reads: 0.00, writes: 27994.90, response time: 50.06ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 1324.50, reads: 0.00, writes: 26597.99, response time: 52.69ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 1332.00, reads: 0.00, writes: 26683.02, response time: 52.73ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 1309.00, reads: 0.00, writes: 26254.03, response time: 52.97ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 1328.49, reads: 0.00, writes: 26522.76, response time: 53.50ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 1308.01, reads: 0.00, writes: 26133.73, response time: 53.21ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 1351.49, reads: 0.00, writes: 27066.29, response time: 51.45ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 1330.51, reads: 0.00, writes: 26513.65, response time: 51.98ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 1325.00, reads: 0.00, writes: 26533.01, response time: 51.65ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 1289.99, reads: 0.00, writes: 25948.32, response time: 53.85ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 1356.51, reads: 0.00, writes: 27080.23, response time: 51.33ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 1347.50, reads: 0.00, writes: 26859.00, response time: 52.12ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 1339.00, reads: 0.00, writes: 26723.98, response time: 51.87ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 1345.00, reads: 0.00, writes: 26956.05, response time: 51.22ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 1364.00, reads: 0.00, writes: 27295.48, response time: 51.50ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 1351.00, reads: 0.00, writes: 26986.99, response time: 51.04ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 1312.00, reads: 0.00, writes: 26301.51, response time: 52.89ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 1323.50, reads: 0.00, writes: 26475.47, response time: 52.26ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 1365.50, reads: 0.00, writes: 27343.51, response time: 51.59ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 1337.50, reads: 0.00, writes: 26650.03, response time: 51.89ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1362420
        other:                           136242
        total:                           1498662
    transactions:                        68121  (1334.95 per sec.)
    read/write requests:                 1362420 (26699.07 per sec.)
    other operations:                    136242 (2669.91 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0287s
    total number of events:              68121
    total time taken by event execution: 3264.9981s
    response time:
         min:                                 31.11ms
         avg:                                 47.93ms
         max:                                 84.77ms
         approx.  95 percentile:              52.48ms

Threads fairness:
    events (avg/stddev):           1064.3906/1.08
    execution time (avg/stddev):   51.0156/0.01

