sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 492.64, reads: 0.00, writes: 4935.37, response time: 5.62ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 489.50, reads: 0.00, writes: 4894.02, response time: 5.58ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 489.51, reads: 0.00, writes: 4892.06, response time: 5.58ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 489.99, reads: 0.00, writes: 4900.44, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 482.51, reads: 0.00, writes: 4829.06, response time: 5.78ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 489.50, reads: 0.00, writes: 4895.51, response time: 5.64ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 482.50, reads: 0.00, writes: 4825.00, response time: 5.48ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 502.50, reads: 0.00, writes: 5025.00, response time: 5.47ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 497.50, reads: 0.00, writes: 4974.49, response time: 5.58ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 499.00, reads: 0.00, writes: 4984.51, response time: 5.38ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 496.49, reads: 0.00, writes: 4967.91, response time: 5.48ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 490.01, reads: 0.00, writes: 4903.06, response time: 5.51ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 488.00, reads: 0.00, writes: 4879.53, response time: 5.57ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 482.00, reads: 0.00, writes: 4820.50, response time: 5.70ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 486.50, reads: 0.00, writes: 4862.96, response time: 5.52ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 490.00, reads: 0.00, writes: 4898.05, response time: 5.60ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 475.50, reads: 0.00, writes: 4756.49, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 487.00, reads: 0.00, writes: 4867.51, response time: 5.72ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 500.50, reads: 0.00, writes: 5007.49, response time: 5.59ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 472.50, reads: 0.00, writes: 4723.50, response time: 5.89ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 476.00, reads: 0.00, writes: 4761.99, response time: 5.78ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 494.00, reads: 0.00, writes: 4941.00, response time: 5.57ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 491.50, reads: 0.00, writes: 4914.01, response time: 5.61ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 493.00, reads: 0.00, writes: 4929.99, response time: 5.75ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 497.50, reads: 0.00, writes: 4977.00, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           249460
        other:                           49892
        total:                           299352
    transactions:                        24946  (489.11 per sec.)
    read/write requests:                 249460 (4891.14 per sec.)
    other operations:                    49892  (978.23 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0024s
    total number of events:              24946
    total time taken by event execution: 101.9527s
    response time:
         min:                                  1.53ms
         avg:                                  4.09ms
         max:                                 36.49ms
         approx.  95 percentile:               5.62ms

Threads fairness:
    events (avg/stddev):           12473.0000/2.00
    execution time (avg/stddev):   50.9764/0.00

