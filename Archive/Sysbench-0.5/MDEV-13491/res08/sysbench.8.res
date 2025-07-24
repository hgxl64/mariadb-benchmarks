sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1926.32, reads: 0.00, writes: 19303.17, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1864.01, reads: 0.00, writes: 18640.10, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1828.48, reads: 0.00, writes: 18284.78, response time: 6.54ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1907.52, reads: 0.00, writes: 19075.23, response time: 6.38ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1940.00, reads: 0.00, writes: 19396.50, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1916.50, reads: 0.00, writes: 19168.50, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1903.48, reads: 0.00, writes: 19031.79, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1891.02, reads: 0.00, writes: 18903.20, response time: 6.27ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1938.50, reads: 0.00, writes: 19387.53, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1892.50, reads: 0.00, writes: 18931.49, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1901.49, reads: 0.00, writes: 19013.91, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1904.01, reads: 0.00, writes: 19042.07, response time: 6.29ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1892.51, reads: 0.00, writes: 18925.09, response time: 6.35ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1877.49, reads: 0.00, writes: 18763.42, response time: 6.53ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1882.50, reads: 0.00, writes: 18836.50, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1898.50, reads: 0.00, writes: 18961.00, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1878.00, reads: 0.00, writes: 18779.01, response time: 6.24ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1869.50, reads: 0.00, writes: 18716.53, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1880.99, reads: 0.00, writes: 18810.44, response time: 6.33ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1961.99, reads: 0.00, writes: 19599.85, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1821.02, reads: 0.00, writes: 18233.17, response time: 6.58ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1887.02, reads: 0.00, writes: 18870.17, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1902.97, reads: 0.00, writes: 19028.22, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1897.51, reads: 0.00, writes: 18958.09, response time: 6.26ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1957.00, reads: 0.00, writes: 19585.52, response time: 6.11ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           966840
        other:                           193368
        total:                           1160208
    transactions:                        96684  (1895.67 per sec.)
    read/write requests:                 966840 (18956.66 per sec.)
    other operations:                    193368 (3791.33 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0026s
    total number of events:              96684
    total time taken by event execution: 407.7584s
    response time:
         min:                                  1.09ms
         avg:                                  4.22ms
         max:                                 19.36ms
         approx.  95 percentile:               6.27ms

Threads fairness:
    events (avg/stddev):           12085.5000/35.39
    execution time (avg/stddev):   50.9698/0.00

