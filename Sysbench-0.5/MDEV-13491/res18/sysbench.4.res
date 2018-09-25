sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 577.14, reads: 0.00, writes: 5777.38, response time: 10.29ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 590.00, reads: 0.00, writes: 5912.00, response time: 9.87ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 591.50, reads: 0.00, writes: 5912.52, response time: 10.01ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 604.50, reads: 0.00, writes: 6049.45, response time: 9.61ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 586.51, reads: 0.00, writes: 5861.55, response time: 9.93ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 605.50, reads: 0.00, writes: 6051.99, response time: 9.69ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 612.50, reads: 0.00, writes: 6127.53, response time: 9.89ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 605.50, reads: 0.00, writes: 6047.97, response time: 9.58ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 586.50, reads: 0.00, writes: 5875.98, response time: 10.04ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 588.50, reads: 0.00, writes: 5876.52, response time: 9.97ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 596.00, reads: 0.00, writes: 5964.96, response time: 9.80ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 601.00, reads: 0.00, writes: 6013.00, response time: 9.67ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 588.51, reads: 0.00, writes: 5880.07, response time: 9.80ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 600.50, reads: 0.00, writes: 6008.47, response time: 9.78ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 573.50, reads: 0.00, writes: 5731.52, response time: 9.97ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 589.00, reads: 0.00, writes: 5883.52, response time: 9.92ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 589.49, reads: 0.00, writes: 5892.45, response time: 10.00ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 571.50, reads: 0.00, writes: 5726.50, response time: 10.31ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 560.50, reads: 0.00, writes: 5604.04, response time: 10.37ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 597.50, reads: 0.00, writes: 5970.49, response time: 9.84ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 608.00, reads: 0.00, writes: 6085.49, response time: 9.67ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 590.00, reads: 0.00, writes: 5893.03, response time: 9.95ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 590.00, reads: 0.00, writes: 5899.99, response time: 10.22ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 609.50, reads: 0.00, writes: 6104.48, response time: 9.63ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 578.50, reads: 0.00, writes: 5779.00, response time: 10.23ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           302040
        other:                           60408
        total:                           362448
    transactions:                        30204  (592.18 per sec.)
    read/write requests:                 302040 (5921.84 per sec.)
    other operations:                    60408  (1184.37 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0044s
    total number of events:              30204
    total time taken by event execution: 203.9319s
    response time:
         min:                                  1.79ms
         avg:                                  6.75ms
         max:                                 19.10ms
         approx.  95 percentile:               9.94ms

Threads fairness:
    events (avg/stddev):           7551.0000/26.02
    execution time (avg/stddev):   50.9830/0.00

