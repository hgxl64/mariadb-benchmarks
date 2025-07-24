sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 5359.73, reads: 75160.71, writes: 0.00, response time: 7.92ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 5595.50, reads: 78359.02, writes: 0.00, response time: 7.98ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 6414.50, reads: 89784.52, writes: 0.00, response time: 7.40ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6639.01, reads: 92985.07, writes: 0.00, response time: 6.43ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 5847.88, reads: 81848.76, writes: 0.00, response time: 6.84ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6507.63, reads: 91099.84, writes: 0.00, response time: 6.92ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 5986.50, reads: 83823.49, writes: 0.00, response time: 7.17ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6167.99, reads: 86329.41, writes: 0.00, response time: 7.08ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6256.01, reads: 87679.66, writes: 0.00, response time: 7.24ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6631.51, reads: 92829.65, writes: 0.00, response time: 6.53ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 6114.49, reads: 85540.37, writes: 0.00, response time: 6.76ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 6705.50, reads: 93885.00, writes: 0.00, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6575.99, reads: 92055.37, writes: 0.00, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6561.52, reads: 91935.71, writes: 0.00, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 7035.50, reads: 98447.95, writes: 0.00, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 6431.48, reads: 90033.28, writes: 0.00, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 7028.01, reads: 98372.64, writes: 0.00, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 6984.91, reads: 97800.79, writes: 0.00, response time: 6.46ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 6056.08, reads: 84771.05, writes: 0.00, response time: 6.57ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 6874.50, reads: 96243.03, writes: 0.00, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5886.50, reads: 82423.56, writes: 0.00, response time: 6.80ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 7525.50, reads: 105337.98, writes: 0.00, response time: 5.91ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 8531.00, reads: 119468.93, writes: 0.00, response time: 5.27ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 8300.50, reads: 116186.03, writes: 0.00, response time: 5.43ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 8365.50, reads: 117106.06, writes: 0.00, response time: 5.37ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 8403.50, reads: 117651.95, writes: 0.00, response time: 5.33ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8390.99, reads: 117484.93, writes: 0.00, response time: 5.38ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8416.01, reads: 117815.07, writes: 0.00, response time: 5.31ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8396.50, reads: 117546.05, writes: 0.00, response time: 5.37ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8400.49, reads: 117611.40, writes: 0.00, response time: 5.25ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5952646
        write:                           0
        other:                           850378
        total:                           6803024
    transactions:                        425189 (6969.99 per sec.)
    read/write requests:                 5952646 (97579.89 per sec.)
    other operations:                    850378 (13939.98 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0028s
    total number of events:              425189
    total time taken by event execution: 1951.2559s
    response time:
         min:                                  2.11ms
         avg:                                  4.59ms
         max:                                188.92ms
         approx.  95 percentile:               6.37ms

Threads fairness:
    events (avg/stddev):           13287.1562/262.24
    execution time (avg/stddev):   60.9767/0.00

