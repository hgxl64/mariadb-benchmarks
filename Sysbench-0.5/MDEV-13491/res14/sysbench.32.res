sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5559.65, reads: 0.00, writes: 55687.48, response time: 8.84ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5856.16, reads: 0.00, writes: 58596.60, response time: 8.30ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 5834.01, reads: 0.00, writes: 58345.09, response time: 8.60ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 5563.99, reads: 0.00, writes: 55646.91, response time: 9.19ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 5688.01, reads: 0.00, writes: 56894.08, response time: 8.88ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 5633.50, reads: 0.00, writes: 56272.47, response time: 9.08ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 5527.01, reads: 0.00, writes: 55289.56, response time: 9.09ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 5658.00, reads: 0.00, writes: 56562.00, response time: 9.43ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 5712.50, reads: 0.00, writes: 57193.99, response time: 8.60ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 5535.00, reads: 0.00, writes: 55220.49, response time: 9.13ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5597.00, reads: 0.00, writes: 56029.47, response time: 9.31ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5747.50, reads: 0.00, writes: 57435.50, response time: 8.96ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 5312.50, reads: 0.00, writes: 53234.53, response time: 9.38ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 5649.99, reads: 0.00, writes: 56489.93, response time: 8.99ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 5530.00, reads: 0.00, writes: 55310.04, response time: 9.10ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 5685.00, reads: 0.00, writes: 56820.00, response time: 8.72ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 5676.00, reads: 0.00, writes: 56786.04, response time: 8.89ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 5335.50, reads: 0.00, writes: 53359.02, response time: 10.16ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5364.49, reads: 0.00, writes: 53566.44, response time: 9.57ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 5244.50, reads: 0.00, writes: 52465.01, response time: 10.05ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5861.50, reads: 0.00, writes: 58673.52, response time: 8.33ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 5479.00, reads: 0.00, writes: 54719.98, response time: 9.79ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 5537.51, reads: 0.00, writes: 55399.55, response time: 9.16ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5495.50, reads: 0.00, writes: 54959.97, response time: 9.24ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5442.50, reads: 0.00, writes: 54382.47, response time: 9.16ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           2843820
        other:                           568764
        total:                           3412584
    transactions:                        284382 (5575.62 per sec.)
    read/write requests:                 2843820 (55756.22 per sec.)
    other operations:                    568764 (11151.24 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0045s
    total number of events:              284382
    total time taken by event execution: 1631.7024s
    response time:
         min:                                  0.68ms
         avg:                                  5.74ms
         max:                                 51.27ms
         approx.  95 percentile:               9.07ms

Threads fairness:
    events (avg/stddev):           8886.9375/28.41
    execution time (avg/stddev):   50.9907/0.00

