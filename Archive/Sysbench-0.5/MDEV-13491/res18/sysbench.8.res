sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 572.12, reads: 0.00, writes: 5741.22, response time: 18.15ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 594.50, reads: 0.00, writes: 5948.05, response time: 17.42ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 576.00, reads: 0.00, writes: 5753.00, response time: 18.57ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 565.99, reads: 0.00, writes: 5665.95, response time: 18.54ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 575.50, reads: 0.00, writes: 5753.55, response time: 17.60ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 580.49, reads: 0.00, writes: 5824.45, response time: 17.30ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 574.00, reads: 0.00, writes: 5717.50, response time: 17.84ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 576.01, reads: 0.00, writes: 5754.06, response time: 18.48ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 571.49, reads: 0.00, writes: 5713.44, response time: 18.27ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 579.00, reads: 0.00, writes: 5793.50, response time: 17.81ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 565.01, reads: 0.00, writes: 5665.06, response time: 17.69ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 581.49, reads: 0.00, writes: 5813.94, response time: 16.88ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 593.00, reads: 0.00, writes: 5923.47, response time: 17.33ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 580.51, reads: 0.00, writes: 5805.58, response time: 17.80ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 592.50, reads: 0.00, writes: 5921.97, response time: 17.98ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 574.50, reads: 0.00, writes: 5751.02, response time: 17.96ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 606.49, reads: 0.00, writes: 6054.95, response time: 17.56ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 579.00, reads: 0.00, writes: 5781.55, response time: 17.52ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 551.00, reads: 0.00, writes: 5525.96, response time: 18.07ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 561.00, reads: 0.00, writes: 5617.54, response time: 18.13ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 597.00, reads: 0.00, writes: 5966.00, response time: 17.85ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 559.50, reads: 0.00, writes: 5588.50, response time: 18.22ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 585.49, reads: 0.00, writes: 5856.45, response time: 17.36ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 567.50, reads: 0.00, writes: 5679.54, response time: 18.41ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 571.50, reads: 0.00, writes: 5711.96, response time: 18.83ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           294460
        other:                           58892
        total:                           353352
    transactions:                        29446  (577.28 per sec.)
    read/write requests:                 294460 (5772.81 per sec.)
    other operations:                    58892  (1154.56 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0081s
    total number of events:              29446
    total time taken by event execution: 407.9520s
    response time:
         min:                                  2.41ms
         avg:                                 13.85ms
         max:                                 37.67ms
         approx.  95 percentile:              17.90ms

Threads fairness:
    events (avg/stddev):           3680.7500/13.85
    execution time (avg/stddev):   50.9940/0.00

