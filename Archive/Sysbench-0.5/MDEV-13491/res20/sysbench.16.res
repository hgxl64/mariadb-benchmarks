sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3333.85, reads: 0.00, writes: 33418.56, response time: 7.17ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3316.02, reads: 0.00, writes: 33160.19, response time: 7.23ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3465.00, reads: 0.00, writes: 34636.46, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3357.50, reads: 0.00, writes: 33588.51, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3295.49, reads: 0.00, writes: 32879.91, response time: 7.27ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3408.51, reads: 0.00, writes: 34138.62, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3388.00, reads: 0.00, writes: 33884.49, response time: 7.11ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3387.00, reads: 0.00, writes: 33877.55, response time: 6.97ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3375.49, reads: 0.00, writes: 33748.91, response time: 7.00ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3437.01, reads: 0.00, writes: 34359.55, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3378.50, reads: 0.00, writes: 33751.01, response time: 7.30ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3384.50, reads: 0.00, writes: 33903.47, response time: 7.02ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3377.50, reads: 0.00, writes: 33754.98, response time: 7.12ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3366.50, reads: 0.00, writes: 33657.98, response time: 7.24ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3421.50, reads: 0.00, writes: 34242.03, response time: 6.70ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3463.01, reads: 0.00, writes: 34624.05, response time: 6.89ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3432.98, reads: 0.00, writes: 34292.35, response time: 7.02ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3409.01, reads: 0.00, writes: 34125.10, response time: 7.15ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3475.50, reads: 0.00, writes: 34760.47, response time: 7.13ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3350.50, reads: 0.00, writes: 33509.53, response time: 6.99ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3699.50, reads: 0.00, writes: 36995.03, response time: 6.60ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3464.50, reads: 0.00, writes: 34637.51, response time: 6.77ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3461.99, reads: 0.00, writes: 34622.44, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3513.50, reads: 0.00, writes: 35140.04, response time: 6.82ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3438.50, reads: 0.00, writes: 34385.02, response time: 7.13ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1744130
        other:                           348826
        total:                           2092956
    transactions:                        174413 (3419.69 per sec.)
    read/write requests:                 1744130 (34196.94 per sec.)
    other operations:                    348826 (6839.39 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0025s
    total number of events:              174413
    total time taken by event execution: 815.6464s
    response time:
         min:                                  0.94ms
         avg:                                  4.68ms
         max:                                 47.44ms
         approx.  95 percentile:               7.02ms

Threads fairness:
    events (avg/stddev):           10900.8125/27.59
    execution time (avg/stddev):   50.9779/0.00

