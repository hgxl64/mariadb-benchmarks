sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 6031.73, reads: 0.00, writes: 60586.78, response time: 45.69ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 6164.54, reads: 0.00, writes: 61864.37, response time: 47.33ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 6426.50, reads: 0.00, writes: 64200.02, response time: 43.30ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 6172.00, reads: 0.00, writes: 61624.48, response time: 45.36ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 6313.00, reads: 0.00, writes: 63181.96, response time: 44.92ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 6767.51, reads: 0.00, writes: 67551.56, response time: 39.81ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 6101.50, reads: 0.00, writes: 61124.52, response time: 47.19ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6575.00, reads: 0.00, writes: 65729.98, response time: 42.10ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 6292.49, reads: 0.00, writes: 62932.95, response time: 43.34ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 6414.00, reads: 0.00, writes: 64079.00, response time: 42.87ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 6774.01, reads: 0.00, writes: 67805.08, response time: 39.48ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 6870.00, reads: 0.00, writes: 68635.98, response time: 38.68ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6335.50, reads: 0.00, writes: 63360.52, response time: 44.29ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 6217.44, reads: 0.00, writes: 62107.42, response time: 44.39ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 6337.49, reads: 0.00, writes: 63590.38, response time: 42.10ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 6585.58, reads: 0.00, writes: 65630.77, response time: 42.71ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 6461.00, reads: 0.00, writes: 64686.46, response time: 42.71ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 6537.50, reads: 0.00, writes: 65352.98, response time: 42.08ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6333.49, reads: 0.00, writes: 63279.45, response time: 45.23ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6464.01, reads: 0.00, writes: 64662.12, response time: 41.88ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 6444.46, reads: 0.00, writes: 64554.55, response time: 42.96ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 6436.03, reads: 0.00, writes: 64471.33, response time: 43.33ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 6543.51, reads: 0.00, writes: 65312.61, response time: 44.05ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 6340.50, reads: 0.00, writes: 63273.50, response time: 43.50ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 6276.99, reads: 0.00, writes: 62870.94, response time: 44.43ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3271830
        other:                           654366
        total:                           3926196
    transactions:                        327183 (6413.56 per sec.)
    read/write requests:                 3271830 (64135.59 per sec.)
    other operations:                    654366 (12827.12 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0143s
    total number of events:              327183
    total time taken by event execution: 6528.3244s
    response time:
         min:                                  1.42ms
         avg:                                 19.95ms
         max:                                188.36ms
         approx.  95 percentile:              43.11ms

Threads fairness:
    events (avg/stddev):           2556.1172/25.62
    execution time (avg/stddev):   51.0025/0.00

