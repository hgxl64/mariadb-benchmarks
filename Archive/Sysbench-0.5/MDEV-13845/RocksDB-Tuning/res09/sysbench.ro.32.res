sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 6216.71, reads: 87257.96, writes: 0.00, response time: 6.80ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6592.50, reads: 92213.95, writes: 0.00, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 7197.08, reads: 100757.10, writes: 0.00, response time: 5.84ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 7069.49, reads: 98961.30, writes: 0.00, response time: 5.82ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6938.01, reads: 97144.63, writes: 0.00, response time: 6.00ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6984.01, reads: 97775.13, writes: 0.00, response time: 5.98ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 7059.98, reads: 98834.72, writes: 0.00, response time: 5.74ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6729.02, reads: 94196.82, writes: 0.00, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6787.01, reads: 95033.57, writes: 0.00, response time: 6.25ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6506.49, reads: 91104.33, writes: 0.00, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 7061.50, reads: 98846.00, writes: 0.00, response time: 5.63ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 8186.01, reads: 114596.10, writes: 0.00, response time: 5.21ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 8303.50, reads: 116290.98, writes: 0.00, response time: 5.29ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 8327.99, reads: 116562.93, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 8307.50, reads: 116301.03, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 8301.50, reads: 116214.99, writes: 0.00, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 8298.00, reads: 116190.00, writes: 0.00, response time: 5.23ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 8339.50, reads: 116737.51, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 8319.96, reads: 116506.48, writes: 0.00, response time: 5.17ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 8313.55, reads: 116380.68, writes: 0.00, response time: 5.14ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 8321.99, reads: 116495.86, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 8338.47, reads: 116736.01, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 8304.03, reads: 116249.47, writes: 0.00, response time: 5.19ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 8333.00, reads: 116681.96, writes: 0.00, response time: 5.15ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 8340.00, reads: 116751.54, writes: 0.00, response time: 5.09ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 8353.00, reads: 116962.52, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8290.50, reads: 116057.00, writes: 0.00, response time: 5.20ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8305.49, reads: 116260.90, writes: 0.00, response time: 5.16ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8288.01, reads: 116053.66, writes: 0.00, response time: 5.13ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8328.99, reads: 116581.39, writes: 0.00, response time: 5.09ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            6641950
        write:                           0
        other:                           948850
        total:                           7590800
    transactions:                        474425 (7777.07 per sec.)
    read/write requests:                 6641950 (108878.96 per sec.)
    other operations:                    948850 (15554.14 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0031s
    total number of events:              474425
    total time taken by event execution: 1951.2296s
    response time:
         min:                                  2.21ms
         avg:                                  4.11ms
         max:                                186.40ms
         approx.  95 percentile:               5.46ms

Threads fairness:
    events (avg/stddev):           14825.7812/155.36
    execution time (avg/stddev):   60.9759/0.00

