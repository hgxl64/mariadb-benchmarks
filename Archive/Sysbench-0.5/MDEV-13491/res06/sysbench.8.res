sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 8, tps: 1937.78, reads: 0.00, writes: 19399.32, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 1870.01, reads: 0.00, writes: 18718.55, response time: 6.24ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 1949.00, reads: 0.00, writes: 19485.00, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 1907.00, reads: 0.00, writes: 19074.97, response time: 6.21ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 1883.00, reads: 0.00, writes: 18803.51, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 1938.50, reads: 0.00, writes: 19408.49, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 1932.00, reads: 0.00, writes: 19323.05, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 1930.00, reads: 0.00, writes: 19299.50, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 1962.50, reads: 0.00, writes: 19590.46, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 1851.48, reads: 0.00, writes: 18517.32, response time: 6.59ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 1908.54, reads: 0.00, writes: 19113.90, response time: 6.26ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 1883.48, reads: 0.00, writes: 18824.34, response time: 6.36ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 1966.00, reads: 0.00, writes: 19674.48, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 1895.47, reads: 0.00, writes: 18954.72, response time: 6.32ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 1990.50, reads: 0.00, writes: 19905.02, response time: 6.03ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 1913.53, reads: 0.00, writes: 19135.31, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 1958.96, reads: 0.00, writes: 19586.64, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 1918.01, reads: 0.00, writes: 19164.05, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 1943.52, reads: 0.00, writes: 19454.20, response time: 6.27ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 1914.98, reads: 0.00, writes: 19147.75, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 1886.03, reads: 0.00, writes: 18832.29, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 1850.01, reads: 0.00, writes: 18530.08, response time: 6.56ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 1898.49, reads: 0.00, writes: 18963.92, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 1944.50, reads: 0.00, writes: 19458.00, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 1924.00, reads: 0.00, writes: 19248.03, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           978350
        other:                           195670
        total:                           1174020
    transactions:                        97835  (1918.23 per sec.)
    read/write requests:                 978350 (19182.31 per sec.)
    other operations:                    195670 (3836.46 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0027s
    total number of events:              97835
    total time taken by event execution: 407.7824s
    response time:
         min:                                  1.07ms
         avg:                                  4.17ms
         max:                                 25.73ms
         approx.  95 percentile:               6.19ms

Threads fairness:
    events (avg/stddev):           12229.3750/23.82
    execution time (avg/stddev):   50.9728/0.00

