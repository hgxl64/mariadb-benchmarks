sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 3471.27, reads: 0.00, writes: 34792.72, response time: 6.77ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 3531.01, reads: 0.00, writes: 35307.07, response time: 6.72ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 3508.01, reads: 0.00, writes: 35063.07, response time: 6.84ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 3549.50, reads: 0.00, writes: 35501.01, response time: 6.84ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 3563.00, reads: 0.00, writes: 35607.48, response time: 6.58ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 3589.50, reads: 0.00, writes: 35873.99, response time: 6.67ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 3542.00, reads: 0.00, writes: 35469.01, response time: 6.82ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 3592.99, reads: 0.00, writes: 35904.88, response time: 6.56ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 3554.01, reads: 0.00, writes: 35555.58, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 3453.00, reads: 0.00, writes: 34535.54, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 3418.50, reads: 0.00, writes: 34192.48, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 3439.50, reads: 0.00, writes: 34400.01, response time: 7.11ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 3471.50, reads: 0.00, writes: 34706.53, response time: 6.74ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 3460.00, reads: 0.00, writes: 34593.97, response time: 6.94ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 3500.00, reads: 0.00, writes: 35014.52, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 3372.50, reads: 0.00, writes: 33709.50, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 3421.00, reads: 0.00, writes: 34210.47, response time: 6.82ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 3442.00, reads: 0.00, writes: 34433.02, response time: 6.90ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 3667.00, reads: 0.00, writes: 36659.49, response time: 6.72ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 3487.50, reads: 0.00, writes: 34836.01, response time: 7.01ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 3474.50, reads: 0.00, writes: 34786.98, response time: 7.10ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 3586.50, reads: 0.00, writes: 35861.48, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 3574.49, reads: 0.00, writes: 35750.43, response time: 6.76ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 3536.50, reads: 0.00, writes: 35332.50, response time: 7.09ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 3586.01, reads: 0.00, writes: 35836.12, response time: 6.63ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1791670
        other:                           358334
        total:                           2150004
    transactions:                        179167 (3512.81 per sec.)
    read/write requests:                 1791670 (35128.08 per sec.)
    other operations:                    358334 (7025.62 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0039s
    total number of events:              179167
    total time taken by event execution: 815.6491s
    response time:
         min:                                  0.84ms
         avg:                                  4.55ms
         max:                                 55.20ms
         approx.  95 percentile:               6.84ms

Threads fairness:
    events (avg/stddev):           11197.9375/23.53
    execution time (avg/stddev):   50.9781/0.00

