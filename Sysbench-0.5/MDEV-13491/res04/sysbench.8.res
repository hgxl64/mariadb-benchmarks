sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1175.72, reads: 0.00, writes: 23547.92, response time: 9.45ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1107.55, reads: 0.00, writes: 22175.90, response time: 9.85ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1230.46, reads: 0.00, writes: 24561.78, response time: 9.38ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1220.52, reads: 0.00, writes: 24479.30, response time: 8.96ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1127.50, reads: 0.00, writes: 22546.47, response time: 9.80ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1129.99, reads: 0.00, writes: 22603.31, response time: 10.17ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1189.99, reads: 0.00, writes: 23789.85, response time: 9.64ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1198.02, reads: 0.00, writes: 23931.36, response time: 9.40ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1184.00, reads: 0.00, writes: 23681.44, response time: 9.48ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1213.00, reads: 0.00, writes: 24291.59, response time: 9.01ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1189.50, reads: 0.00, writes: 23794.95, response time: 9.35ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1209.51, reads: 0.00, writes: 24171.67, response time: 9.26ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1142.49, reads: 0.00, writes: 22822.87, response time: 9.97ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1166.00, reads: 0.00, writes: 23352.41, response time: 9.87ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1190.00, reads: 0.00, writes: 23786.08, response time: 9.66ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1201.98, reads: 0.00, writes: 24023.63, response time: 9.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1166.01, reads: 0.00, writes: 23340.65, response time: 9.72ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1221.01, reads: 0.00, writes: 24438.73, response time: 9.18ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1180.99, reads: 0.00, writes: 23608.35, response time: 9.66ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1156.03, reads: 0.00, writes: 23133.55, response time: 9.80ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1163.98, reads: 0.00, writes: 23212.04, response time: 9.52ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1119.02, reads: 0.00, writes: 22408.34, response time: 10.03ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1210.47, reads: 0.00, writes: 24249.44, response time: 9.33ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1168.01, reads: 0.00, writes: 23337.25, response time: 9.54ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1210.98, reads: 0.00, writes: 24207.10, response time: 9.29ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1203060
        other:                           120306
        total:                           1323366
    transactions:                        60153  (1179.40 per sec.)
    read/write requests:                 1203060 (23588.06 per sec.)
    other operations:                    120306 (2358.81 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0029s
    total number of events:              60153
    total time taken by event execution: 407.8659s
    response time:
         min:                                  1.75ms
         avg:                                  6.78ms
         max:                                 24.08ms
         approx.  95 percentile:               9.58ms

Threads fairness:
    events (avg/stddev):           7519.1250/23.95
    execution time (avg/stddev):   50.9832/0.00

