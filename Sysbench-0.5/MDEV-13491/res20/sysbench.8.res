sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1858.91, reads: 0.00, writes: 18625.07, response time: 6.45ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1874.50, reads: 0.00, writes: 18745.98, response time: 6.40ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 2042.00, reads: 0.00, writes: 20422.99, response time: 5.88ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1953.50, reads: 0.00, writes: 19508.02, response time: 6.45ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1929.00, reads: 0.00, writes: 19316.98, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1887.49, reads: 0.00, writes: 18874.86, response time: 6.32ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1893.00, reads: 0.00, writes: 18927.03, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1930.52, reads: 0.00, writes: 19305.71, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1878.98, reads: 0.00, writes: 18761.31, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1879.52, reads: 0.00, writes: 18826.15, response time: 6.34ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1915.49, reads: 0.00, writes: 19149.94, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1914.01, reads: 0.00, writes: 19142.57, response time: 6.53ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1929.98, reads: 0.00, writes: 19267.29, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1938.51, reads: 0.00, writes: 19420.14, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1929.00, reads: 0.00, writes: 19290.03, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1936.49, reads: 0.00, writes: 19345.94, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1877.50, reads: 0.00, writes: 18794.04, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1886.50, reads: 0.00, writes: 18865.04, response time: 6.51ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1899.00, reads: 0.00, writes: 18989.98, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1937.97, reads: 0.00, writes: 19375.21, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1931.04, reads: 0.00, writes: 19277.93, response time: 6.36ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1935.48, reads: 0.00, writes: 19385.78, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1931.51, reads: 0.00, writes: 19321.07, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1935.50, reads: 0.00, writes: 19354.05, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1839.99, reads: 0.00, writes: 18400.95, response time: 6.49ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           976090
        other:                           195218
        total:                           1171308
    transactions:                        97609  (1913.70 per sec.)
    read/write requests:                 976090 (19137.01 per sec.)
    other operations:                    195218 (3827.40 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0053s
    total number of events:              97609
    total time taken by event execution: 407.8000s
    response time:
         min:                                  0.97ms
         avg:                                  4.18ms
         max:                                 26.55ms
         approx.  95 percentile:               6.23ms

Threads fairness:
    events (avg/stddev):           12201.1250/31.41
    execution time (avg/stddev):   50.9750/0.00

