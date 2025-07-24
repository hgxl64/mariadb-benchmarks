sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 5423.26, reads: 76100.70, writes: 0.00, response time: 7.90ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5458.05, reads: 76461.69, writes: 0.00, response time: 8.23ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 5507.99, reads: 77047.85, writes: 0.00, response time: 9.73ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6056.01, reads: 84848.13, writes: 0.00, response time: 7.16ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 5758.00, reads: 80522.45, writes: 0.00, response time: 7.83ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6331.50, reads: 88653.03, writes: 0.00, response time: 7.12ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 6319.00, reads: 88483.02, writes: 0.00, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 5781.49, reads: 80961.39, writes: 0.00, response time: 7.98ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6933.50, reads: 97059.06, writes: 0.00, response time: 6.73ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6419.99, reads: 89843.36, writes: 0.00, response time: 6.92ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 6873.01, reads: 96224.13, writes: 0.00, response time: 6.87ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5888.89, reads: 82463.40, writes: 0.00, response time: 8.15ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 7360.07, reads: 103106.44, writes: 0.00, response time: 5.90ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6075.04, reads: 84970.57, writes: 0.00, response time: 7.32ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 7566.03, reads: 105916.92, writes: 0.00, response time: 5.85ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 6854.99, reads: 95978.37, writes: 0.00, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 6633.01, reads: 92867.63, writes: 0.00, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 6978.00, reads: 97686.95, writes: 0.00, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 6998.50, reads: 97961.44, writes: 0.00, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 7075.49, reads: 99066.85, writes: 0.00, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 6424.52, reads: 89946.73, writes: 0.00, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 7457.50, reads: 104408.00, writes: 0.00, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 6681.01, reads: 93526.07, writes: 0.00, response time: 6.42ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 6358.50, reads: 89036.48, writes: 0.00, response time: 6.81ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 6833.44, reads: 95738.12, writes: 0.00, response time: 6.71ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 4752.03, reads: 66477.43, writes: 0.00, response time: 9.74ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 5572.51, reads: 77975.12, writes: 0.00, response time: 8.09ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 7191.51, reads: 100675.67, writes: 0.00, response time: 5.86ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8424.49, reads: 117967.43, writes: 0.00, response time: 5.45ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8496.99, reads: 118947.93, writes: 0.00, response time: 5.24ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5620818
        write:                           0
        other:                           802974
        total:                           6423792
    transactions:                        401487 (6581.45 per sec.)
    read/write requests:                 5620818 (92140.35 per sec.)
    other operations:                    802974 (13162.91 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0028s
    total number of events:              401487
    total time taken by event execution: 1951.3739s
    response time:
         min:                                  1.96ms
         avg:                                  4.86ms
         max:                                149.08ms
         approx.  95 percentile:               6.99ms

Threads fairness:
    events (avg/stddev):           12546.4688/209.50
    execution time (avg/stddev):   60.9804/0.00

