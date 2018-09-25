sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 549.15, reads: 0.00, writes: 5497.51, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 553.00, reads: 0.00, writes: 5528.53, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 559.50, reads: 0.00, writes: 5600.50, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 568.00, reads: 0.00, writes: 5680.00, response time: 4.81ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 550.50, reads: 0.00, writes: 5505.00, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 543.50, reads: 0.00, writes: 5435.00, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 541.50, reads: 0.00, writes: 5411.01, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 533.00, reads: 0.00, writes: 5330.00, response time: 5.06ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 556.00, reads: 0.00, writes: 5564.00, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 552.50, reads: 0.00, writes: 5522.00, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 557.00, reads: 0.00, writes: 5571.00, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 564.50, reads: 0.00, writes: 5646.00, response time: 4.72ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 550.00, reads: 0.00, writes: 5501.00, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 546.50, reads: 0.00, writes: 5465.00, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 551.99, reads: 0.00, writes: 5519.92, response time: 4.72ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 549.00, reads: 0.00, writes: 5489.03, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 551.00, reads: 0.00, writes: 5511.00, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 537.50, reads: 0.00, writes: 5371.51, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 544.50, reads: 0.00, writes: 5448.54, response time: 4.81ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 547.50, reads: 0.00, writes: 5474.99, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 535.50, reads: 0.00, writes: 5355.01, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 545.50, reads: 0.00, writes: 5454.99, response time: 4.84ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 545.50, reads: 0.00, writes: 5455.00, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 549.00, reads: 0.00, writes: 5490.00, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 540.00, reads: 0.00, writes: 5397.50, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           279960
        other:                           55992
        total:                           335952
    transactions:                        27996  (548.92 per sec.)
    read/write requests:                 279960 (5489.20 per sec.)
    other operations:                    55992  (1097.84 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0020s
    total number of events:              27996
    total time taken by event execution: 101.9501s
    response time:
         min:                                  0.96ms
         avg:                                  3.64ms
         max:                                 24.53ms
         approx.  95 percentile:               4.91ms

Threads fairness:
    events (avg/stddev):           13998.0000/4.00
    execution time (avg/stddev):   50.9751/0.00

