sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 504.47, reads: 0.00, writes: 5130.18, response time: 67.95ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 526.51, reads: 0.00, writes: 5260.10, response time: 71.82ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 527.50, reads: 0.00, writes: 5265.00, response time: 63.54ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 527.00, reads: 0.00, writes: 5259.51, response time: 64.89ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 534.50, reads: 0.00, writes: 5361.00, response time: 68.03ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 546.51, reads: 0.00, writes: 5452.10, response time: 66.94ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 547.49, reads: 0.00, writes: 5489.90, response time: 62.10ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 545.51, reads: 0.00, writes: 5441.59, response time: 64.00ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 535.49, reads: 0.00, writes: 5358.91, response time: 63.51ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 530.01, reads: 0.00, writes: 5303.63, response time: 69.43ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 522.48, reads: 0.00, writes: 5223.84, response time: 65.43ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 509.50, reads: 0.00, writes: 5106.03, response time: 69.26ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 519.99, reads: 0.00, writes: 5184.95, response time: 65.59ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 527.51, reads: 0.00, writes: 5277.56, response time: 63.94ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 520.50, reads: 0.00, writes: 5213.50, response time: 66.86ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 533.49, reads: 0.00, writes: 5339.92, response time: 64.19ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 529.00, reads: 0.00, writes: 5281.52, response time: 64.50ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 530.01, reads: 0.00, writes: 5292.57, response time: 64.66ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 531.49, reads: 0.00, writes: 5323.93, response time: 63.35ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 520.02, reads: 0.00, writes: 5186.65, response time: 66.56ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 528.50, reads: 0.00, writes: 5296.48, response time: 63.01ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 544.99, reads: 0.00, writes: 5444.36, response time: 62.56ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 531.00, reads: 0.00, writes: 5323.50, response time: 68.97ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 532.51, reads: 0.00, writes: 5325.06, response time: 64.56ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 538.49, reads: 0.00, writes: 5372.94, response time: 67.71ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           270540
        other:                           54108
        total:                           324648
    transactions:                        27054  (530.11 per sec.)
    read/write requests:                 270540 (5301.14 per sec.)
    other operations:                    54108  (1060.23 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0343s
    total number of events:              27054
    total time taken by event execution: 1632.6787s
    response time:
         min:                                 36.94ms
         avg:                                 60.35ms
         max:                                 92.83ms
         approx.  95 percentile:              65.30ms

Threads fairness:
    events (avg/stddev):           845.4375/0.66
    execution time (avg/stddev):   51.0212/0.01

