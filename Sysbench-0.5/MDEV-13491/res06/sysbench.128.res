sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 5697.27, reads: 0.00, writes: 57278.16, response time: 54.66ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 6370.52, reads: 0.00, writes: 63660.73, response time: 44.17ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 6340.00, reads: 0.00, writes: 63465.03, response time: 45.10ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 6593.50, reads: 0.00, writes: 66034.49, response time: 42.44ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 6540.49, reads: 0.00, writes: 65415.43, response time: 42.82ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 6489.00, reads: 0.00, writes: 64845.03, response time: 42.98ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 6536.00, reads: 0.00, writes: 65343.52, response time: 42.14ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6613.50, reads: 0.00, writes: 66094.00, response time: 41.44ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 6238.50, reads: 0.00, writes: 62441.98, response time: 46.66ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 6735.00, reads: 0.00, writes: 67433.03, response time: 41.07ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 6683.99, reads: 0.00, writes: 66809.43, response time: 40.36ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 6656.00, reads: 0.00, writes: 66435.01, response time: 40.84ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6687.50, reads: 0.00, writes: 66930.54, response time: 40.45ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 6880.50, reads: 0.00, writes: 68737.97, response time: 38.78ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 6387.00, reads: 0.00, writes: 63804.03, response time: 45.13ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 6541.00, reads: 0.00, writes: 65469.52, response time: 42.46ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 6393.00, reads: 0.00, writes: 63901.96, response time: 43.80ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 6681.43, reads: 0.00, writes: 66800.29, response time: 39.33ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6767.08, reads: 0.00, writes: 67735.28, response time: 40.92ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6481.49, reads: 0.00, writes: 64870.44, response time: 42.14ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 6399.50, reads: 0.00, writes: 64043.54, response time: 44.49ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 6741.50, reads: 0.00, writes: 67347.47, response time: 40.31ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 6449.00, reads: 0.00, writes: 64462.48, response time: 42.69ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 6729.00, reads: 0.00, writes: 67223.02, response time: 40.75ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 6645.34, reads: 0.00, writes: 66602.40, response time: 39.89ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3333760
        other:                           666752
        total:                           4000512
    transactions:                        333376 (6535.24 per sec.)
    read/write requests:                 3333760 (65352.40 per sec.)
    other operations:                    666752 (13070.48 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0121s
    total number of events:              333376
    total time taken by event execution: 6528.1604s
    response time:
         min:                                  1.27ms
         avg:                                 19.58ms
         max:                                156.36ms
         approx.  95 percentile:              42.25ms

Threads fairness:
    events (avg/stddev):           2604.5000/27.86
    execution time (avg/stddev):   51.0013/0.01

