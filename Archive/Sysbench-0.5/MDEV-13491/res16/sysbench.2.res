sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 2
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 2, tps: 437.12, reads: 0.00, writes: 4375.70, response time: 5.85ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 2, tps: 453.50, reads: 0.00, writes: 4535.52, response time: 5.82ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 2, tps: 436.50, reads: 0.00, writes: 4366.49, response time: 5.65ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 2, tps: 466.50, reads: 0.00, writes: 4668.48, response time: 5.52ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 2, tps: 470.00, reads: 0.00, writes: 4696.52, response time: 5.69ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 2, tps: 463.50, reads: 0.00, writes: 4637.00, response time: 5.73ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 2, tps: 452.51, reads: 0.00, writes: 4521.07, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 2, tps: 482.99, reads: 0.00, writes: 4834.43, response time: 5.41ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 2, tps: 482.50, reads: 0.00, writes: 4826.00, response time: 5.26ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 2, tps: 459.50, reads: 0.00, writes: 4591.00, response time: 5.67ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 2, tps: 452.00, reads: 0.00, writes: 4521.50, response time: 5.88ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 2, tps: 440.50, reads: 0.00, writes: 4403.01, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 2, tps: 434.50, reads: 0.00, writes: 4347.99, response time: 6.28ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 2, tps: 466.50, reads: 0.00, writes: 4666.51, response time: 5.66ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 2, tps: 480.00, reads: 0.00, writes: 4795.99, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 2, tps: 464.50, reads: 0.00, writes: 4644.50, response time: 5.77ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 2, tps: 456.50, reads: 0.00, writes: 4569.50, response time: 5.80ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 2, tps: 462.00, reads: 0.00, writes: 4617.00, response time: 5.67ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 2, tps: 440.50, reads: 0.00, writes: 4406.50, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 2, tps: 462.00, reads: 0.00, writes: 4615.01, response time: 5.84ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 2, tps: 457.00, reads: 0.00, writes: 4571.49, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 2, tps: 462.50, reads: 0.00, writes: 4630.00, response time: 5.64ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 2, tps: 468.00, reads: 0.00, writes: 4680.00, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 2, tps: 459.50, reads: 0.00, writes: 4590.50, response time: 5.80ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 2, tps: 462.00, reads: 0.00, writes: 4621.00, response time: 5.55ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           233980
        other:                           46796
        total:                           280776
    transactions:                        23398  (458.75 per sec.)
    read/write requests:                 233980 (4587.49 per sec.)
    other operations:                    46796  (917.50 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0040s
    total number of events:              23398
    total time taken by event execution: 101.9587s
    response time:
         min:                                  1.54ms
         avg:                                  4.36ms
         max:                                 38.94ms
         approx.  95 percentile:               5.76ms

Threads fairness:
    events (avg/stddev):           11699.0000/1.00
    execution time (avg/stddev):   50.9794/0.00

