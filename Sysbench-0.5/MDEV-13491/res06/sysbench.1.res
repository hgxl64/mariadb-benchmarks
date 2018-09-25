sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 1
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 1, tps: 372.10, reads: 0.00, writes: 3726.02, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 1, tps: 392.01, reads: 0.00, writes: 3920.06, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 1, tps: 378.00, reads: 0.00, writes: 3780.00, response time: 3.66ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 1, tps: 387.50, reads: 0.00, writes: 3875.00, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 1, tps: 383.50, reads: 0.00, writes: 3833.50, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 1, tps: 366.50, reads: 0.00, writes: 3666.49, response time: 3.88ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 1, tps: 364.50, reads: 0.00, writes: 3645.01, response time: 3.87ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 1, tps: 387.99, reads: 0.00, writes: 3879.93, response time: 3.70ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 1, tps: 366.51, reads: 0.00, writes: 3661.55, response time: 3.91ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 1, tps: 385.00, reads: 0.00, writes: 3853.48, response time: 3.69ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 1, tps: 385.00, reads: 0.00, writes: 3850.00, response time: 3.68ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 1, tps: 382.50, reads: 0.00, writes: 3825.02, response time: 3.77ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 1, tps: 375.00, reads: 0.00, writes: 3746.00, response time: 3.81ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 1, tps: 368.50, reads: 0.00, writes: 3689.00, response time: 3.81ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 1, tps: 356.00, reads: 0.00, writes: 3554.99, response time: 3.96ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 1, tps: 380.50, reads: 0.00, writes: 3810.01, response time: 3.78ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 1, tps: 361.50, reads: 0.00, writes: 3615.00, response time: 4.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 1, tps: 361.50, reads: 0.00, writes: 3614.99, response time: 4.02ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 1, tps: 378.00, reads: 0.00, writes: 3780.01, response time: 3.80ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 1, tps: 388.50, reads: 0.00, writes: 3885.00, response time: 3.65ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 1, tps: 375.00, reads: 0.00, writes: 3750.00, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 1, tps: 378.00, reads: 0.00, writes: 3780.00, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 1, tps: 389.50, reads: 0.00, writes: 3895.01, response time: 3.59ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 1, tps: 386.50, reads: 0.00, writes: 3864.49, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 1, tps: 383.50, reads: 0.00, writes: 3832.50, response time: 3.72ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           192530
        other:                           38506
        total:                           231036
    transactions:                        19253  (377.49 per sec.)
    read/write requests:                 192530 (3774.89 per sec.)
    other operations:                    38506  (754.98 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0028s
    total number of events:              19253
    total time taken by event execution: 50.9746s
    response time:
         min:                                  0.89ms
         avg:                                  2.65ms
         max:                                 12.31ms
         approx.  95 percentile:               3.77ms

Threads fairness:
    events (avg/stddev):           19253.0000/0.00
    execution time (avg/stddev):   50.9746/0.00

