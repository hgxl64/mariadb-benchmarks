sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6134.77, reads: 0.00, writes: 61501.16, response time: 18.24ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6744.03, reads: 0.00, writes: 67539.77, response time: 17.07ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 6996.99, reads: 0.00, writes: 69895.36, response time: 15.60ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 6996.92, reads: 0.00, writes: 69834.73, response time: 15.69ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 6960.08, reads: 0.00, writes: 69713.84, response time: 16.33ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6908.01, reads: 0.00, writes: 69018.55, response time: 16.00ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 7287.49, reads: 0.00, writes: 73023.93, response time: 14.31ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 7375.99, reads: 0.00, writes: 73757.44, response time: 14.65ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6960.00, reads: 0.00, writes: 69610.54, response time: 16.52ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 7114.51, reads: 0.00, writes: 70954.08, response time: 14.79ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 7249.47, reads: 0.00, writes: 72555.65, response time: 14.69ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 7060.51, reads: 0.00, writes: 70711.14, response time: 15.47ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 7177.51, reads: 0.00, writes: 71855.58, response time: 15.19ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 6753.00, reads: 0.00, writes: 67540.99, response time: 17.34ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 7039.49, reads: 0.00, writes: 70175.94, response time: 16.00ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 7223.01, reads: 0.00, writes: 72226.05, response time: 14.72ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6833.00, reads: 0.00, writes: 68472.97, response time: 16.58ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6447.50, reads: 0.00, writes: 64554.99, response time: 18.82ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6425.94, reads: 0.00, writes: 64175.94, response time: 20.73ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6959.56, reads: 0.00, writes: 69615.60, response time: 16.39ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 7515.49, reads: 0.00, writes: 75130.43, response time: 13.63ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6920.01, reads: 0.00, writes: 69179.11, response time: 16.43ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6758.50, reads: 0.00, writes: 67590.48, response time: 17.73ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6622.95, reads: 0.00, writes: 66276.01, response time: 19.07ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 7027.55, reads: 0.00, writes: 70185.99, response time: 15.77ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3540870
        other:                           708174
        total:                           4249044
    transactions:                        354087 (6941.85 per sec.)
    read/write requests:                 3540870 (69418.51 per sec.)
    other operations:                    708174 (13883.70 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0076s
    total number of events:              354087
    total time taken by event execution: 3263.7391s
    response time:
         min:                                  1.08ms
         avg:                                  9.22ms
         max:                                130.53ms
         approx.  95 percentile:              16.08ms

Threads fairness:
    events (avg/stddev):           5532.6094/25.76
    execution time (avg/stddev):   50.9959/0.00

