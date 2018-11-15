sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 7847.64, reads: 110030.40, writes: 0.00, response time: 5.79ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 8361.03, reads: 117029.92, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 8348.50, reads: 116878.99, writes: 0.00, response time: 5.43ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 8361.50, reads: 117061.48, writes: 0.00, response time: 5.30ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 8409.49, reads: 117729.92, writes: 0.00, response time: 5.28ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 8343.01, reads: 116812.58, writes: 0.00, response time: 5.66ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 8405.50, reads: 117669.50, writes: 0.00, response time: 5.35ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 8363.91, reads: 117096.30, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 8368.58, reads: 117150.14, writes: 0.00, response time: 5.21ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 8378.00, reads: 117300.98, writes: 0.00, response time: 5.47ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 8367.00, reads: 117147.56, writes: 0.00, response time: 5.29ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 8381.00, reads: 117333.44, writes: 0.00, response time: 5.22ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 8350.43, reads: 116897.03, writes: 0.00, response time: 5.40ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 8397.58, reads: 117562.15, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 8367.99, reads: 117181.40, writes: 0.00, response time: 5.26ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 8364.99, reads: 117092.81, writes: 0.00, response time: 5.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 8387.01, reads: 117429.16, writes: 0.00, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 8393.99, reads: 117503.91, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 8359.01, reads: 117022.57, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 8390.01, reads: 117470.69, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 8407.49, reads: 117681.81, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 8409.01, reads: 117731.15, writes: 0.00, response time: 5.17ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 8382.49, reads: 117363.35, writes: 0.00, response time: 5.21ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 8329.50, reads: 116611.97, writes: 0.00, response time: 5.33ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 8379.50, reads: 117306.48, writes: 0.00, response time: 5.48ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 8389.01, reads: 117444.10, writes: 0.00, response time: 5.37ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8390.00, reads: 117470.00, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8403.50, reads: 117638.94, writes: 0.00, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8346.50, reads: 116852.05, writes: 0.00, response time: 5.38ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8283.50, reads: 115973.95, writes: 0.00, response time: 5.61ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            7136346
        write:                           0
        other:                           1019478
        total:                           8155824
    transactions:                        509739 (8355.94 per sec.)
    read/write requests:                 7136346 (116983.12 per sec.)
    other operations:                    1019478 (16711.87 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0032s
    total number of events:              509739
    total time taken by event execution: 1951.1910s
    response time:
         min:                                  2.26ms
         avg:                                  3.83ms
         max:                                 24.76ms
         approx.  95 percentile:               5.31ms

Threads fairness:
    events (avg/stddev):           15929.3438/176.84
    execution time (avg/stddev):   60.9747/0.00

