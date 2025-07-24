sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 5109.32, reads: 71693.92, writes: 0.00, response time: 8.46ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5842.50, reads: 81780.03, writes: 0.00, response time: 7.93ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 5033.50, reads: 70464.06, writes: 0.00, response time: 9.17ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6275.00, reads: 87853.51, writes: 0.00, response time: 7.19ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6466.00, reads: 90494.98, writes: 0.00, response time: 6.87ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 5908.00, reads: 82766.49, writes: 0.00, response time: 7.39ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 6947.50, reads: 97247.49, writes: 0.00, response time: 6.99ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 5738.51, reads: 80408.19, writes: 0.00, response time: 6.90ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6832.48, reads: 95579.70, writes: 0.00, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6044.00, reads: 84621.56, writes: 0.00, response time: 7.37ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5542.00, reads: 77570.99, writes: 0.00, response time: 8.64ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 5448.50, reads: 76296.48, writes: 0.00, response time: 8.20ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6508.51, reads: 91118.58, writes: 0.00, response time: 6.96ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6339.45, reads: 88821.74, writes: 0.00, response time: 6.58ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 5790.54, reads: 81004.08, writes: 0.00, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 6986.50, reads: 97793.02, writes: 0.00, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 6295.01, reads: 88131.57, writes: 0.00, response time: 7.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 6638.51, reads: 92935.08, writes: 0.00, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 6142.98, reads: 86013.72, writes: 0.00, response time: 6.93ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 7200.52, reads: 100802.73, writes: 0.00, response time: 6.60ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 6702.51, reads: 93840.60, writes: 0.00, response time: 6.64ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 7472.99, reads: 104606.91, writes: 0.00, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 6644.99, reads: 93036.36, writes: 0.00, response time: 6.16ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 6982.01, reads: 97745.58, writes: 0.00, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 7545.50, reads: 105642.54, writes: 0.00, response time: 6.18ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 6005.01, reads: 84146.69, writes: 0.00, response time: 7.39ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 5663.47, reads: 79221.54, writes: 0.00, response time: 7.88ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 7242.51, reads: 101398.17, writes: 0.00, response time: 6.29ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 6470.51, reads: 90584.67, writes: 0.00, response time: 6.56ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 6409.00, reads: 89715.50, writes: 0.00, response time: 6.43ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5434688
        write:                           0
        other:                           776384
        total:                           6211072
    transactions:                        388192 (6357.40 per sec.)
    read/write requests:                 5434688 (89003.67 per sec.)
    other operations:                    776384 (12714.81 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0614s
    total number of events:              388192
    total time taken by event execution: 1953.1509s
    response time:
         min:                                  2.10ms
         avg:                                  5.03ms
         max:                                170.19ms
         approx.  95 percentile:               7.08ms

Threads fairness:
    events (avg/stddev):           12131.0000/179.52
    execution time (avg/stddev):   61.0360/0.01

