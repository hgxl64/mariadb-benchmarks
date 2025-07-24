sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5895.70, reads: 0.00, writes: 59034.05, response time: 8.06ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6015.02, reads: 0.00, writes: 60180.71, response time: 8.08ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 6209.51, reads: 0.00, writes: 62103.61, response time: 7.87ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6047.00, reads: 0.00, writes: 60438.50, response time: 8.37ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6105.49, reads: 0.00, writes: 61089.95, response time: 7.94ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6103.50, reads: 0.00, writes: 61054.54, response time: 8.09ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 6220.00, reads: 0.00, writes: 62220.52, response time: 8.07ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6137.49, reads: 0.00, writes: 61368.37, response time: 7.73ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6166.00, reads: 0.00, writes: 61647.53, response time: 7.98ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 5890.01, reads: 0.00, writes: 58839.56, response time: 8.29ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 6001.50, reads: 0.00, writes: 60085.46, response time: 8.18ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 6029.50, reads: 0.00, writes: 60272.46, response time: 8.19ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6206.51, reads: 0.00, writes: 62093.08, response time: 8.05ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6033.99, reads: 0.00, writes: 60314.42, response time: 7.93ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 6019.49, reads: 0.00, writes: 60163.41, response time: 8.17ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 5938.01, reads: 0.00, writes: 59393.60, response time: 8.68ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 6132.51, reads: 0.00, writes: 61362.55, response time: 8.10ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 6229.00, reads: 0.00, writes: 62212.51, response time: 7.73ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5535.50, reads: 0.00, writes: 55377.98, response time: 9.33ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 5723.00, reads: 0.00, writes: 57281.01, response time: 8.90ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 6045.50, reads: 0.00, writes: 60460.97, response time: 8.21ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 6081.50, reads: 0.00, writes: 60744.02, response time: 8.03ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 5970.50, reads: 0.00, writes: 59757.01, response time: 8.25ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 6059.50, reads: 0.00, writes: 60502.50, response time: 8.05ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5810.00, reads: 0.00, writes: 58219.03, response time: 8.13ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3070480
        other:                           614096
        total:                           3684576
    transactions:                        307048 (6020.03 per sec.)
    read/write requests:                 3070480 (60200.34 per sec.)
    other operations:                    614096 (12040.07 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0044s
    total number of events:              307048
    total time taken by event execution: 1631.6779s
    response time:
         min:                                  0.73ms
         avg:                                  5.31ms
         max:                                 49.43ms
         approx.  95 percentile:               8.15ms

Threads fairness:
    events (avg/stddev):           9595.2500/31.24
    execution time (avg/stddev):   50.9899/0.00

