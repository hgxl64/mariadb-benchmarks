sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 16, tps: 590.54, reads: 0.00, writes: 5951.37, response time: 31.98ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 551.49, reads: 0.00, writes: 5506.94, response time: 32.76ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 533.00, reads: 0.00, writes: 5334.02, response time: 33.51ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 531.51, reads: 0.00, writes: 5310.06, response time: 33.44ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 543.49, reads: 0.00, writes: 5444.44, response time: 32.53ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 546.01, reads: 0.00, writes: 5456.06, response time: 33.18ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 537.50, reads: 0.00, writes: 5375.49, response time: 32.69ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 524.00, reads: 0.00, writes: 5241.98, response time: 33.45ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 543.50, reads: 0.00, writes: 5416.50, response time: 32.50ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 526.50, reads: 0.00, writes: 5280.49, response time: 33.37ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 526.50, reads: 0.00, writes: 5271.49, response time: 33.17ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 537.50, reads: 0.00, writes: 5360.99, response time: 32.75ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 524.00, reads: 0.00, writes: 5248.99, response time: 33.38ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 532.51, reads: 0.00, writes: 5316.55, response time: 33.12ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 544.00, reads: 0.00, writes: 5442.01, response time: 33.12ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 526.00, reads: 0.00, writes: 5265.51, response time: 33.16ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 539.99, reads: 0.00, writes: 5404.92, response time: 32.42ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 537.00, reads: 0.00, writes: 5362.47, response time: 32.95ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 534.00, reads: 0.00, writes: 5334.04, response time: 32.70ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 525.50, reads: 0.00, writes: 5266.50, response time: 33.72ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 540.50, reads: 0.00, writes: 5392.01, response time: 33.06ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 539.00, reads: 0.00, writes: 5402.05, response time: 32.64ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 529.00, reads: 0.00, writes: 5288.51, response time: 33.06ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 547.00, reads: 0.00, writes: 5466.99, response time: 32.22ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 533.50, reads: 0.00, writes: 5342.51, response time: 33.25ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           274470
        other:                           54894
        total:                           329364
    transactions:                        27447  (537.98 per sec.)
    read/write requests:                 274470 (5379.84 per sec.)
    other operations:                    54894  (1075.97 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0182s
    total number of events:              27447
    total time taken by event execution: 816.0592s
    response time:
         min:                                  4.51ms
         avg:                                 29.73ms
         max:                                 85.26ms
         approx.  95 percentile:              33.05ms

Threads fairness:
    events (avg/stddev):           1715.4375/2.06
    execution time (avg/stddev):   51.0037/0.01

