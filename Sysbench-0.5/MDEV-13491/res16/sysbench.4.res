sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 507.63, reads: 0.00, writes: 5083.76, response time: 9.81ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 507.00, reads: 0.00, writes: 5071.51, response time: 9.91ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 503.01, reads: 0.00, writes: 5022.56, response time: 9.96ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 500.00, reads: 0.00, writes: 5010.48, response time: 10.03ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 501.00, reads: 0.00, writes: 5001.48, response time: 10.26ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 501.00, reads: 0.00, writes: 5017.04, response time: 10.41ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 505.50, reads: 0.00, writes: 5052.95, response time: 9.99ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 512.50, reads: 0.00, writes: 5122.99, response time: 9.73ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 494.00, reads: 0.00, writes: 4944.49, response time: 10.04ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 497.00, reads: 0.00, writes: 4967.53, response time: 10.02ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 496.50, reads: 0.00, writes: 4967.52, response time: 10.10ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 495.00, reads: 0.00, writes: 4948.47, response time: 10.12ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 508.50, reads: 0.00, writes: 5085.52, response time: 9.76ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 510.50, reads: 0.00, writes: 5107.97, response time: 9.90ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 494.00, reads: 0.00, writes: 4933.53, response time: 9.88ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 502.50, reads: 0.00, writes: 5026.46, response time: 9.94ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 506.00, reads: 0.00, writes: 5062.48, response time: 9.75ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 522.01, reads: 0.00, writes: 5222.15, response time: 9.68ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 534.01, reads: 0.00, writes: 5337.08, response time: 9.70ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 522.49, reads: 0.00, writes: 5217.91, response time: 9.64ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 514.99, reads: 0.00, writes: 5160.40, response time: 9.76ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 503.00, reads: 0.00, writes: 5030.02, response time: 9.88ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 503.00, reads: 0.00, writes: 5022.01, response time: 10.01ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 514.00, reads: 0.00, writes: 5148.47, response time: 9.68ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 509.01, reads: 0.00, writes: 5082.08, response time: 9.73ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           258330
        other:                           51666
        total:                           309996
    transactions:                        25833  (506.45 per sec.)
    read/write requests:                 258330 (5064.55 per sec.)
    other operations:                    51666  (1012.91 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0075s
    total number of events:              25833
    total time taken by event execution: 203.9565s
    response time:
         min:                                  1.93ms
         avg:                                  7.90ms
         max:                                 33.94ms
         approx.  95 percentile:               9.90ms

Threads fairness:
    events (avg/stddev):           6458.2500/2.49
    execution time (avg/stddev):   50.9891/0.00

