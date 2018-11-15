sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 16, tps: 5494.06, reads: 76986.33, writes: 0.00, response time: 3.83ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 5815.03, reads: 81403.35, writes: 0.00, response time: 3.37ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 6097.50, reads: 85363.50, writes: 0.00, response time: 3.31ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 6243.01, reads: 87415.11, writes: 0.00, response time: 3.18ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 6115.49, reads: 85595.35, writes: 0.00, response time: 3.25ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 6012.01, reads: 84184.60, writes: 0.00, response time: 3.27ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 6150.50, reads: 86104.98, writes: 0.00, response time: 3.25ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 6099.50, reads: 85389.99, writes: 0.00, response time: 3.28ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 6030.51, reads: 84418.10, writes: 0.00, response time: 3.28ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 6025.99, reads: 84379.31, writes: 0.00, response time: 3.28ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 5992.51, reads: 83869.09, writes: 0.00, response time: 3.31ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 6129.99, reads: 85845.91, writes: 0.00, response time: 3.26ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 6123.02, reads: 85715.71, writes: 0.00, response time: 3.24ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 5912.99, reads: 82790.88, writes: 0.00, response time: 3.30ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 6081.50, reads: 85133.99, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 6076.50, reads: 85094.49, writes: 0.00, response time: 3.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 5862.51, reads: 82064.08, writes: 0.00, response time: 3.77ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 6081.50, reads: 85123.98, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 6242.00, reads: 87399.51, writes: 0.00, response time: 3.21ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 6023.49, reads: 84320.38, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 6033.01, reads: 84474.08, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 5926.50, reads: 82960.03, writes: 0.00, response time: 3.42ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 5982.99, reads: 83761.86, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 6114.50, reads: 85598.51, writes: 0.00, response time: 3.32ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 6043.51, reads: 84615.08, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 16, tps: 6033.00, reads: 84466.98, writes: 0.00, response time: 3.30ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 16, tps: 6156.00, reads: 86185.55, writes: 0.00, response time: 3.26ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 16, tps: 6208.50, reads: 86908.04, writes: 0.00, response time: 3.20ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 16, tps: 6073.99, reads: 85057.41, writes: 0.00, response time: 3.28ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 16, tps: 6225.00, reads: 87136.01, writes: 0.00, response time: 3.21ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5160148
        write:                           0
        other:                           737164
        total:                           5897312
    transactions:                        368582 (6042.10 per sec.)
    read/write requests:                 5160148 (84589.38 per sec.)
    other operations:                    737164 (12084.20 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0023s
    total number of events:              368582
    total time taken by event execution: 975.4777s
    response time:
         min:                                  2.05ms
         avg:                                  2.65ms
         max:                                 10.61ms
         approx.  95 percentile:               3.31ms

Threads fairness:
    events (avg/stddev):           23036.3750/285.33
    execution time (avg/stddev):   60.9674/0.00

