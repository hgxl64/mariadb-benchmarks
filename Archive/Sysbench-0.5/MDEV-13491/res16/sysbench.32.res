sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 454.97, reads: 0.00, writes: 4554.18, response time: 77.26ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 457.01, reads: 0.00, writes: 4580.57, response time: 73.08ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 453.50, reads: 0.00, writes: 4524.51, response time: 79.70ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 446.50, reads: 0.00, writes: 4468.50, response time: 75.48ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 447.01, reads: 0.00, writes: 4468.56, response time: 75.16ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 458.49, reads: 0.00, writes: 4583.94, response time: 72.90ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 451.01, reads: 0.00, writes: 4514.06, response time: 75.36ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 451.50, reads: 0.00, writes: 4510.50, response time: 74.36ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 451.49, reads: 0.00, writes: 4516.93, response time: 73.74ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 452.51, reads: 0.00, writes: 4526.07, response time: 73.14ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 445.00, reads: 0.00, writes: 4447.50, response time: 74.53ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 444.50, reads: 0.00, writes: 4446.00, response time: 74.76ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 452.50, reads: 0.00, writes: 4528.51, response time: 75.05ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 453.49, reads: 0.00, writes: 4531.44, response time: 73.65ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 440.50, reads: 0.00, writes: 4402.54, response time: 75.36ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 443.00, reads: 0.00, writes: 4430.46, response time: 75.21ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 440.00, reads: 0.00, writes: 4402.00, response time: 75.59ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 450.50, reads: 0.00, writes: 4502.50, response time: 74.31ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 449.51, reads: 0.00, writes: 4499.05, response time: 74.40ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 450.50, reads: 0.00, writes: 4505.00, response time: 74.11ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 447.50, reads: 0.00, writes: 4473.01, response time: 73.60ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 443.00, reads: 0.00, writes: 4425.50, response time: 76.43ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 457.49, reads: 0.00, writes: 4582.94, response time: 74.11ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 459.00, reads: 0.00, writes: 4590.55, response time: 73.10ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 457.50, reads: 0.00, writes: 4572.45, response time: 73.87ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           230080
        other:                           46016
        total:                           276096
    transactions:                        23008  (450.55 per sec.)
    read/write requests:                 230080 (4505.46 per sec.)
    other operations:                    46016  (901.09 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0669s
    total number of events:              23008
    total time taken by event execution: 1632.9579s
    response time:
         min:                                  5.93ms
         avg:                                 70.97ms
         max:                                 86.36ms
         approx.  95 percentile:              74.56ms

Threads fairness:
    events (avg/stddev):           719.0000/0.35
    execution time (avg/stddev):   51.0299/0.02

