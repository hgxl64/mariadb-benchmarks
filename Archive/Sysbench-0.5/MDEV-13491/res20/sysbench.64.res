sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6231.76, reads: 0.00, writes: 62513.61, response time: 19.39ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6466.51, reads: 0.00, writes: 64583.56, response time: 18.61ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 6265.50, reads: 0.00, writes: 62678.53, response time: 19.41ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 6527.00, reads: 0.00, writes: 65330.02, response time: 18.17ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 6599.00, reads: 0.00, writes: 65951.01, response time: 17.92ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6485.50, reads: 0.00, writes: 64934.01, response time: 18.74ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6504.49, reads: 0.00, writes: 65027.93, response time: 18.41ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 6580.00, reads: 0.00, writes: 65784.54, response time: 18.45ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6543.00, reads: 0.00, writes: 65506.50, response time: 18.16ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 6465.00, reads: 0.00, writes: 64532.51, response time: 19.10ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 6246.00, reads: 0.00, writes: 62466.98, response time: 19.06ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6431.99, reads: 0.00, writes: 64392.43, response time: 18.43ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 6166.00, reads: 0.00, writes: 61593.03, response time: 20.20ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 6394.00, reads: 0.00, writes: 63902.99, response time: 19.10ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6383.00, reads: 0.00, writes: 63932.05, response time: 19.23ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6382.50, reads: 0.00, writes: 63771.51, response time: 18.94ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6313.49, reads: 0.00, writes: 63102.92, response time: 19.51ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6261.50, reads: 0.00, writes: 62607.54, response time: 19.89ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6197.00, reads: 0.00, writes: 62096.48, response time: 20.61ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6400.50, reads: 0.00, writes: 63979.98, response time: 18.61ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6304.01, reads: 0.00, writes: 62923.05, response time: 19.50ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6374.50, reads: 0.00, writes: 63824.49, response time: 19.14ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6181.49, reads: 0.00, writes: 61827.45, response time: 20.01ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6247.01, reads: 0.00, writes: 62405.08, response time: 20.49ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6207.50, reads: 0.00, writes: 62165.51, response time: 20.08ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3248620
        other:                           649724
        total:                           3898344
    transactions:                        324862 (6369.48 per sec.)
    read/write requests:                 3248620 (63694.85 per sec.)
    other operations:                    649724 (12738.97 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0029s
    total number of events:              324862
    total time taken by event execution: 3263.6100s
    response time:
         min:                                  1.39ms
         avg:                                 10.05ms
         max:                                 87.29ms
         approx.  95 percentile:              19.14ms

Threads fairness:
    events (avg/stddev):           5075.9688/33.88
    execution time (avg/stddev):   50.9939/0.00

