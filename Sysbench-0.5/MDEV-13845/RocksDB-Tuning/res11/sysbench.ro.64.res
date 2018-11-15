sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 64, tps: 6041.24, reads: 84898.28, writes: 0.00, response time: 22.06ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6450.40, reads: 90301.09, writes: 0.00, response time: 18.93ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 6403.13, reads: 89686.82, writes: 0.00, response time: 19.29ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 6471.97, reads: 90592.09, writes: 0.00, response time: 18.83ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 6543.02, reads: 91598.33, writes: 0.00, response time: 18.25ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6523.01, reads: 91321.20, writes: 0.00, response time: 18.64ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6468.00, reads: 90506.46, writes: 0.00, response time: 18.88ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 6400.50, reads: 89639.96, writes: 0.00, response time: 19.16ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6377.01, reads: 89296.59, writes: 0.00, response time: 19.24ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 6383.99, reads: 89344.90, writes: 0.00, response time: 18.94ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 6457.00, reads: 90461.51, writes: 0.00, response time: 18.96ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6455.00, reads: 90354.51, writes: 0.00, response time: 18.95ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 6370.01, reads: 89154.60, writes: 0.00, response time: 19.40ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 6451.99, reads: 90361.39, writes: 0.00, response time: 18.62ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6339.51, reads: 88746.58, writes: 0.00, response time: 19.51ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6347.99, reads: 88823.39, writes: 0.00, response time: 19.29ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6461.51, reads: 90505.62, writes: 0.00, response time: 18.92ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6430.00, reads: 89998.43, writes: 0.00, response time: 18.95ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6441.01, reads: 90150.11, writes: 0.00, response time: 19.28ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6367.49, reads: 89178.38, writes: 0.00, response time: 19.50ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6429.50, reads: 89955.97, writes: 0.00, response time: 19.10ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6398.50, reads: 89638.03, writes: 0.00, response time: 19.16ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6473.51, reads: 90637.09, writes: 0.00, response time: 18.86ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6462.50, reads: 90495.46, writes: 0.00, response time: 18.72ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6331.00, reads: 88576.04, writes: 0.00, response time: 19.65ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 64, tps: 6365.50, reads: 89160.96, writes: 0.00, response time: 19.83ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 64, tps: 6369.50, reads: 89164.48, writes: 0.00, response time: 19.33ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 64, tps: 6376.00, reads: 89232.52, writes: 0.00, response time: 19.45ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 64, tps: 6374.50, reads: 89264.52, writes: 0.00, response time: 19.33ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 64, tps: 6421.50, reads: 89919.01, writes: 0.00, response time: 18.80ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5472376
        write:                           0
        other:                           781768
        total:                           6254144
    transactions:                        390884 (6407.33 per sec.)
    read/write requests:                 5472376 (89702.65 per sec.)
    other operations:                    781768 (12814.66 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0057s
    total number of events:              390884
    total time taken by event execution: 3903.3685s
    response time:
         min:                                  2.16ms
         avg:                                  9.99ms
         max:                                 98.66ms
         approx.  95 percentile:              19.18ms

Threads fairness:
    events (avg/stddev):           6107.5625/247.32
    execution time (avg/stddev):   60.9901/0.01

