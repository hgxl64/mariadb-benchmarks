sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 5764.16, reads: 0.00, writes: 58043.59, response time: 50.57ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 6028.61, reads: 0.00, writes: 60224.55, response time: 48.84ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 5963.51, reads: 0.00, writes: 59569.57, response time: 50.73ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 5914.50, reads: 0.00, writes: 59273.46, response time: 50.99ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 6006.51, reads: 0.00, writes: 59978.56, response time: 49.64ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 6216.50, reads: 0.00, writes: 62192.99, response time: 46.81ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 6172.00, reads: 0.00, writes: 61762.96, response time: 47.56ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 6148.51, reads: 0.00, writes: 61426.07, response time: 47.92ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 6128.00, reads: 0.00, writes: 61337.46, response time: 47.10ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 6325.50, reads: 0.00, writes: 63191.50, response time: 45.37ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 5678.00, reads: 0.00, writes: 56819.99, response time: 54.04ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 6030.50, reads: 0.00, writes: 60212.02, response time: 49.49ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 6149.49, reads: 0.00, writes: 61598.44, response time: 46.95ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 6000.01, reads: 0.00, writes: 60006.05, response time: 49.55ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 6018.00, reads: 0.00, writes: 60060.99, response time: 48.75ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 5903.00, reads: 0.00, writes: 59127.02, response time: 51.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 5800.00, reads: 0.00, writes: 57892.98, response time: 52.48ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 6023.49, reads: 0.00, writes: 60291.91, response time: 49.12ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 6242.01, reads: 0.00, writes: 62455.63, response time: 45.84ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 6019.00, reads: 0.00, writes: 60159.04, response time: 48.74ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 5660.49, reads: 0.00, writes: 56668.45, response time: 54.58ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 5895.93, reads: 0.00, writes: 58919.32, response time: 50.03ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 5864.56, reads: 0.00, writes: 58664.63, response time: 51.27ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 6190.50, reads: 0.00, writes: 61896.04, response time: 46.88ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 5782.99, reads: 0.00, writes: 57914.44, response time: 51.73ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3058360
        other:                           611672
        total:                           3670032
    transactions:                        305836 (5995.46 per sec.)
    read/write requests:                 3058360 (59954.65 per sec.)
    other operations:                    611672 (11990.93 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0112s
    total number of events:              305836
    total time taken by event execution: 6528.1373s
    response time:
         min:                                  1.37ms
         avg:                                 21.35ms
         max:                                193.29ms
         approx.  95 percentile:              49.34ms

Threads fairness:
    events (avg/stddev):           2389.3438/31.05
    execution time (avg/stddev):   51.0011/0.00

