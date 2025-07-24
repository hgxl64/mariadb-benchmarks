sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 557.64, reads: 0.00, writes: 5586.41, response time: 4.85ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 547.00, reads: 0.00, writes: 5465.00, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 564.50, reads: 0.00, writes: 5645.01, response time: 4.60ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 545.50, reads: 0.00, writes: 5460.00, response time: 4.75ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 568.00, reads: 0.00, writes: 5679.98, response time: 4.76ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 562.50, reads: 0.00, writes: 5624.48, response time: 4.91ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 542.50, reads: 0.00, writes: 5425.04, response time: 5.04ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 571.50, reads: 0.00, writes: 5714.01, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 573.00, reads: 0.00, writes: 5731.49, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 566.50, reads: 0.00, writes: 5664.96, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 590.50, reads: 0.00, writes: 5905.05, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 556.50, reads: 0.00, writes: 5561.99, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 560.50, reads: 0.00, writes: 5608.01, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 571.49, reads: 0.00, writes: 5710.44, response time: 4.62ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 545.00, reads: 0.00, writes: 5450.05, response time: 4.87ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 551.99, reads: 0.00, writes: 5520.91, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 560.01, reads: 0.00, writes: 5603.60, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 576.50, reads: 0.00, writes: 5765.00, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 582.50, reads: 0.00, writes: 5824.51, response time: 4.82ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 570.50, reads: 0.00, writes: 5703.99, response time: 5.34ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 593.50, reads: 0.00, writes: 5931.99, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 580.00, reads: 0.00, writes: 5804.52, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 564.00, reads: 0.00, writes: 5639.98, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 554.00, reads: 0.00, writes: 5536.52, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 559.00, reads: 0.00, writes: 5593.01, response time: 5.03ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           287770
        other:                           57554
        total:                           345324
    transactions:                        28777  (564.22 per sec.)
    read/write requests:                 287770 (5642.20 per sec.)
    other operations:                    57554  (1128.44 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0032s
    total number of events:              28777
    total time taken by event execution: 101.9528s
    response time:
         min:                                  0.93ms
         avg:                                  3.54ms
         max:                                 14.12ms
         approx.  95 percentile:               4.92ms

Threads fairness:
    events (avg/stddev):           14388.5000/3.50
    execution time (avg/stddev):   50.9764/0.00

