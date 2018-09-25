sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 563.65, reads: 0.00, writes: 5646.50, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 553.50, reads: 0.00, writes: 5530.03, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 560.50, reads: 0.00, writes: 5607.00, response time: 4.81ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 564.51, reads: 0.00, writes: 5644.08, response time: 4.80ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 555.99, reads: 0.00, writes: 5563.91, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 566.51, reads: 0.00, writes: 5665.08, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 576.49, reads: 0.00, writes: 5764.91, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 567.01, reads: 0.00, writes: 5666.59, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 591.49, reads: 0.00, writes: 5918.41, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 567.50, reads: 0.00, writes: 5674.99, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 571.51, reads: 0.00, writes: 5715.08, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 585.99, reads: 0.00, writes: 5859.92, response time: 4.78ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 551.51, reads: 0.00, writes: 5514.57, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 558.00, reads: 0.00, writes: 5578.01, response time: 4.82ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 554.49, reads: 0.00, writes: 5547.43, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 562.51, reads: 0.00, writes: 5621.57, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 568.49, reads: 0.00, writes: 5687.41, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 569.01, reads: 0.00, writes: 5687.59, response time: 5.14ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 582.49, reads: 0.00, writes: 5827.93, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 563.50, reads: 0.00, writes: 5634.50, response time: 5.03ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 570.50, reads: 0.00, writes: 5706.00, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 565.50, reads: 0.00, writes: 5655.00, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 573.01, reads: 0.00, writes: 5730.07, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 549.99, reads: 0.00, writes: 5499.94, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 563.50, reads: 0.00, writes: 5634.00, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           288800
        other:                           57760
        total:                           346560
    transactions:                        28880  (566.23 per sec.)
    read/write requests:                 288800 (5662.30 per sec.)
    other operations:                    57760  (1132.46 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0040s
    total number of events:              28880
    total time taken by event execution: 101.9529s
    response time:
         min:                                  0.94ms
         avg:                                  3.53ms
         max:                                 23.36ms
         approx.  95 percentile:               4.94ms

Threads fairness:
    events (avg/stddev):           14440.0000/6.00
    execution time (avg/stddev):   50.9764/0.00

