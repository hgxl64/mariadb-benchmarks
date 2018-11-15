sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 5740.78, reads: 80541.96, writes: 0.00, response time: 7.88ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5165.52, reads: 72334.26, writes: 0.00, response time: 8.38ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 5111.49, reads: 71516.39, writes: 0.00, response time: 9.78ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6051.50, reads: 84719.96, writes: 0.00, response time: 7.66ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 5572.50, reads: 78023.45, writes: 0.00, response time: 7.72ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6241.51, reads: 87385.18, writes: 0.00, response time: 6.96ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 5871.48, reads: 82191.74, writes: 0.00, response time: 7.46ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6245.01, reads: 87413.11, writes: 0.00, response time: 6.96ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 5872.51, reads: 82226.10, writes: 0.00, response time: 7.34ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6193.49, reads: 86747.40, writes: 0.00, response time: 6.99ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 6614.01, reads: 92563.59, writes: 0.00, response time: 6.49ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 6144.00, reads: 86017.48, writes: 0.00, response time: 8.16ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6278.50, reads: 87890.57, writes: 0.00, response time: 7.28ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6522.00, reads: 91304.46, writes: 0.00, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 7268.94, reads: 101770.21, writes: 0.00, response time: 5.64ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 7107.55, reads: 99538.23, writes: 0.00, response time: 6.27ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 7104.51, reads: 99428.09, writes: 0.00, response time: 6.24ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 6501.49, reads: 91010.37, writes: 0.00, response time: 6.49ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 7007.51, reads: 98123.09, writes: 0.00, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 6614.50, reads: 92593.54, writes: 0.00, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 6868.51, reads: 96247.19, writes: 0.00, response time: 5.90ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 7365.99, reads: 103063.32, writes: 0.00, response time: 5.92ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 5770.98, reads: 80807.76, writes: 0.00, response time: 6.98ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5946.51, reads: 83219.70, writes: 0.00, response time: 8.20ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 6924.50, reads: 97020.96, writes: 0.00, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 6229.50, reads: 87192.56, writes: 0.00, response time: 6.35ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8378.99, reads: 117255.38, writes: 0.00, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8566.51, reads: 119921.09, writes: 0.00, response time: 5.22ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8592.50, reads: 120295.94, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8586.00, reads: 120205.93, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5677294
        write:                           0
        other:                           811042
        total:                           6488336
    transactions:                        405521 (6647.59 per sec.)
    read/write requests:                 5677294 (93066.30 per sec.)
    other operations:                    811042 (13295.19 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0027s
    total number of events:              405521
    total time taken by event execution: 1951.2911s
    response time:
         min:                                  1.89ms
         avg:                                  4.81ms
         max:                                177.85ms
         approx.  95 percentile:               6.86ms

Threads fairness:
    events (avg/stddev):           12672.5312/127.39
    execution time (avg/stddev):   60.9778/0.00

