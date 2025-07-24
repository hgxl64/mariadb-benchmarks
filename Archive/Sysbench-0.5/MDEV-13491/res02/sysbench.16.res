sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 421.02, reads: 0.00, writes: 8442.98, response time: 48.30ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 420.00, reads: 0.00, writes: 8397.55, response time: 50.80ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 424.50, reads: 0.00, writes: 8480.49, response time: 43.15ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 428.00, reads: 0.00, writes: 8555.49, response time: 40.06ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 421.00, reads: 0.00, writes: 8425.01, response time: 40.38ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 418.00, reads: 0.00, writes: 8364.01, response time: 40.44ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 419.00, reads: 0.00, writes: 8379.48, response time: 40.50ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 416.50, reads: 0.00, writes: 8325.52, response time: 40.78ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 419.00, reads: 0.00, writes: 8382.48, response time: 40.56ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 418.00, reads: 0.00, writes: 8364.51, response time: 41.03ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 418.50, reads: 0.00, writes: 8360.50, response time: 40.51ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 414.00, reads: 0.00, writes: 8299.00, response time: 40.42ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 429.50, reads: 0.00, writes: 8575.50, response time: 40.06ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 436.00, reads: 0.00, writes: 8720.50, response time: 39.26ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 419.50, reads: 0.00, writes: 8389.00, response time: 40.89ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 427.50, reads: 0.00, writes: 8555.01, response time: 39.98ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 427.00, reads: 0.00, writes: 8538.51, response time: 40.59ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 430.00, reads: 0.00, writes: 8596.49, response time: 39.76ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 431.00, reads: 0.00, writes: 8623.93, response time: 39.53ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 420.50, reads: 0.00, writes: 8414.58, response time: 41.09ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 430.00, reads: 0.00, writes: 8592.00, response time: 39.73ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 418.50, reads: 0.00, writes: 8376.98, response time: 40.89ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 430.50, reads: 0.00, writes: 8604.00, response time: 39.93ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 424.50, reads: 0.00, writes: 8512.02, response time: 39.72ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 430.50, reads: 0.00, writes: 8590.93, response time: 39.88ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           432420
        other:                           43242
        total:                           475662
    transactions:                        21621  (423.63 per sec.)
    read/write requests:                 432420 (8472.64 per sec.)
    other operations:                    43242  (847.26 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0372s
    total number of events:              21621
    total time taken by event execution: 816.2265s
    response time:
         min:                                  3.84ms
         avg:                                 37.75ms
         max:                                 79.97ms
         approx.  95 percentile:              40.42ms

Threads fairness:
    events (avg/stddev):           1351.3125/0.68
    execution time (avg/stddev):   51.0142/0.01

