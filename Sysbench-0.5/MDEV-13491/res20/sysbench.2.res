sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 564.65, reads: 0.00, writes: 5654.48, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 539.51, reads: 0.00, writes: 5397.07, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 563.00, reads: 0.00, writes: 5627.46, response time: 4.77ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 564.52, reads: 0.00, writes: 5643.67, response time: 4.83ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 556.99, reads: 0.00, writes: 5568.90, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 546.51, reads: 0.00, writes: 5467.09, response time: 4.99ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 527.49, reads: 0.00, writes: 5272.91, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 549.51, reads: 0.00, writes: 5500.10, response time: 4.88ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 554.99, reads: 0.00, writes: 5549.89, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 546.50, reads: 0.00, writes: 5464.98, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 571.00, reads: 0.00, writes: 5710.03, response time: 4.96ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 580.51, reads: 0.00, writes: 5805.11, response time: 4.79ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 561.99, reads: 0.00, writes: 5615.39, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 555.01, reads: 0.00, writes: 5554.59, response time: 5.02ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 548.99, reads: 0.00, writes: 5489.89, response time: 4.92ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 549.01, reads: 0.00, writes: 5490.11, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 558.99, reads: 0.00, writes: 5589.91, response time: 4.93ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 542.00, reads: 0.00, writes: 5419.96, response time: 4.97ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 537.50, reads: 0.00, writes: 5375.02, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 532.51, reads: 0.00, writes: 5325.09, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 540.49, reads: 0.00, writes: 5399.89, response time: 4.90ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 545.51, reads: 0.00, writes: 5460.12, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 542.99, reads: 0.00, writes: 5429.91, response time: 4.79ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 543.00, reads: 0.00, writes: 5430.02, response time: 4.89ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 539.49, reads: 0.00, writes: 5394.90, response time: 4.94ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           280800
        other:                           56160
        total:                           336960
    transactions:                        28080  (550.57 per sec.)
    read/write requests:                 280800 (5505.68 per sec.)
    other operations:                    56160  (1101.14 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0019s
    total number of events:              28080
    total time taken by event execution: 101.9553s
    response time:
         min:                                  0.91ms
         avg:                                  3.63ms
         max:                                 14.95ms
         approx.  95 percentile:               4.93ms

Threads fairness:
    events (avg/stddev):           14040.0000/5.00
    execution time (avg/stddev):   50.9776/0.00

