sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 269.58, reads: 0.00, writes: 5400.02, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 271.00, reads: 0.00, writes: 5421.53, response time: 5.04ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 279.50, reads: 0.00, writes: 5589.99, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 261.00, reads: 0.00, writes: 5220.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 286.50, reads: 0.00, writes: 5729.50, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 270.50, reads: 0.00, writes: 5410.48, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 271.00, reads: 0.00, writes: 5411.95, response time: 5.10ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 260.50, reads: 0.00, writes: 5212.49, response time: 5.14ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 276.00, reads: 0.00, writes: 5525.58, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 263.00, reads: 0.00, writes: 5250.50, response time: 5.23ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 263.00, reads: 0.00, writes: 5261.49, response time: 5.29ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 265.50, reads: 0.00, writes: 5309.00, response time: 5.12ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 257.00, reads: 0.00, writes: 5141.00, response time: 5.38ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 277.00, reads: 0.00, writes: 5541.50, response time: 5.10ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 263.00, reads: 0.00, writes: 5256.50, response time: 5.12ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 265.00, reads: 0.00, writes: 5308.00, response time: 5.13ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 277.50, reads: 0.00, writes: 5552.00, response time: 5.09ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 263.50, reads: 0.00, writes: 5270.00, response time: 5.14ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 274.50, reads: 0.00, writes: 5488.51, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 265.50, reads: 0.00, writes: 5304.50, response time: 5.03ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 284.50, reads: 0.00, writes: 5695.00, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 268.00, reads: 0.00, writes: 5362.01, response time: 5.10ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 285.49, reads: 0.00, writes: 5709.89, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 257.50, reads: 0.00, writes: 5150.07, response time: 5.22ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 268.50, reads: 0.00, writes: 5362.01, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           275160
        other:                           27516
        total:                           302676
    transactions:                        13758  (269.76 per sec.)
    read/write requests:                 275160 (5395.17 per sec.)
    other operations:                    27516  (539.52 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0012s
    total number of events:              13758
    total time taken by event execution: 50.9784s
    response time:
         min:                                  1.70ms
         avg:                                  3.71ms
         max:                                 30.34ms
         approx.  95 percentile:               5.09ms

Threads fairness:
    events (avg/stddev):           13758.0000/0.00
    execution time (avg/stddev):   50.9784/0.00

