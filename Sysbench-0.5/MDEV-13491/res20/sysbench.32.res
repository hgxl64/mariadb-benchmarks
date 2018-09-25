sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5510.29, reads: 0.00, writes: 55179.35, response time: 8.89ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5762.51, reads: 0.00, writes: 57708.63, response time: 8.43ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 5940.00, reads: 0.00, writes: 59400.02, response time: 8.00ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 5870.49, reads: 0.00, writes: 58609.42, response time: 8.15ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 5741.00, reads: 0.00, writes: 57505.52, response time: 8.79ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 5755.51, reads: 0.00, writes: 57552.09, response time: 8.54ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 5726.50, reads: 0.00, writes: 57210.50, response time: 8.47ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 5871.50, reads: 0.00, writes: 58772.47, response time: 8.35ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 5783.50, reads: 0.00, writes: 57784.03, response time: 8.76ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 5748.99, reads: 0.00, writes: 57486.92, response time: 8.77ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5685.51, reads: 0.00, writes: 56909.08, response time: 8.73ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5689.50, reads: 0.00, writes: 56888.45, response time: 8.88ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 5707.00, reads: 0.00, writes: 57074.50, response time: 8.64ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 5714.50, reads: 0.00, writes: 57147.03, response time: 8.56ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 5657.00, reads: 0.00, writes: 56523.52, response time: 8.97ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 5663.99, reads: 0.00, writes: 56668.93, response time: 8.97ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 5517.00, reads: 0.00, writes: 55118.02, response time: 9.29ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 5755.00, reads: 0.00, writes: 57550.96, response time: 8.62ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5683.00, reads: 0.00, writes: 56813.55, response time: 8.62ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 5729.50, reads: 0.00, writes: 57346.03, response time: 8.70ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5703.49, reads: 0.00, writes: 56951.87, response time: 8.73ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 5488.51, reads: 0.00, writes: 54944.09, response time: 9.26ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 5555.00, reads: 0.00, writes: 55577.54, response time: 9.39ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5582.00, reads: 0.00, writes: 55774.99, response time: 8.83ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5533.49, reads: 0.00, writes: 55312.44, response time: 9.04ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           2902950
        other:                           580590
        total:                           3483540
    transactions:                        290295 (5691.23 per sec.)
    read/write requests:                 2902950 (56912.27 per sec.)
    other operations:                    580590 (11382.45 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0075s
    total number of events:              290295
    total time taken by event execution: 1631.7464s
    response time:
         min:                                  0.75ms
         avg:                                  5.62ms
         max:                                 48.86ms
         approx.  95 percentile:               8.75ms

Threads fairness:
    events (avg/stddev):           9071.7188/21.61
    execution time (avg/stddev):   50.9921/0.00

