sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 470.04, reads: 0.00, writes: 4708.43, response time: 39.40ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 460.00, reads: 0.00, writes: 4597.54, response time: 37.05ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 465.00, reads: 0.00, writes: 4650.50, response time: 37.25ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 470.50, reads: 0.00, writes: 4706.51, response time: 36.72ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 469.50, reads: 0.00, writes: 4692.51, response time: 36.52ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 469.49, reads: 0.00, writes: 4698.94, response time: 36.93ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 472.00, reads: 0.00, writes: 4721.50, response time: 36.65ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 469.50, reads: 0.00, writes: 4693.05, response time: 36.67ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 462.50, reads: 0.00, writes: 4620.01, response time: 37.40ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 484.00, reads: 0.00, writes: 4841.50, response time: 36.03ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 476.50, reads: 0.00, writes: 4767.50, response time: 35.87ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 465.00, reads: 0.00, writes: 4647.00, response time: 36.87ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 454.50, reads: 0.00, writes: 4549.00, response time: 37.62ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 448.00, reads: 0.00, writes: 4479.00, response time: 38.03ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 464.49, reads: 0.00, writes: 4648.94, response time: 36.72ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 460.50, reads: 0.00, writes: 4600.50, response time: 37.80ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 452.00, reads: 0.00, writes: 4520.50, response time: 38.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 459.50, reads: 0.00, writes: 4591.00, response time: 37.63ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 461.01, reads: 0.00, writes: 4613.06, response time: 36.96ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 470.00, reads: 0.00, writes: 4702.01, response time: 36.48ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 447.50, reads: 0.00, writes: 4475.99, response time: 38.15ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 454.50, reads: 0.00, writes: 4540.50, response time: 37.61ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 450.00, reads: 0.00, writes: 4499.01, response time: 38.56ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 450.49, reads: 0.00, writes: 4506.95, response time: 37.82ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 464.50, reads: 0.00, writes: 4650.02, response time: 36.87ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           236210
        other:                           47242
        total:                           283452
    transactions:                        23621  (462.82 per sec.)
    read/write requests:                 236210 (4628.20 per sec.)
    other operations:                    47242  (925.64 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0371s
    total number of events:              23621
    total time taken by event execution: 816.2219s
    response time:
         min:                                  4.26ms
         avg:                                 34.55ms
         max:                                 78.31ms
         approx.  95 percentile:              37.39ms

Threads fairness:
    events (avg/stddev):           1476.3125/0.85
    execution time (avg/stddev):   51.0139/0.01

