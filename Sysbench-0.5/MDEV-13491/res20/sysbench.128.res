sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 5939.21, reads: 0.00, writes: 59645.08, response time: 48.17ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 5980.06, reads: 0.00, writes: 59936.65, response time: 50.63ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 5973.00, reads: 0.00, writes: 59720.49, response time: 50.39ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 6059.00, reads: 0.00, writes: 60455.51, response time: 48.57ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 5843.00, reads: 0.00, writes: 58464.47, response time: 52.09ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 5955.51, reads: 0.00, writes: 59653.59, response time: 51.15ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 5950.99, reads: 0.00, writes: 59376.44, response time: 50.48ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6054.00, reads: 0.00, writes: 60690.54, response time: 48.13ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 5964.50, reads: 0.00, writes: 59651.99, response time: 49.31ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 5991.50, reads: 0.00, writes: 59811.52, response time: 48.97ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 6042.50, reads: 0.00, writes: 60447.99, response time: 49.08ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 5921.99, reads: 0.00, writes: 59154.91, response time: 49.82ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6008.50, reads: 0.00, writes: 60219.97, response time: 49.02ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 6172.51, reads: 0.00, writes: 61665.60, response time: 46.91ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 5973.00, reads: 0.00, writes: 59643.96, response time: 49.98ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 5869.01, reads: 0.00, writes: 58703.55, response time: 51.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 5812.00, reads: 0.00, writes: 58175.48, response time: 52.14ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 5874.50, reads: 0.00, writes: 58740.98, response time: 51.61ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6046.51, reads: 0.00, writes: 60266.06, response time: 48.70ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6108.00, reads: 0.00, writes: 61317.01, response time: 48.93ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 5785.00, reads: 0.00, writes: 57804.46, response time: 51.15ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 5963.50, reads: 0.00, writes: 59658.00, response time: 49.88ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 6070.00, reads: 0.00, writes: 60793.01, response time: 48.28ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 5818.00, reads: 0.00, writes: 58083.97, response time: 51.44ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 5976.01, reads: 0.00, writes: 59678.57, response time: 48.55ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3043670
        other:                           608734
        total:                           3652404
    transactions:                        304367 (5965.46 per sec.)
    read/write requests:                 3043670 (59654.61 per sec.)
    other operations:                    608734 (11930.92 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0215s
    total number of events:              304367
    total time taken by event execution: 6529.1372s
    response time:
         min:                                  1.50ms
         avg:                                 21.45ms
         max:                                234.46ms
         approx.  95 percentile:              49.86ms

Threads fairness:
    events (avg/stddev):           2377.8672/31.79
    execution time (avg/stddev):   51.0089/0.01

