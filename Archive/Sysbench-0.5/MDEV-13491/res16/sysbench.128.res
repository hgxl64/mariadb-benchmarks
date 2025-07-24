sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 427.48, reads: 0.00, writes: 4278.30, response time: 311.16ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 427.50, reads: 0.00, writes: 4278.00, response time: 319.94ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 426.00, reads: 0.00, writes: 4261.51, response time: 307.37ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 428.50, reads: 0.00, writes: 4283.50, response time: 308.84ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 432.00, reads: 0.00, writes: 4321.01, response time: 304.16ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 428.50, reads: 0.00, writes: 4285.00, response time: 307.27ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 427.50, reads: 0.00, writes: 4277.00, response time: 306.26ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 428.00, reads: 0.00, writes: 4277.49, response time: 305.07ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 429.99, reads: 0.00, writes: 4299.94, response time: 304.71ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 432.51, reads: 0.00, writes: 4321.07, response time: 310.60ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 422.00, reads: 0.00, writes: 4231.50, response time: 310.88ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 422.00, reads: 0.00, writes: 4215.00, response time: 312.56ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 428.50, reads: 0.00, writes: 4281.00, response time: 304.16ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 434.00, reads: 0.00, writes: 4340.00, response time: 307.18ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 426.00, reads: 0.00, writes: 4258.00, response time: 311.81ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 426.50, reads: 0.00, writes: 4270.00, response time: 311.72ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 422.50, reads: 0.00, writes: 4224.49, response time: 316.61ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 426.00, reads: 0.00, writes: 4259.00, response time: 310.97ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 427.00, reads: 0.00, writes: 4269.50, response time: 310.60ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 435.50, reads: 0.00, writes: 4354.00, response time: 302.53ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 428.50, reads: 0.00, writes: 4289.50, response time: 305.07ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 427.50, reads: 0.00, writes: 4270.00, response time: 306.08ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 426.50, reads: 0.00, writes: 4268.49, response time: 309.12ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 425.00, reads: 0.00, writes: 4251.01, response time: 305.62ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 436.50, reads: 0.00, writes: 4363.00, response time: 306.72ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           219670
        other:                           43934
        total:                           263604
    transactions:                        21967  (428.31 per sec.)
    read/write requests:                 219670 (4283.07 per sec.)
    other operations:                    43934  (856.61 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.2879s
    total number of events:              21967
    total time taken by event execution: 6545.9333s
    response time:
         min:                                 11.77ms
         avg:                                297.99ms
         max:                                339.58ms
         approx.  95 percentile:             309.67ms

Threads fairness:
    events (avg/stddev):           171.6172/0.52
    execution time (avg/stddev):   51.1401/0.08

