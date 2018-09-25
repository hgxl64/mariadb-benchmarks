sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 281.57, reads: 0.00, writes: 2817.71, response time: 4.84ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 306.00, reads: 0.00, writes: 3063.02, response time: 4.31ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 313.00, reads: 0.00, writes: 3130.04, response time: 4.43ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 330.50, reads: 0.00, writes: 3304.96, response time: 3.95ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 281.50, reads: 0.00, writes: 2811.02, response time: 4.62ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 286.50, reads: 0.00, writes: 2868.98, response time: 4.64ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 296.50, reads: 0.00, writes: 2965.03, response time: 4.55ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 314.50, reads: 0.00, writes: 3144.97, response time: 4.22ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 273.00, reads: 0.00, writes: 2730.03, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 269.00, reads: 0.00, writes: 2689.97, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 265.00, reads: 0.00, writes: 2649.52, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 285.50, reads: 0.00, writes: 2855.47, response time: 4.72ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 287.50, reads: 0.00, writes: 2874.98, response time: 4.75ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 274.50, reads: 0.00, writes: 2740.98, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 286.01, reads: 0.00, writes: 2864.07, response time: 4.59ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 285.00, reads: 0.00, writes: 2849.47, response time: 4.74ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 280.00, reads: 0.00, writes: 2800.53, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 263.50, reads: 0.00, writes: 2633.97, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 278.50, reads: 0.00, writes: 2785.03, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 276.00, reads: 0.00, writes: 2760.98, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 277.00, reads: 0.00, writes: 2770.03, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 295.00, reads: 0.00, writes: 2947.47, response time: 4.66ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 283.50, reads: 0.00, writes: 2835.53, response time: 4.74ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 275.50, reads: 0.00, writes: 2756.97, response time: 4.84ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 272.50, reads: 0.00, writes: 2724.53, response time: 4.82ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           145510
        other:                           29102
        total:                           174612
    transactions:                        14551  (285.31 per sec.)
    read/write requests:                 145510 (2853.12 per sec.)
    other operations:                    29102  (570.62 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0004s
    total number of events:              14551
    total time taken by event execution: 50.9752s
    response time:
         min:                                  1.19ms
         avg:                                  3.50ms
         max:                                 17.61ms
         approx.  95 percentile:               4.77ms

Threads fairness:
    events (avg/stddev):           14551.0000/0.00
    execution time (avg/stddev):   50.9752/0.00

