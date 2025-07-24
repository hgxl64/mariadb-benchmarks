sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 418.98, reads: 0.00, writes: 8394.01, response time: 82.03ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 418.01, reads: 0.00, writes: 8358.64, response time: 80.78ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 418.50, reads: 0.00, writes: 8363.95, response time: 82.64ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 421.00, reads: 0.00, writes: 8422.06, response time: 80.54ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 415.00, reads: 0.00, writes: 8302.02, response time: 80.59ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 421.00, reads: 0.00, writes: 8424.99, response time: 80.76ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 422.00, reads: 0.00, writes: 8441.49, response time: 79.09ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 425.00, reads: 0.00, writes: 8498.51, response time: 78.52ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 425.50, reads: 0.00, writes: 8511.51, response time: 82.84ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 426.00, reads: 0.00, writes: 8506.50, response time: 78.50ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 427.00, reads: 0.00, writes: 8546.98, response time: 78.87ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 424.50, reads: 0.00, writes: 8484.02, response time: 78.12ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 420.50, reads: 0.00, writes: 8416.00, response time: 78.87ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 424.00, reads: 0.00, writes: 8475.99, response time: 78.05ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 419.00, reads: 0.00, writes: 8384.00, response time: 79.11ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 427.00, reads: 0.00, writes: 8539.50, response time: 78.68ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 423.50, reads: 0.00, writes: 8486.94, response time: 78.78ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 421.50, reads: 0.00, writes: 8410.44, response time: 78.64ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 416.00, reads: 0.00, writes: 8319.56, response time: 79.56ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 412.50, reads: 0.00, writes: 8258.06, response time: 80.28ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 417.00, reads: 0.00, writes: 8345.01, response time: 80.57ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 418.50, reads: 0.00, writes: 8370.50, response time: 79.09ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 413.00, reads: 0.00, writes: 8254.94, response time: 80.62ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 419.50, reads: 0.00, writes: 8385.07, response time: 78.99ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 415.50, reads: 0.00, writes: 8300.49, response time: 80.11ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           429240
        other:                           42924
        total:                           472164
    transactions:                        21462  (420.19 per sec.)
    read/write requests:                 429240 (8403.74 per sec.)
    other operations:                    42924  (840.37 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0772s
    total number of events:              21462
    total time taken by event execution: 1633.1817s
    response time:
         min:                                  4.60ms
         avg:                                 76.10ms
         max:                                 92.65ms
         approx.  95 percentile:              79.85ms

Threads fairness:
    events (avg/stddev):           670.6875/0.46
    execution time (avg/stddev):   51.0369/0.02

