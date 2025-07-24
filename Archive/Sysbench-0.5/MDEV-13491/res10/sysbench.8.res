sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1891.28, reads: 0.00, writes: 18946.79, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1912.00, reads: 0.00, writes: 19098.02, response time: 6.42ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1881.50, reads: 0.00, writes: 18807.99, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1938.00, reads: 0.00, writes: 19389.00, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1946.00, reads: 0.00, writes: 19486.02, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1923.50, reads: 0.00, writes: 19235.01, response time: 6.05ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1964.50, reads: 0.00, writes: 19639.47, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1965.98, reads: 0.00, writes: 19657.34, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1948.51, reads: 0.00, writes: 19478.64, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1958.00, reads: 0.00, writes: 19594.51, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1922.99, reads: 0.00, writes: 19227.44, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1964.00, reads: 0.00, writes: 19642.54, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1941.50, reads: 0.00, writes: 19412.99, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1934.50, reads: 0.00, writes: 19347.00, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1865.99, reads: 0.00, writes: 18635.86, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1861.48, reads: 0.00, writes: 18636.84, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1934.52, reads: 0.00, writes: 19347.19, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1931.01, reads: 0.00, writes: 19307.61, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1880.47, reads: 0.00, writes: 18806.23, response time: 6.42ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1885.50, reads: 0.00, writes: 18856.01, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1964.00, reads: 0.00, writes: 19624.00, response time: 6.09ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1927.51, reads: 0.00, writes: 19286.09, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1919.52, reads: 0.00, writes: 19200.24, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1895.98, reads: 0.00, writes: 18956.81, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1897.00, reads: 0.00, writes: 18972.99, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           980080
        other:                           196016
        total:                           1176096
    transactions:                        98008  (1921.65 per sec.)
    read/write requests:                 980080 (19216.51 per sec.)
    other operations:                    196016 (3843.30 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0020s
    total number of events:              98008
    total time taken by event execution: 407.7581s
    response time:
         min:                                  1.01ms
         avg:                                  4.16ms
         max:                                 38.38ms
         approx.  95 percentile:               6.15ms

Threads fairness:
    events (avg/stddev):           12251.0000/26.63
    execution time (avg/stddev):   50.9698/0.00

