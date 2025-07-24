sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 428.62, reads: 0.00, writes: 8577.49, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 445.50, reads: 0.00, writes: 8925.04, response time: 5.63ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 445.00, reads: 0.00, writes: 8890.51, response time: 5.68ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 446.50, reads: 0.00, writes: 8939.49, response time: 5.56ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 465.00, reads: 0.00, writes: 9290.00, response time: 5.48ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 439.50, reads: 0.00, writes: 8792.00, response time: 5.84ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 440.49, reads: 0.00, writes: 8807.38, response time: 5.85ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 448.50, reads: 0.00, writes: 8979.01, response time: 5.80ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 433.50, reads: 0.00, writes: 8667.98, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 442.50, reads: 0.00, writes: 8844.09, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 453.50, reads: 0.00, writes: 9069.91, response time: 5.71ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 441.01, reads: 0.00, writes: 8821.64, response time: 5.71ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 430.00, reads: 0.00, writes: 8600.99, response time: 5.69ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 466.50, reads: 0.00, writes: 9336.93, response time: 5.48ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 444.00, reads: 0.00, writes: 8880.05, response time: 5.73ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 437.50, reads: 0.00, writes: 8745.01, response time: 5.75ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 429.00, reads: 0.00, writes: 8578.00, response time: 5.91ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 422.00, reads: 0.00, writes: 8440.50, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 440.00, reads: 0.00, writes: 8801.43, response time: 5.73ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 454.50, reads: 0.00, writes: 9090.58, response time: 5.68ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 439.50, reads: 0.00, writes: 8780.50, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 442.00, reads: 0.00, writes: 8850.49, response time: 5.88ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 444.50, reads: 0.00, writes: 8887.49, response time: 5.83ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 435.00, reads: 0.00, writes: 8697.00, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 455.00, reads: 0.00, writes: 9105.99, response time: 5.62ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           451780
        other:                           45178
        total:                           496958
    transactions:                        22589  (442.89 per sec.)
    read/write requests:                 451780 (8857.79 per sec.)
    other operations:                    45178  (885.78 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0037s
    total number of events:              22589
    total time taken by event execution: 101.9595s
    response time:
         min:                                  1.66ms
         avg:                                  4.51ms
         max:                                 32.88ms
         approx.  95 percentile:               5.77ms

Threads fairness:
    events (avg/stddev):           11294.5000/0.50
    execution time (avg/stddev):   50.9797/0.00

