sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 8042.58, reads: 112739.17, writes: 0.00, response time: 5.71ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 8286.12, reads: 116005.20, writes: 0.00, response time: 5.42ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 8355.00, reads: 116961.48, writes: 0.00, response time: 5.71ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 8481.49, reads: 118758.40, writes: 0.00, response time: 5.40ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 8443.02, reads: 118192.71, writes: 0.00, response time: 5.41ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 8519.99, reads: 119275.38, writes: 0.00, response time: 5.43ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 8499.50, reads: 118991.47, writes: 0.00, response time: 5.38ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 8437.50, reads: 118139.99, writes: 0.00, response time: 5.32ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 8451.50, reads: 118305.54, writes: 0.00, response time: 5.39ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 8426.50, reads: 117965.44, writes: 0.00, response time: 5.52ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 8497.01, reads: 118964.09, writes: 0.00, response time: 5.37ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 8479.99, reads: 118734.86, writes: 0.00, response time: 5.32ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 8454.51, reads: 118359.60, writes: 0.00, response time: 5.17ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 8505.50, reads: 119078.04, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 8464.50, reads: 118488.96, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 8492.01, reads: 118909.14, writes: 0.00, response time: 5.07ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 8486.49, reads: 118808.41, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 8449.00, reads: 118268.48, writes: 0.00, response time: 5.17ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 8488.50, reads: 118844.46, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 8409.00, reads: 117736.50, writes: 0.00, response time: 5.54ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 8515.00, reads: 119207.55, writes: 0.00, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 8466.50, reads: 118541.05, writes: 0.00, response time: 5.21ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 8468.00, reads: 118529.45, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 8457.50, reads: 118419.51, writes: 0.00, response time: 5.26ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 8480.51, reads: 118751.61, writes: 0.00, response time: 5.17ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 8484.99, reads: 118754.91, writes: 0.00, response time: 5.14ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8467.50, reads: 118542.43, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8475.47, reads: 118653.12, writes: 0.00, response time: 5.13ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8464.03, reads: 118554.48, writes: 0.00, response time: 5.25ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8461.49, reads: 118417.43, writes: 0.00, response time: 5.44ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            7214256
        write:                           0
        other:                           1030608
        total:                           8244864
    transactions:                        515304 (8447.23 per sec.)
    read/write requests:                 7214256 (118261.26 per sec.)
    other operations:                    1030608 (16894.47 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0027s
    total number of events:              515304
    total time taken by event execution: 1951.2205s
    response time:
         min:                                  2.18ms
         avg:                                  3.79ms
         max:                                 31.58ms
         approx.  95 percentile:               5.30ms

Threads fairness:
    events (avg/stddev):           16103.2500/205.43
    execution time (avg/stddev):   60.9756/0.00

