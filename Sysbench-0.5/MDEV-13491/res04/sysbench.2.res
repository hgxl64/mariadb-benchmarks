sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 491.64, reads: 0.00, writes: 9852.90, response time: 5.44ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 497.50, reads: 0.00, writes: 9940.95, response time: 5.36ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 499.01, reads: 0.00, writes: 9982.63, response time: 5.46ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 475.99, reads: 0.00, writes: 9516.38, response time: 5.78ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 484.51, reads: 0.00, writes: 9697.11, response time: 5.54ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 472.49, reads: 0.00, writes: 9444.39, response time: 5.83ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 497.50, reads: 0.00, writes: 9955.59, response time: 5.40ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 467.99, reads: 0.00, writes: 9362.37, response time: 5.82ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 493.01, reads: 0.00, writes: 9855.65, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 521.50, reads: 0.00, writes: 10427.91, response time: 5.13ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 521.01, reads: 0.00, writes: 10427.23, response time: 5.35ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 496.49, reads: 0.00, writes: 9923.25, response time: 5.36ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 493.01, reads: 0.00, writes: 9862.62, response time: 5.45ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 479.99, reads: 0.00, writes: 9597.89, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 511.51, reads: 0.00, writes: 10226.25, response time: 5.24ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 479.49, reads: 0.00, writes: 9594.33, response time: 5.58ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 494.50, reads: 0.00, writes: 9888.05, response time: 5.55ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 498.99, reads: 0.00, writes: 9978.89, response time: 5.53ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 501.50, reads: 0.00, writes: 10029.91, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 515.00, reads: 0.00, writes: 10303.59, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 510.01, reads: 0.00, writes: 10201.23, response time: 5.43ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 510.50, reads: 0.00, writes: 10201.52, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 504.50, reads: 0.00, writes: 10092.47, response time: 5.67ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 480.49, reads: 0.00, writes: 9616.74, response time: 5.44ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 498.01, reads: 0.00, writes: 9950.66, response time: 5.29ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           505300
        other:                           50530
        total:                           555830
    transactions:                        25265  (495.36 per sec.)
    read/write requests:                 505300 (9907.11 per sec.)
    other operations:                    50530  (990.71 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0038s
    total number of events:              25265
    total time taken by event execution: 101.9579s
    response time:
         min:                                  1.32ms
         avg:                                  4.04ms
         max:                                 31.13ms
         approx.  95 percentile:               5.48ms

Threads fairness:
    events (avg/stddev):           12632.5000/11.50
    execution time (avg/stddev):   50.9790/0.00

