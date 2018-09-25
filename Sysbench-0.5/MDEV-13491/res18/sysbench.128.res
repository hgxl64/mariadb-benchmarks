sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 447.97, reads: 0.00, writes: 4812.71, response time: 281.98ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 512.01, reads: 0.00, writes: 4910.58, response time: 266.95ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 450.49, reads: 0.00, writes: 4829.43, response time: 286.06ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 509.50, reads: 0.00, writes: 4947.50, response time: 268.71ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 512.00, reads: 0.00, writes: 5070.49, response time: 264.40ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 512.00, reads: 0.00, writes: 4987.52, response time: 261.72ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 463.51, reads: 0.00, writes: 4937.06, response time: 263.85ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 502.50, reads: 0.00, writes: 5008.45, response time: 260.32ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 506.00, reads: 0.00, writes: 4902.97, response time: 274.89ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 510.01, reads: 0.00, writes: 4979.06, response time: 279.88ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 485.00, reads: 0.00, writes: 5030.52, response time: 259.62ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 492.50, reads: 0.00, writes: 5003.50, response time: 262.51ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 501.00, reads: 0.00, writes: 4906.97, response time: 268.71ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 509.00, reads: 0.00, writes: 4998.03, response time: 260.71ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 491.50, reads: 0.00, writes: 5011.50, response time: 260.79ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 501.50, reads: 0.00, writes: 5066.00, response time: 262.19ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 510.50, reads: 0.00, writes: 5114.47, response time: 259.62ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 498.00, reads: 0.00, writes: 4981.00, response time: 267.11ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 505.00, reads: 0.00, writes: 5009.50, response time: 266.63ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 507.00, reads: 0.00, writes: 5005.47, response time: 263.93ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 510.50, reads: 0.00, writes: 5068.52, response time: 260.40ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 510.50, reads: 0.00, writes: 5081.52, response time: 261.41ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 498.50, reads: 0.00, writes: 5078.03, response time: 258.53ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 484.00, reads: 0.00, writes: 4927.00, response time: 265.99ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 500.49, reads: 0.00, writes: 4897.45, response time: 273.25ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           254930
        other:                           50986
        total:                           305916
    transactions:                        25493  (498.06 per sec.)
    read/write requests:                 254930 (4980.65 per sec.)
    other operations:                    50986  (996.13 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.1841s
    total number of events:              25493
    total time taken by event execution: 6545.7909s
    response time:
         min:                                186.67ms
         avg:                                256.77ms
         max:                                291.78ms
         approx.  95 percentile:             267.11ms

Threads fairness:
    events (avg/stddev):           199.1641/0.37
    execution time (avg/stddev):   51.1390/0.05

