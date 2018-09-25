sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 6562.24, reads: 0.00, writes: 65835.92, response time: 17.58ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 6890.01, reads: 0.00, writes: 68802.12, response time: 16.58ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 6860.50, reads: 0.00, writes: 68704.95, response time: 16.46ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 7048.00, reads: 0.00, writes: 70497.04, response time: 15.60ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 6779.00, reads: 0.00, writes: 67806.99, response time: 16.51ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 7046.00, reads: 0.00, writes: 70440.98, response time: 15.66ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 6774.99, reads: 0.00, writes: 67696.95, response time: 16.87ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 7255.01, reads: 0.00, writes: 72562.59, response time: 14.41ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 7079.50, reads: 0.00, writes: 70872.51, response time: 15.12ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 6811.50, reads: 0.00, writes: 68119.04, response time: 16.81ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 6771.99, reads: 0.00, writes: 67645.44, response time: 16.90ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6903.50, reads: 0.00, writes: 68971.54, response time: 17.24ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 7070.00, reads: 0.00, writes: 70747.45, response time: 15.28ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 7072.51, reads: 0.00, writes: 70687.57, response time: 15.02ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6743.39, reads: 0.00, writes: 67477.93, response time: 18.39ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6692.60, reads: 0.00, writes: 66907.99, response time: 16.84ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6522.50, reads: 0.00, writes: 65328.00, response time: 19.51ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6647.51, reads: 0.00, writes: 66301.56, response time: 15.83ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6871.00, reads: 0.00, writes: 68709.51, response time: 16.41ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6546.49, reads: 0.00, writes: 65518.38, response time: 17.99ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6698.00, reads: 0.00, writes: 67022.99, response time: 16.75ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6358.93, reads: 0.00, writes: 63584.79, response time: 18.30ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6719.58, reads: 0.00, writes: 67073.31, response time: 16.49ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6580.50, reads: 0.00, writes: 65924.54, response time: 17.46ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6457.49, reads: 0.00, writes: 64574.42, response time: 20.77ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3464030
        other:                           692806
        total:                           4156836
    transactions:                        346403 (6791.42 per sec.)
    read/write requests:                 3464030 (67914.17 per sec.)
    other operations:                    692806 (13582.83 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0060s
    total number of events:              346403
    total time taken by event execution: 3263.5319s
    response time:
         min:                                  1.06ms
         avg:                                  9.42ms
         max:                                109.81ms
         approx.  95 percentile:              16.58ms

Threads fairness:
    events (avg/stddev):           5412.5469/27.63
    execution time (avg/stddev):   50.9927/0.00

