sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 5710.22, reads: 0.00, writes: 57418.66, response time: 53.62ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 6425.57, reads: 0.00, writes: 64330.72, response time: 43.49ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 6393.51, reads: 0.00, writes: 63900.59, response time: 43.71ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 6821.49, reads: 0.00, writes: 68125.44, response time: 39.64ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 6137.48, reads: 0.00, writes: 61490.84, response time: 48.87ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 6513.52, reads: 0.00, writes: 65127.16, response time: 43.24ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 6511.00, reads: 0.00, writes: 65090.49, response time: 41.95ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6440.50, reads: 0.00, writes: 64239.52, response time: 43.11ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 6200.00, reads: 0.00, writes: 62221.03, response time: 47.25ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 6321.99, reads: 0.00, writes: 63122.41, response time: 45.52ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 5993.00, reads: 0.00, writes: 59924.54, response time: 50.13ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 6533.98, reads: 0.00, writes: 65290.85, response time: 43.20ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6701.52, reads: 0.00, writes: 67193.68, response time: 40.27ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 5967.99, reads: 0.00, writes: 59513.41, response time: 47.93ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 6441.51, reads: 0.00, writes: 64490.07, response time: 44.08ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 6394.00, reads: 0.00, writes: 63947.55, response time: 43.56ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 6257.93, reads: 0.00, writes: 62476.84, response time: 44.88ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 6422.06, reads: 0.00, writes: 64252.11, response time: 44.94ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6646.50, reads: 0.00, writes: 66388.45, response time: 41.85ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6212.51, reads: 0.00, writes: 62164.09, response time: 46.32ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 6282.00, reads: 0.00, writes: 62918.48, response time: 46.25ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 6589.50, reads: 0.00, writes: 65763.47, response time: 41.69ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 6427.99, reads: 0.00, writes: 64390.43, response time: 43.15ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 6378.48, reads: 0.00, writes: 63656.29, response time: 43.73ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 6468.02, reads: 0.00, writes: 64817.23, response time: 43.75ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3250020
        other:                           650004
        total:                           3900024
    transactions:                        325002 (6371.24 per sec.)
    read/write requests:                 3250020 (63712.42 per sec.)
    other operations:                    650004 (12742.48 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0108s
    total number of events:              325002
    total time taken by event execution: 6528.2244s
    response time:
         min:                                  0.94ms
         avg:                                 20.09ms
         max:                                314.02ms
         approx.  95 percentile:              44.29ms

Threads fairness:
    events (avg/stddev):           2539.0781/28.71
    execution time (avg/stddev):   51.0018/0.00

