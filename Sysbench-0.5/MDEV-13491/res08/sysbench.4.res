sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 966.70, reads: 0.00, writes: 9687.02, response time: 6.11ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 987.51, reads: 0.00, writes: 9875.06, response time: 6.29ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 999.48, reads: 0.00, writes: 9991.35, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 1005.02, reads: 0.00, writes: 10053.68, response time: 5.94ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 1014.00, reads: 0.00, writes: 10134.99, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 999.48, reads: 0.00, writes: 9999.84, response time: 6.11ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 986.01, reads: 0.00, writes: 9860.13, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 996.00, reads: 0.00, writes: 9959.52, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 1003.99, reads: 0.00, writes: 10040.37, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 973.50, reads: 0.00, writes: 9735.00, response time: 6.32ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 984.00, reads: 0.00, writes: 9834.05, response time: 6.33ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 977.00, reads: 0.00, writes: 9775.95, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 982.50, reads: 0.00, writes: 9825.00, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 981.01, reads: 0.00, writes: 9807.56, response time: 6.34ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 969.00, reads: 0.00, writes: 9689.96, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 970.99, reads: 0.00, writes: 9712.44, response time: 6.35ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1043.51, reads: 0.00, writes: 10430.07, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 1017.99, reads: 0.00, writes: 10184.94, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 1012.50, reads: 0.00, writes: 10123.01, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 1003.52, reads: 0.00, writes: 10037.16, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 1003.49, reads: 0.00, writes: 10034.92, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 986.50, reads: 0.00, writes: 9859.46, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 1012.51, reads: 0.00, writes: 10125.12, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 998.99, reads: 0.00, writes: 9995.44, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 1019.99, reads: 0.00, writes: 10194.41, response time: 5.98ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           508080
        other:                           101616
        total:                           609696
    transactions:                        50808  (996.18 per sec.)
    read/write requests:                 508080 (9961.80 per sec.)
    other operations:                    101616 (1992.36 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0028s
    total number of events:              50808
    total time taken by event execution: 203.8930s
    response time:
         min:                                  0.88ms
         avg:                                  4.01ms
         max:                                 26.04ms
         approx.  95 percentile:               6.12ms

Threads fairness:
    events (avg/stddev):           12702.0000/36.07
    execution time (avg/stddev):   50.9732/0.00

