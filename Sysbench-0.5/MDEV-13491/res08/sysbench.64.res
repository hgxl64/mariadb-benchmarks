sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6531.73, reads: 0.00, writes: 65602.84, response time: 17.53ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6822.51, reads: 0.00, writes: 68193.65, response time: 16.18ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 7079.99, reads: 0.00, writes: 70751.94, response time: 14.83ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 7067.51, reads: 0.00, writes: 70627.08, response time: 15.73ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 7062.00, reads: 0.00, writes: 70630.03, response time: 15.79ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6874.96, reads: 0.00, writes: 68829.55, response time: 15.36ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6932.04, reads: 0.00, writes: 69263.43, response time: 15.82ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 6855.50, reads: 0.00, writes: 68448.02, response time: 16.41ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6704.00, reads: 0.00, writes: 67129.04, response time: 17.60ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 7061.50, reads: 0.00, writes: 70610.97, response time: 15.34ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 6524.50, reads: 0.00, writes: 65254.03, response time: 19.71ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6920.50, reads: 0.00, writes: 69218.96, response time: 16.51ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 6776.50, reads: 0.00, writes: 67721.48, response time: 16.45ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 7144.50, reads: 0.00, writes: 71473.52, response time: 14.66ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 7051.50, reads: 0.00, writes: 70402.50, response time: 15.31ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6816.49, reads: 0.00, writes: 68351.40, response time: 16.36ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6911.50, reads: 0.00, writes: 69036.54, response time: 15.82ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6860.00, reads: 0.00, writes: 68607.04, response time: 16.53ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6807.50, reads: 0.00, writes: 68205.00, response time: 16.93ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 7191.50, reads: 0.00, writes: 71785.03, response time: 15.27ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6343.50, reads: 0.00, writes: 63528.01, response time: 19.26ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6783.49, reads: 0.00, writes: 67770.42, response time: 16.96ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6831.00, reads: 0.00, writes: 68301.98, response time: 17.74ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6813.49, reads: 0.00, writes: 68251.38, response time: 17.60ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 7024.52, reads: 0.00, writes: 70125.68, response time: 16.26ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3498680
        other:                           699736
        total:                           4198416
    transactions:                        349868 (6859.33 per sec.)
    read/write requests:                 3498680 (68593.29 per sec.)
    other operations:                    699736 (13718.66 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0062s
    total number of events:              349868
    total time taken by event execution: 3263.7091s
    response time:
         min:                                  1.02ms
         avg:                                  9.33ms
         max:                                 99.34ms
         approx.  95 percentile:              16.43ms

Threads fairness:
    events (avg/stddev):           5466.6875/26.12
    execution time (avg/stddev):   50.9955/0.00

