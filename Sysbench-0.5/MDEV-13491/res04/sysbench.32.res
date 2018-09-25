sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 1444.65, reads: 0.00, writes: 29028.54, response time: 27.52ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 1349.01, reads: 0.00, writes: 27106.61, response time: 27.67ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 1407.50, reads: 0.00, writes: 28017.94, response time: 26.21ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 1329.00, reads: 0.00, writes: 26658.99, response time: 27.66ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 1352.00, reads: 0.00, writes: 27003.52, response time: 27.65ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 1323.00, reads: 0.00, writes: 26512.04, response time: 27.50ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 1365.49, reads: 0.00, writes: 27263.28, response time: 27.11ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 1368.51, reads: 0.00, writes: 27345.23, response time: 26.62ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 1299.50, reads: 0.00, writes: 26036.99, response time: 29.62ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 1363.00, reads: 0.00, writes: 27229.96, response time: 27.10ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 1380.00, reads: 0.00, writes: 27648.07, response time: 26.44ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 1359.00, reads: 0.00, writes: 27140.97, response time: 26.78ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 1327.00, reads: 0.00, writes: 26495.97, response time: 27.70ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 1345.50, reads: 0.00, writes: 26915.99, response time: 26.43ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 1355.00, reads: 0.00, writes: 27133.08, response time: 27.03ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 1344.00, reads: 0.00, writes: 26858.96, response time: 27.31ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 1399.50, reads: 0.00, writes: 27967.02, response time: 26.42ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 1349.50, reads: 0.00, writes: 27025.02, response time: 27.14ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 1373.50, reads: 0.00, writes: 27412.02, response time: 27.07ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 1309.50, reads: 0.00, writes: 26260.98, response time: 28.72ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 1353.50, reads: 0.00, writes: 27055.47, response time: 28.16ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 1346.50, reads: 0.00, writes: 26956.47, response time: 26.99ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 1375.00, reads: 0.00, writes: 27522.06, response time: 26.70ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 1345.00, reads: 0.00, writes: 26821.96, response time: 27.45ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 1334.50, reads: 0.00, writes: 26707.04, response time: 27.82ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1383420
        other:                           138342
        total:                           1521762
    transactions:                        69171  (1355.90 per sec.)
    read/write requests:                 1383420 (27117.92 per sec.)
    other operations:                    138342 (2711.79 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0150s
    total number of events:              69171
    total time taken by event execution: 1632.0147s
    response time:
         min:                                  4.11ms
         avg:                                 23.59ms
         max:                                 53.82ms
         approx.  95 percentile:              27.29ms

Threads fairness:
    events (avg/stddev):           2161.5938/2.84
    execution time (avg/stddev):   51.0005/0.01

