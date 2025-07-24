sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 279.56, reads: 0.00, writes: 5601.26, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 263.00, reads: 0.00, writes: 5251.98, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 268.51, reads: 0.00, writes: 5378.11, response time: 4.83ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 269.99, reads: 0.00, writes: 5399.88, response time: 4.91ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 277.50, reads: 0.00, writes: 5550.00, response time: 4.77ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 265.00, reads: 0.00, writes: 5300.01, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 274.50, reads: 0.00, writes: 5484.49, response time: 4.84ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 269.50, reads: 0.00, writes: 5393.00, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 267.50, reads: 0.00, writes: 5352.52, response time: 5.04ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 242.00, reads: 0.00, writes: 4829.99, response time: 5.56ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 256.01, reads: 0.00, writes: 5130.11, response time: 5.11ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 249.49, reads: 0.00, writes: 4988.90, response time: 5.28ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 257.50, reads: 0.00, writes: 5150.49, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 264.50, reads: 0.00, writes: 5284.00, response time: 4.98ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 274.00, reads: 0.00, writes: 5486.50, response time: 4.91ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 259.00, reads: 0.00, writes: 5172.04, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 262.00, reads: 0.00, writes: 5242.04, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 256.50, reads: 0.00, writes: 5135.92, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 270.00, reads: 0.00, writes: 5390.00, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 252.00, reads: 0.00, writes: 5048.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 269.50, reads: 0.00, writes: 5392.00, response time: 4.98ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 271.00, reads: 0.00, writes: 5419.99, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 280.00, reads: 0.00, writes: 5590.01, response time: 4.78ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 268.50, reads: 0.00, writes: 5373.00, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 274.00, reads: 0.00, writes: 5487.00, response time: 4.76ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           271400
        other:                           27140
        total:                           298540
    transactions:                        13570  (266.07 per sec.)
    read/write requests:                 271400 (5321.42 per sec.)
    other operations:                    27140  (532.14 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0014s
    total number of events:              13570
    total time taken by event execution: 50.9744s
    response time:
         min:                                  1.75ms
         avg:                                  3.76ms
         max:                                 12.78ms
         approx.  95 percentile:               5.01ms

Threads fairness:
    events (avg/stddev):           13570.0000/0.00
    execution time (avg/stddev):   50.9744/0.00

