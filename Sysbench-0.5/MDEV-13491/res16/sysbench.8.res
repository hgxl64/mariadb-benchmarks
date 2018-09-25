sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 487.59, reads: 0.00, writes: 4883.87, response time: 18.99ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 458.49, reads: 0.00, writes: 4584.44, response time: 21.09ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 484.51, reads: 0.00, writes: 4848.07, response time: 19.05ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 490.00, reads: 0.00, writes: 4900.99, response time: 19.02ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 525.99, reads: 0.00, writes: 5253.43, response time: 17.82ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 511.52, reads: 0.00, writes: 5116.67, response time: 18.39ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 478.49, reads: 0.00, writes: 4789.37, response time: 19.00ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 481.50, reads: 0.00, writes: 4809.53, response time: 19.13ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 485.50, reads: 0.00, writes: 4857.51, response time: 18.81ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 474.50, reads: 0.00, writes: 4742.98, response time: 19.09ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 483.00, reads: 0.00, writes: 4834.46, response time: 19.22ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 475.01, reads: 0.00, writes: 4745.05, response time: 19.35ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 480.00, reads: 0.00, writes: 4799.50, response time: 19.19ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 475.50, reads: 0.00, writes: 4757.99, response time: 19.04ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 495.00, reads: 0.00, writes: 4950.95, response time: 18.61ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 478.01, reads: 0.00, writes: 4781.06, response time: 19.16ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 481.49, reads: 0.00, writes: 4814.93, response time: 19.06ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 488.00, reads: 0.00, writes: 4874.50, response time: 18.81ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 499.01, reads: 0.00, writes: 4991.06, response time: 18.37ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 476.01, reads: 0.00, writes: 4759.59, response time: 18.85ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 482.99, reads: 0.00, writes: 4841.37, response time: 19.03ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 487.50, reads: 0.00, writes: 4864.55, response time: 18.80ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 500.00, reads: 0.00, writes: 5000.50, response time: 19.24ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 498.00, reads: 0.00, writes: 4980.00, response time: 18.66ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 512.50, reads: 0.00, writes: 5128.50, response time: 18.17ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           248540
        other:                           49708
        total:                           298248
    transactions:                        24854  (487.19 per sec.)
    read/write requests:                 248540 (4871.87 per sec.)
    other operations:                    49708  (974.37 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0154s
    total number of events:              24854
    total time taken by event execution: 407.9952s
    response time:
         min:                                  3.65ms
         avg:                                 16.42ms
         max:                                 48.20ms
         approx.  95 percentile:              18.97ms

Threads fairness:
    events (avg/stddev):           3106.7500/0.97
    execution time (avg/stddev):   50.9994/0.01

