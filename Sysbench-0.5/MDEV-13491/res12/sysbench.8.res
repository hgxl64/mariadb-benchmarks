sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1898.08, reads: 0.00, writes: 19020.80, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1907.54, reads: 0.00, writes: 19073.43, response time: 6.30ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1913.50, reads: 0.00, writes: 19120.53, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1962.98, reads: 0.00, writes: 19643.30, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1906.01, reads: 0.00, writes: 19048.65, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1914.98, reads: 0.00, writes: 19129.27, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1871.02, reads: 0.00, writes: 18743.24, response time: 6.58ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1928.50, reads: 0.00, writes: 19286.97, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1937.00, reads: 0.00, writes: 19332.49, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1912.00, reads: 0.00, writes: 19153.53, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1961.00, reads: 0.00, writes: 19613.98, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1958.00, reads: 0.00, writes: 19544.46, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1954.51, reads: 0.00, writes: 19570.55, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1924.00, reads: 0.00, writes: 19234.01, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1884.50, reads: 0.00, writes: 18856.99, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1917.00, reads: 0.00, writes: 19170.47, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1931.00, reads: 0.00, writes: 19313.53, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1886.50, reads: 0.00, writes: 18850.49, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 2015.50, reads: 0.00, writes: 20163.50, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1810.98, reads: 0.00, writes: 18115.84, response time: 6.64ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1943.52, reads: 0.00, writes: 19419.17, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1926.50, reads: 0.00, writes: 19275.50, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1862.49, reads: 0.00, writes: 18628.44, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1891.00, reads: 0.00, writes: 18906.51, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1947.98, reads: 0.00, writes: 19483.76, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           978760
        other:                           195752
        total:                           1174512
    transactions:                        97876  (1919.09 per sec.)
    read/write requests:                 978760 (19190.92 per sec.)
    other operations:                    195752 (3838.18 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0012s
    total number of events:              97876
    total time taken by event execution: 407.7691s
    response time:
         min:                                  0.80ms
         avg:                                  4.17ms
         max:                                 19.38ms
         approx.  95 percentile:               6.19ms

Threads fairness:
    events (avg/stddev):           12234.5000/47.34
    execution time (avg/stddev):   50.9711/0.00

