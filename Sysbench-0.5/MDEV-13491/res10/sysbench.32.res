sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5724.70, reads: 0.00, writes: 57355.99, response time: 8.19ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6124.58, reads: 0.00, writes: 61292.32, response time: 7.80ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 6487.50, reads: 0.00, writes: 64803.00, response time: 7.42ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6239.50, reads: 0.00, writes: 62432.48, response time: 7.81ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6047.00, reads: 0.00, writes: 60508.99, response time: 8.26ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 5868.50, reads: 0.00, writes: 58547.51, response time: 8.14ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 6011.00, reads: 0.00, writes: 60244.05, response time: 8.87ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6034.00, reads: 0.00, writes: 60277.45, response time: 8.30ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 5835.50, reads: 0.00, writes: 58339.03, response time: 8.66ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 5687.50, reads: 0.00, writes: 56957.00, response time: 8.75ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5867.50, reads: 0.00, writes: 58661.99, response time: 8.21ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5764.50, reads: 0.00, writes: 57601.02, response time: 8.47ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 5602.49, reads: 0.00, writes: 56017.92, response time: 9.25ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6069.51, reads: 0.00, writes: 60759.07, response time: 7.84ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 5912.50, reads: 0.00, writes: 59043.01, response time: 8.20ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 5782.49, reads: 0.00, writes: 57861.43, response time: 9.06ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 5745.00, reads: 0.00, writes: 57480.55, response time: 9.07ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 5837.00, reads: 0.00, writes: 58292.50, response time: 9.46ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5748.00, reads: 0.00, writes: 57551.50, response time: 8.68ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 5887.98, reads: 0.00, writes: 58798.35, response time: 8.49ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5764.01, reads: 0.00, writes: 57719.60, response time: 8.41ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 5816.50, reads: 0.00, writes: 58122.05, response time: 8.39ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 5558.50, reads: 0.00, writes: 55625.00, response time: 9.12ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5997.00, reads: 0.00, writes: 59929.53, response time: 8.02ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5793.00, reads: 0.00, writes: 57939.50, response time: 8.53ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3000910
        other:                           600182
        total:                           3601092
    transactions:                        300091 (5883.69 per sec.)
    read/write requests:                 3000910 (58836.94 per sec.)
    other operations:                    600182 (11767.39 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0038s
    total number of events:              300091
    total time taken by event execution: 1631.6358s
    response time:
         min:                                  0.70ms
         avg:                                  5.44ms
         max:                                 55.94ms
         approx.  95 percentile:               8.40ms

Threads fairness:
    events (avg/stddev):           9377.8438/30.56
    execution time (avg/stddev):   50.9886/0.00

