sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 567.63, reads: 0.00, writes: 5686.33, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 572.00, reads: 0.00, writes: 5718.02, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 579.00, reads: 0.00, writes: 5792.01, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 587.51, reads: 0.00, writes: 5868.60, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 541.99, reads: 0.00, writes: 5424.92, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 548.01, reads: 0.00, writes: 5478.09, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 535.00, reads: 0.00, writes: 5348.48, response time: 5.12ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 542.00, reads: 0.00, writes: 5423.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 575.00, reads: 0.00, writes: 5752.00, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 575.99, reads: 0.00, writes: 5755.93, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 567.50, reads: 0.00, writes: 5679.01, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 590.01, reads: 0.00, writes: 5895.60, response time: 4.81ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 580.00, reads: 0.00, writes: 5804.48, response time: 4.98ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 580.50, reads: 0.00, writes: 5805.02, response time: 4.82ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 558.99, reads: 0.00, writes: 5589.90, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 550.01, reads: 0.00, writes: 5499.10, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 546.49, reads: 0.00, writes: 5462.90, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 579.50, reads: 0.00, writes: 5797.99, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 576.01, reads: 0.00, writes: 5760.06, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 575.51, reads: 0.00, writes: 5754.56, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 565.49, reads: 0.00, writes: 5650.41, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 549.51, reads: 0.00, writes: 5495.09, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 556.99, reads: 0.00, writes: 5574.91, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 556.51, reads: 0.00, writes: 5565.08, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 564.49, reads: 0.00, writes: 5641.41, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           288190
        other:                           57638
        total:                           345828
    transactions:                        28819  (565.07 per sec.)
    read/write requests:                 288190 (5650.68 per sec.)
    other operations:                    57638  (1130.14 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0009s
    total number of events:              28819
    total time taken by event execution: 101.9477s
    response time:
         min:                                  0.93ms
         avg:                                  3.54ms
         max:                                 17.09ms
         approx.  95 percentile:               4.93ms

Threads fairness:
    events (avg/stddev):           14409.5000/8.50
    execution time (avg/stddev):   50.9739/0.00

