sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 2, tps: 778.74, reads: 10906.37, writes: 0.00, response time: 3.61ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 857.50, reads: 12014.93, writes: 0.00, response time: 2.62ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 880.50, reads: 12319.05, writes: 0.00, response time: 2.55ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 871.50, reads: 12205.99, writes: 0.00, response time: 2.66ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 800.49, reads: 11208.40, writes: 0.00, response time: 3.12ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 820.50, reads: 11484.99, writes: 0.00, response time: 3.00ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 820.00, reads: 11481.51, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 918.51, reads: 12857.20, writes: 0.00, response time: 2.61ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 958.49, reads: 13411.41, writes: 0.00, response time: 2.45ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 933.00, reads: 13072.50, writes: 0.00, response time: 2.59ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 844.50, reads: 11819.95, writes: 0.00, response time: 3.11ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 862.00, reads: 12066.43, writes: 0.00, response time: 2.79ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 898.02, reads: 12576.33, writes: 0.00, response time: 2.42ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 909.99, reads: 12738.37, writes: 0.00, response time: 2.30ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 915.51, reads: 12815.65, writes: 0.00, response time: 2.28ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 909.99, reads: 12741.85, writes: 0.00, response time: 2.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 895.00, reads: 12526.07, writes: 0.00, response time: 2.58ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 959.49, reads: 13436.43, writes: 0.00, response time: 2.57ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 991.01, reads: 13875.17, writes: 0.00, response time: 2.15ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 1017.49, reads: 14240.92, writes: 0.00, response time: 2.05ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 1008.50, reads: 14114.06, writes: 0.00, response time: 2.06ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 934.99, reads: 13090.35, writes: 0.00, response time: 2.47ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 959.01, reads: 13433.65, writes: 0.00, response time: 2.47ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 908.49, reads: 12720.86, writes: 0.00, response time: 2.57ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 849.49, reads: 11891.42, writes: 0.00, response time: 2.97ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 2, tps: 862.50, reads: 12074.05, writes: 0.00, response time: 2.59ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 2, tps: 924.99, reads: 12944.89, writes: 0.00, response time: 2.27ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 2, tps: 881.00, reads: 12340.01, writes: 0.00, response time: 2.69ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 2, tps: 965.50, reads: 13517.55, writes: 0.00, response time: 2.59ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 2, tps: 872.00, reads: 12205.04, writes: 0.00, response time: 2.76ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            766332
        write:                           0
        other:                           109476
        total:                           875808
    transactions:                        54738  (897.32 per sec.)
    read/write requests:                 766332 (12562.52 per sec.)
    other operations:                    109476 (1794.65 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0015s
    total number of events:              54738
    total time taken by event execution: 121.9063s
    response time:
         min:                                  1.75ms
         avg:                                  2.23ms
         max:                                  7.03ms
         approx.  95 percentile:               2.79ms

Threads fairness:
    events (avg/stddev):           27369.0000/9.00
    execution time (avg/stddev):   60.9531/0.00

