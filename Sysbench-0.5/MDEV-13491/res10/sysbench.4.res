sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 985.73, reads: 0.00, writes: 9873.79, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 985.50, reads: 0.00, writes: 9856.46, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 1011.51, reads: 0.00, writes: 10117.07, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 1011.00, reads: 0.00, writes: 10109.96, response time: 6.25ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 968.50, reads: 0.00, writes: 9685.04, response time: 6.39ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 1008.51, reads: 0.00, writes: 10085.11, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 1043.50, reads: 0.00, writes: 10417.97, response time: 5.76ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 1012.50, reads: 0.00, writes: 10138.02, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 996.49, reads: 0.00, writes: 9968.87, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 1020.50, reads: 0.00, writes: 10202.48, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 991.00, reads: 0.00, writes: 9898.51, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 985.51, reads: 0.00, writes: 9869.12, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 1017.00, reads: 0.00, writes: 10170.01, response time: 5.89ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 1028.48, reads: 0.00, writes: 10280.84, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 991.01, reads: 0.00, writes: 9910.64, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 1011.49, reads: 0.00, writes: 10118.36, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1020.51, reads: 0.00, writes: 10195.14, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 974.99, reads: 0.00, writes: 9752.87, response time: 6.40ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 995.51, reads: 0.00, writes: 9958.65, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 1030.98, reads: 0.00, writes: 10308.33, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 1013.02, reads: 0.00, writes: 10130.17, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 1022.50, reads: 0.00, writes: 10225.01, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 1027.99, reads: 0.00, writes: 10284.90, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 1019.49, reads: 0.00, writes: 10194.93, response time: 5.93ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 1011.50, reads: 0.00, writes: 10112.51, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           514130
        other:                           102826
        total:                           616956
    transactions:                        51413  (1008.05 per sec.)
    read/write requests:                 514130 (10080.49 per sec.)
    other operations:                    102826 (2016.10 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0025s
    total number of events:              51413
    total time taken by event execution: 203.8991s
    response time:
         min:                                  1.00ms
         avg:                                  3.97ms
         max:                                 19.51ms
         approx.  95 percentile:               6.08ms

Threads fairness:
    events (avg/stddev):           12853.2500/16.62
    execution time (avg/stddev):   50.9748/0.00

