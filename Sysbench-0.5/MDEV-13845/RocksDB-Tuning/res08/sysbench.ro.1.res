sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 1, tps: 336.59, reads: 4717.75, writes: 0.00, response time: 3.38ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 354.00, reads: 4956.96, writes: 0.00, response time: 2.96ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 304.50, reads: 4262.50, writes: 0.00, response time: 4.06ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 323.01, reads: 4521.58, writes: 0.00, response time: 3.85ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 329.49, reads: 4612.92, writes: 0.00, response time: 4.01ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 254.50, reads: 3562.98, writes: 0.00, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 222.00, reads: 3106.01, writes: 0.00, response time: 5.99ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 251.50, reads: 3523.50, writes: 0.00, response time: 4.55ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 246.50, reads: 3449.50, writes: 0.00, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 265.50, reads: 3718.51, writes: 0.00, response time: 4.80ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 272.50, reads: 3814.50, writes: 0.00, response time: 4.66ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 312.01, reads: 4368.60, writes: 0.00, response time: 3.64ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 270.99, reads: 3790.91, writes: 0.00, response time: 4.70ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 280.50, reads: 3929.00, writes: 0.00, response time: 4.45ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 261.50, reads: 3662.51, writes: 0.00, response time: 4.39ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 280.00, reads: 3915.51, writes: 0.00, response time: 4.44ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 308.01, reads: 4316.59, writes: 0.00, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 324.49, reads: 4541.39, writes: 0.00, response time: 4.26ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 297.50, reads: 4167.00, writes: 0.00, response time: 3.88ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 281.51, reads: 3939.09, writes: 0.00, response time: 4.57ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 376.99, reads: 5278.88, writes: 0.00, response time: 3.25ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 338.50, reads: 4737.02, writes: 0.00, response time: 3.75ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 301.51, reads: 4221.07, writes: 0.00, response time: 3.97ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 278.49, reads: 3901.92, writes: 0.00, response time: 4.60ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 267.50, reads: 3742.00, writes: 0.00, response time: 4.75ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 1, tps: 281.50, reads: 3942.02, writes: 0.00, response time: 4.51ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 1, tps: 293.50, reads: 4110.99, writes: 0.00, response time: 4.38ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 1, tps: 285.01, reads: 3984.09, writes: 0.00, response time: 4.56ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 1, tps: 276.49, reads: 3871.41, writes: 0.00, response time: 4.47ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 1, tps: 322.50, reads: 4520.50, writes: 0.00, response time: 3.80ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            249984
        write:                           0
        other:                           35712
        total:                           285696
    transactions:                        17856  (292.71 per sec.)
    read/write requests:                 249984 (4097.99 per sec.)
    other operations:                    35712  (585.43 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0015s
    total number of events:              17856
    total time taken by event execution: 60.9608s
    response time:
         min:                                  1.82ms
         avg:                                  3.41ms
         max:                                 61.41ms
         approx.  95 percentile:               4.38ms

Threads fairness:
    events (avg/stddev):           17856.0000/0.00
    execution time (avg/stddev):   60.9608/0.00

