sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 559.65, reads: 0.00, writes: 5602.52, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 554.99, reads: 0.00, writes: 5551.87, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 557.01, reads: 0.00, writes: 5571.59, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 538.50, reads: 0.00, writes: 5383.48, response time: 5.07ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 556.01, reads: 0.00, writes: 5561.58, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 538.99, reads: 0.00, writes: 5390.42, response time: 4.98ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 544.50, reads: 0.00, writes: 5443.99, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 548.50, reads: 0.00, writes: 5486.00, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 549.00, reads: 0.00, writes: 5490.03, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 555.99, reads: 0.00, writes: 5557.41, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 563.51, reads: 0.00, writes: 5632.59, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 555.00, reads: 0.00, writes: 5553.96, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 557.00, reads: 0.00, writes: 5569.04, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 560.50, reads: 0.00, writes: 5601.47, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 551.01, reads: 0.00, writes: 5511.09, response time: 5.22ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 552.99, reads: 0.00, writes: 5533.41, response time: 5.04ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 566.50, reads: 0.00, writes: 5666.02, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 562.50, reads: 0.00, writes: 5624.97, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 555.01, reads: 0.00, writes: 5550.10, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 567.49, reads: 0.00, writes: 5674.91, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 554.50, reads: 0.00, writes: 5545.02, response time: 5.06ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 565.00, reads: 0.00, writes: 5649.98, response time: 5.06ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 559.00, reads: 0.00, writes: 5590.02, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 557.50, reads: 0.00, writes: 5574.98, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 554.00, reads: 0.00, writes: 5538.02, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           283240
        other:                           56648
        total:                           339888
    transactions:                        28324  (555.36 per sec.)
    read/write requests:                 283240 (5553.58 per sec.)
    other operations:                    56648  (1110.72 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0013s
    total number of events:              28324
    total time taken by event execution: 101.9558s
    response time:
         min:                                  0.89ms
         avg:                                  3.60ms
         max:                                 30.65ms
         approx.  95 percentile:               4.97ms

Threads fairness:
    events (avg/stddev):           14162.0000/8.00
    execution time (avg/stddev):   50.9779/0.00

