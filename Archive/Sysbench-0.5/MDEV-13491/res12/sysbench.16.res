sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3318.14, reads: 0.00, writes: 33190.95, response time: 7.12ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3490.50, reads: 0.00, writes: 34967.02, response time: 6.84ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3456.01, reads: 0.00, writes: 34548.57, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3409.49, reads: 0.00, writes: 34096.43, response time: 7.04ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3523.00, reads: 0.00, writes: 35247.03, response time: 6.78ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3380.99, reads: 0.00, writes: 33736.38, response time: 7.13ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3621.51, reads: 0.00, writes: 36222.60, response time: 6.76ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3496.99, reads: 0.00, writes: 34983.45, response time: 6.86ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3425.51, reads: 0.00, writes: 34300.56, response time: 7.17ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3639.00, reads: 0.00, writes: 36325.98, response time: 6.70ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3531.50, reads: 0.00, writes: 35387.54, response time: 6.89ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3453.00, reads: 0.00, writes: 34522.97, response time: 7.00ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3493.00, reads: 0.00, writes: 34904.02, response time: 6.82ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3471.50, reads: 0.00, writes: 34735.45, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3483.50, reads: 0.00, writes: 34785.53, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3362.00, reads: 0.00, writes: 33667.48, response time: 7.36ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3372.00, reads: 0.00, writes: 33734.52, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3383.50, reads: 0.00, writes: 33831.04, response time: 7.20ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3488.00, reads: 0.00, writes: 34875.00, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3598.50, reads: 0.00, writes: 35983.50, response time: 6.74ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3700.00, reads: 0.00, writes: 37005.00, response time: 6.70ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3538.99, reads: 0.00, writes: 35352.38, response time: 6.67ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3580.51, reads: 0.00, writes: 35802.14, response time: 6.63ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3518.00, reads: 0.00, writes: 35206.46, response time: 7.07ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3535.50, reads: 0.00, writes: 35305.00, response time: 6.80ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1780790
        other:                           356158
        total:                           2136948
    transactions:                        178079 (3491.59 per sec.)
    read/write requests:                 1780790 (34915.86 per sec.)
    other operations:                    356158 (6983.17 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0023s
    total number of events:              178079
    total time taken by event execution: 815.6014s
    response time:
         min:                                  0.91ms
         avg:                                  4.58ms
         max:                                 49.00ms
         approx.  95 percentile:               6.92ms

Threads fairness:
    events (avg/stddev):           11129.9375/53.61
    execution time (avg/stddev):   50.9751/0.00

