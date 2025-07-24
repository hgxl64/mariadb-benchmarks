sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 991.21, reads: 0.00, writes: 9932.15, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 1011.00, reads: 0.00, writes: 10110.05, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 1030.02, reads: 0.00, writes: 10297.21, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 976.98, reads: 0.00, writes: 9765.32, response time: 6.44ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 1007.00, reads: 0.00, writes: 10077.47, response time: 6.35ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 982.52, reads: 0.00, writes: 9810.24, response time: 6.29ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 977.50, reads: 0.00, writes: 9790.00, response time: 6.45ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 999.98, reads: 0.00, writes: 9996.77, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 978.52, reads: 0.00, writes: 9788.24, response time: 6.40ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 1017.98, reads: 0.00, writes: 10179.77, response time: 6.05ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 1037.51, reads: 0.00, writes: 10375.14, response time: 5.93ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 993.00, reads: 0.00, writes: 9930.05, response time: 6.24ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 1012.00, reads: 0.00, writes: 10117.95, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 1013.50, reads: 0.00, writes: 10135.95, response time: 6.25ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 1015.51, reads: 0.00, writes: 10156.11, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 1002.99, reads: 0.00, writes: 10029.94, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1015.98, reads: 0.00, writes: 10156.77, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 1020.03, reads: 0.00, writes: 10203.26, response time: 5.99ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 1009.50, reads: 0.00, writes: 10084.05, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 1040.98, reads: 0.00, writes: 10420.76, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 1027.00, reads: 0.00, writes: 10267.02, response time: 6.24ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 993.50, reads: 0.00, writes: 9936.46, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 998.00, reads: 0.00, writes: 9981.51, response time: 6.26ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 1047.50, reads: 0.00, writes: 10475.02, response time: 5.91ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 993.50, reads: 0.00, writes: 9928.48, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           514010
        other:                           102802
        total:                           616812
    transactions:                        51401  (1007.82 per sec.)
    read/write requests:                 514010 (10078.23 per sec.)
    other operations:                    102802 (2015.65 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0020s
    total number of events:              51401
    total time taken by event execution: 203.8939s
    response time:
         min:                                  0.94ms
         avg:                                  3.97ms
         max:                                 19.87ms
         approx.  95 percentile:               6.12ms

Threads fairness:
    events (avg/stddev):           12850.2500/58.87
    execution time (avg/stddev):   50.9735/0.00

