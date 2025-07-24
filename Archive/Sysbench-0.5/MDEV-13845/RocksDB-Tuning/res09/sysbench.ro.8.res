sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 8, tps: 1832.30, reads: 25708.20, writes: 0.00, response time: 5.36ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 2198.57, reads: 30762.02, writes: 0.00, response time: 4.49ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 2359.99, reads: 33040.91, writes: 0.00, response time: 4.13ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 2251.02, reads: 31513.29, writes: 0.00, response time: 4.38ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 2502.50, reads: 35036.00, writes: 0.00, response time: 4.08ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 2452.50, reads: 34337.98, writes: 0.00, response time: 4.05ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 2434.50, reads: 34075.45, writes: 0.00, response time: 4.10ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 2409.99, reads: 33736.82, writes: 0.00, response time: 3.97ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 2546.50, reads: 35652.94, writes: 0.00, response time: 3.98ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 2611.49, reads: 36563.42, writes: 0.00, response time: 3.60ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 2757.50, reads: 38595.56, writes: 0.00, response time: 3.47ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 2460.51, reads: 34453.09, writes: 0.00, response time: 3.94ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 2947.02, reads: 41273.82, writes: 0.00, response time: 3.14ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 2922.00, reads: 40905.51, writes: 0.00, response time: 3.40ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 2708.01, reads: 37905.66, writes: 0.00, response time: 3.54ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 2791.01, reads: 39091.13, writes: 0.00, response time: 3.36ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 3041.92, reads: 42577.88, writes: 0.00, response time: 3.27ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 2848.55, reads: 39863.66, writes: 0.00, response time: 3.48ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 2680.48, reads: 37532.67, writes: 0.00, response time: 3.56ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 2793.53, reads: 39108.89, writes: 0.00, response time: 3.64ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 3031.50, reads: 42460.51, writes: 0.00, response time: 3.48ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 2909.50, reads: 40700.98, writes: 0.00, response time: 3.55ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 2960.50, reads: 41472.98, writes: 0.00, response time: 3.35ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 2737.50, reads: 38322.47, writes: 0.00, response time: 3.58ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 3172.00, reads: 44411.00, writes: 0.00, response time: 2.64ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 8, tps: 3121.00, reads: 43685.05, writes: 0.00, response time: 3.09ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 8, tps: 2783.00, reads: 38953.49, writes: 0.00, response time: 3.41ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 8, tps: 3173.00, reads: 44418.04, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 8, tps: 3502.50, reads: 49052.01, writes: 0.00, response time: 2.76ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 8, tps: 3572.00, reads: 49997.48, writes: 0.00, response time: 2.54ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            2359700
        write:                           0
        other:                           337100
        total:                           2696800
    transactions:                        168550 (2763.02 per sec.)
    read/write requests:                 2359700 (38682.26 per sec.)
    other operations:                    337100 (5526.04 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0021s
    total number of events:              168550
    total time taken by event execution: 487.7419s
    response time:
         min:                                  1.79ms
         avg:                                  2.89ms
         max:                                140.99ms
         approx.  95 percentile:               3.75ms

Threads fairness:
    events (avg/stddev):           21068.7500/388.27
    execution time (avg/stddev):   60.9677/0.00

