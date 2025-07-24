sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3384.50, reads: 0.00, writes: 33910.48, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3299.50, reads: 0.00, writes: 33004.02, response time: 7.18ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3407.01, reads: 0.00, writes: 34075.65, response time: 7.12ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3448.00, reads: 0.00, writes: 34441.48, response time: 6.88ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3394.00, reads: 0.00, writes: 33944.98, response time: 6.95ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3411.49, reads: 0.00, writes: 34140.44, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3405.50, reads: 0.00, writes: 34043.51, response time: 6.99ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3466.01, reads: 0.00, writes: 34637.59, response time: 7.09ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3222.50, reads: 0.00, writes: 32240.97, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3330.94, reads: 0.00, writes: 33330.41, response time: 7.37ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3336.56, reads: 0.00, writes: 33333.62, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3433.50, reads: 0.00, writes: 34308.48, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3361.99, reads: 0.00, writes: 33674.94, response time: 7.27ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3358.50, reads: 0.00, writes: 33585.53, response time: 7.23ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3380.00, reads: 0.00, writes: 33777.00, response time: 7.10ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3322.50, reads: 0.00, writes: 33232.01, response time: 7.42ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3393.99, reads: 0.00, writes: 33941.92, response time: 7.14ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3511.01, reads: 0.00, writes: 35086.10, response time: 6.96ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3407.49, reads: 0.00, writes: 34120.93, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3335.51, reads: 0.00, writes: 33355.10, response time: 7.29ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3368.49, reads: 0.00, writes: 33684.95, response time: 6.93ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3467.99, reads: 0.00, writes: 34660.41, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3376.01, reads: 0.00, writes: 33775.13, response time: 7.20ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3397.99, reads: 0.00, writes: 33984.40, response time: 6.98ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3526.00, reads: 0.00, writes: 35260.03, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1728020
        other:                           345604
        total:                           2073624
    transactions:                        172802 (3387.98 per sec.)
    read/write requests:                 1728020 (33879.79 per sec.)
    other operations:                    345604 (6775.96 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0045s
    total number of events:              172802
    total time taken by event execution: 815.6810s
    response time:
         min:                                  0.92ms
         avg:                                  4.72ms
         max:                                 45.97ms
         approx.  95 percentile:               7.12ms

Threads fairness:
    events (avg/stddev):           10800.1250/31.13
    execution time (avg/stddev):   50.9801/0.00

