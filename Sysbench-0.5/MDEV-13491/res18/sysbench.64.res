sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 479.97, reads: 0.00, writes: 4901.69, response time: 140.09ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 485.51, reads: 0.00, writes: 4983.10, response time: 145.52ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 510.50, reads: 0.00, writes: 5056.51, response time: 132.98ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 517.00, reads: 0.00, writes: 5164.00, response time: 128.09ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 517.99, reads: 0.00, writes: 5171.42, response time: 137.39ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 530.51, reads: 0.00, writes: 5243.07, response time: 125.70ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 531.50, reads: 0.00, writes: 5365.97, response time: 131.91ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 541.51, reads: 0.00, writes: 5432.05, response time: 124.39ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 526.00, reads: 0.00, writes: 5237.96, response time: 127.67ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 512.50, reads: 0.00, writes: 5136.54, response time: 144.34ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 530.50, reads: 0.00, writes: 5299.96, response time: 128.98ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 528.00, reads: 0.00, writes: 5280.04, response time: 133.26ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 533.00, reads: 0.00, writes: 5330.00, response time: 125.21ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 537.00, reads: 0.00, writes: 5339.50, response time: 124.62ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 537.00, reads: 0.00, writes: 5397.50, response time: 123.39ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 524.49, reads: 0.00, writes: 5236.93, response time: 126.46ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 525.50, reads: 0.00, writes: 5265.02, response time: 126.38ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 527.00, reads: 0.00, writes: 5243.01, response time: 126.23ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 532.50, reads: 0.00, writes: 5349.49, response time: 124.65ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 516.01, reads: 0.00, writes: 5151.55, response time: 130.92ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 529.99, reads: 0.00, writes: 5271.42, response time: 127.90ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 523.50, reads: 0.00, writes: 5279.03, response time: 125.63ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 521.00, reads: 0.00, writes: 5198.04, response time: 137.68ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 531.00, reads: 0.00, writes: 5292.96, response time: 125.51ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 510.50, reads: 0.00, writes: 5089.00, response time: 140.26ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           267060
        other:                           53412
        total:                           320472
    transactions:                        26706  (522.96 per sec.)
    read/write requests:                 267060 (5229.62 per sec.)
    other operations:                    53412  (1045.92 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0668s
    total number of events:              26706
    total time taken by event execution: 3266.7862s
    response time:
         min:                                 71.74ms
         avg:                                122.32ms
         max:                                154.92ms
         approx.  95 percentile:             130.30ms

Threads fairness:
    events (avg/stddev):           417.2812/0.48
    execution time (avg/stddev):   51.0435/0.02

