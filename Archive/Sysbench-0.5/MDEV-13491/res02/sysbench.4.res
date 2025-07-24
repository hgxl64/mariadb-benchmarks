sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 439.61, reads: 0.00, writes: 8805.66, response time: 10.63ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 463.01, reads: 0.00, writes: 9267.11, response time: 10.50ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 457.00, reads: 0.00, writes: 9141.00, response time: 10.65ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 472.00, reads: 0.00, writes: 9433.49, response time: 10.32ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 472.50, reads: 0.00, writes: 9451.50, response time: 10.26ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 457.50, reads: 0.00, writes: 9155.51, response time: 10.46ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 454.50, reads: 0.00, writes: 9078.50, response time: 10.33ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 465.50, reads: 0.00, writes: 9315.01, response time: 10.42ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 460.00, reads: 0.00, writes: 9210.00, response time: 10.57ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 466.50, reads: 0.00, writes: 9326.49, response time: 10.28ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 448.00, reads: 0.00, writes: 8952.01, response time: 10.85ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 466.50, reads: 0.00, writes: 9339.48, response time: 10.30ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 469.50, reads: 0.00, writes: 9377.01, response time: 10.26ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 446.00, reads: 0.00, writes: 8922.43, response time: 10.66ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 456.00, reads: 0.00, writes: 9121.58, response time: 10.51ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 449.50, reads: 0.00, writes: 8987.00, response time: 10.49ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 465.49, reads: 0.00, writes: 9317.88, response time: 10.34ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 466.01, reads: 0.00, writes: 9314.62, response time: 10.15ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 461.50, reads: 0.00, writes: 9229.99, response time: 10.49ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 442.99, reads: 0.00, writes: 8862.90, response time: 10.59ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 463.51, reads: 0.00, writes: 9266.62, response time: 10.42ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 450.49, reads: 0.00, writes: 9008.90, response time: 10.48ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 442.51, reads: 0.00, writes: 8844.12, response time: 10.75ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 471.50, reads: 0.00, writes: 9443.98, response time: 10.18ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 461.50, reads: 0.00, writes: 9225.95, response time: 10.71ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           468060
        other:                           46806
        total:                           514866
    transactions:                        23403  (458.82 per sec.)
    read/write requests:                 468060 (9176.45 per sec.)
    other operations:                    46806  (917.64 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0067s
    total number of events:              23403
    total time taken by event execution: 203.9602s
    response time:
         min:                                  2.45ms
         avg:                                  8.72ms
         max:                                 38.41ms
         approx.  95 percentile:              10.48ms

Threads fairness:
    events (avg/stddev):           5850.7500/3.34
    execution time (avg/stddev):   50.9900/0.00

