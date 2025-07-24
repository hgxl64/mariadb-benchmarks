sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 383.48, reads: 0.00, writes: 7684.57, response time: 334.34ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 386.00, reads: 0.00, writes: 7714.01, response time: 342.75ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 385.50, reads: 0.00, writes: 7707.08, response time: 345.94ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 394.00, reads: 0.00, writes: 7877.46, response time: 341.11ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 387.00, reads: 0.00, writes: 7740.05, response time: 346.05ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 390.50, reads: 0.00, writes: 7821.00, response time: 334.84ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 387.50, reads: 0.00, writes: 7743.49, response time: 355.39ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 400.50, reads: 0.00, writes: 8008.50, response time: 332.44ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 391.50, reads: 0.00, writes: 7844.51, response time: 335.64ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 389.00, reads: 0.00, writes: 7768.93, response time: 336.35ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 393.00, reads: 0.00, writes: 7859.06, response time: 331.25ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 388.00, reads: 0.00, writes: 7771.51, response time: 339.28ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 390.00, reads: 0.00, writes: 7794.50, response time: 338.77ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 387.00, reads: 0.00, writes: 7739.50, response time: 339.58ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 385.50, reads: 0.00, writes: 7709.51, response time: 342.85ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 384.00, reads: 0.00, writes: 7676.50, response time: 347.92ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 379.50, reads: 0.00, writes: 7590.49, response time: 345.84ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 390.00, reads: 0.00, writes: 7800.00, response time: 338.26ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 387.00, reads: 0.00, writes: 7742.47, response time: 339.79ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 385.50, reads: 0.00, writes: 7710.03, response time: 342.13ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 392.50, reads: 0.00, writes: 7839.01, response time: 330.85ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 383.50, reads: 0.00, writes: 7676.00, response time: 341.01ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 389.50, reads: 0.00, writes: 7792.01, response time: 340.80ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 388.00, reads: 0.00, writes: 7760.49, response time: 338.67ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 392.50, reads: 0.00, writes: 7848.50, response time: 336.75ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           398580
        other:                           39858
        total:                           438438
    transactions:                        19929  (388.39 per sec.)
    read/write requests:                 398580 (7767.90 per sec.)
    other operations:                    39858  (776.79 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.3112s
    total number of events:              19929
    total time taken by event execution: 6547.6827s
    response time:
         min:                                 16.99ms
         avg:                                328.55ms
         max:                                359.67ms
         approx.  95 percentile:             341.62ms

Threads fairness:
    events (avg/stddev):           155.6953/0.46
    execution time (avg/stddev):   51.1538/0.09

