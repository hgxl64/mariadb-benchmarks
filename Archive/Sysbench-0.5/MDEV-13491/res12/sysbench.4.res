sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 992.20, reads: 0.00, writes: 9941.95, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 1000.99, reads: 0.00, writes: 10009.94, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 998.01, reads: 0.00, writes: 9966.13, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 1024.00, reads: 0.00, writes: 10252.48, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 998.99, reads: 0.00, writes: 9990.38, response time: 6.11ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 985.00, reads: 0.00, writes: 9851.02, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 980.00, reads: 0.00, writes: 9800.02, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 982.01, reads: 0.00, writes: 9820.13, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 1001.48, reads: 0.00, writes: 10011.84, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 988.50, reads: 0.00, writes: 9884.47, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 965.50, reads: 0.00, writes: 9658.55, response time: 6.69ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 995.50, reads: 0.00, writes: 9953.98, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 988.50, reads: 0.00, writes: 9876.03, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 1007.50, reads: 0.00, writes: 10084.99, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 1006.50, reads: 0.00, writes: 10062.02, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 1010.01, reads: 0.00, writes: 10102.64, response time: 5.99ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1021.00, reads: 0.00, writes: 10210.52, response time: 5.99ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 993.98, reads: 0.00, writes: 9930.34, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 986.50, reads: 0.00, writes: 9870.50, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 986.00, reads: 0.00, writes: 9862.00, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 982.01, reads: 0.00, writes: 9813.14, response time: 6.36ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 1026.48, reads: 0.00, writes: 10271.33, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 1025.01, reads: 0.00, writes: 10251.14, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 1008.00, reads: 0.00, writes: 10081.49, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 1029.48, reads: 0.00, writes: 10294.84, response time: 5.82ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           509910
        other:                           101982
        total:                           611892
    transactions:                        50991  (999.76 per sec.)
    read/write requests:                 509910 (9997.57 per sec.)
    other operations:                    101982 (1999.51 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0034s
    total number of events:              50991
    total time taken by event execution: 203.8947s
    response time:
         min:                                  0.95ms
         avg:                                  4.00ms
         max:                                 34.82ms
         approx.  95 percentile:               6.13ms

Threads fairness:
    events (avg/stddev):           12747.7500/45.78
    execution time (avg/stddev):   50.9737/0.00

