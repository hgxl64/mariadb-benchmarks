sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6438.74, reads: 0.00, writes: 64553.34, response time: 18.36ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 7003.02, reads: 0.00, writes: 69963.70, response time: 16.11ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 7108.50, reads: 0.00, writes: 71172.53, response time: 15.59ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 7141.50, reads: 0.00, writes: 71304.49, response time: 15.53ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 7198.49, reads: 0.00, writes: 72016.43, response time: 15.08ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6939.50, reads: 0.00, writes: 69414.50, response time: 16.80ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6981.00, reads: 0.00, writes: 69807.46, response time: 15.82ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 6889.00, reads: 0.00, writes: 69029.52, response time: 16.50ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 6964.00, reads: 0.00, writes: 69574.00, response time: 16.40ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 7200.00, reads: 0.00, writes: 71977.51, response time: 14.54ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 7088.50, reads: 0.00, writes: 70886.03, response time: 15.34ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6781.00, reads: 0.00, writes: 67771.50, response time: 17.10ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 6619.00, reads: 0.00, writes: 66342.04, response time: 18.96ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 7158.49, reads: 0.00, writes: 71490.93, response time: 15.09ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6832.00, reads: 0.00, writes: 68234.51, response time: 16.53ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 7062.50, reads: 0.00, writes: 70685.50, response time: 16.03ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6738.50, reads: 0.00, writes: 67448.99, response time: 16.90ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6883.00, reads: 0.00, writes: 68787.48, response time: 16.56ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6630.00, reads: 0.00, writes: 66332.52, response time: 18.85ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6910.00, reads: 0.00, writes: 69023.00, response time: 16.06ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 7492.00, reads: 0.00, writes: 74803.01, response time: 13.91ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6689.99, reads: 0.00, writes: 67002.41, response time: 17.16ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6952.01, reads: 0.00, writes: 69668.12, response time: 16.38ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 7128.50, reads: 0.00, writes: 71254.00, response time: 14.84ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6375.99, reads: 0.00, writes: 63764.94, response time: 20.52ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3534820
        other:                           706964
        total:                           4241784
    transactions:                        353482 (6930.30 per sec.)
    read/write requests:                 3534820 (69303.05 per sec.)
    other operations:                    706964 (13860.61 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0053s
    total number of events:              353482
    total time taken by event execution: 3263.7149s
    response time:
         min:                                  1.11ms
         avg:                                  9.23ms
         max:                                 92.37ms
         approx.  95 percentile:              16.18ms

Threads fairness:
    events (avg/stddev):           5523.1562/29.74
    execution time (avg/stddev):   50.9955/0.00

