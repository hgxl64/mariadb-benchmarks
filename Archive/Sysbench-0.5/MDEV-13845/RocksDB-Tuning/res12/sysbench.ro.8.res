sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 8, tps: 2007.92, reads: 28134.33, writes: 0.00, response time: 5.36ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 2234.01, reads: 31292.61, writes: 0.00, response time: 4.82ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 2407.50, reads: 33695.95, writes: 0.00, response time: 4.34ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 2591.05, reads: 36279.72, writes: 0.00, response time: 3.89ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 2653.45, reads: 37151.24, writes: 0.00, response time: 3.90ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 3130.50, reads: 43820.02, writes: 0.00, response time: 3.00ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 3122.00, reads: 43720.54, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 3124.98, reads: 43742.25, writes: 0.00, response time: 2.98ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 3045.01, reads: 42633.21, writes: 0.00, response time: 3.45ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 3177.00, reads: 44476.49, writes: 0.00, response time: 3.11ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 3065.00, reads: 42904.47, writes: 0.00, response time: 3.29ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 3340.57, reads: 46773.42, writes: 0.00, response time: 2.72ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 3262.93, reads: 45669.48, writes: 0.00, response time: 2.95ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 2978.50, reads: 41712.02, writes: 0.00, response time: 3.44ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 3016.08, reads: 42218.06, writes: 0.00, response time: 3.31ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 2697.43, reads: 37771.57, writes: 0.00, response time: 4.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 2545.01, reads: 35621.58, writes: 0.00, response time: 4.33ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 2816.00, reads: 39431.53, writes: 0.00, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 3205.00, reads: 44864.54, writes: 0.00, response time: 3.06ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 3253.00, reads: 45534.49, writes: 0.00, response time: 3.20ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 3198.00, reads: 44779.99, writes: 0.00, response time: 3.38ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 3100.50, reads: 43403.50, writes: 0.00, response time: 3.44ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 3080.00, reads: 43128.97, writes: 0.00, response time: 3.39ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 2973.00, reads: 41617.06, writes: 0.00, response time: 3.63ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 3091.00, reads: 43271.45, writes: 0.00, response time: 3.50ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 8, tps: 3419.50, reads: 47870.95, writes: 0.00, response time: 3.09ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 8, tps: 3413.00, reads: 47780.53, writes: 0.00, response time: 3.09ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 8, tps: 3416.98, reads: 47833.18, writes: 0.00, response time: 3.12ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 8, tps: 3548.99, reads: 49701.82, writes: 0.00, response time: 3.08ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 8, tps: 3835.04, reads: 53681.57, writes: 0.00, response time: 2.33ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            2591288
        write:                           0
        other:                           370184
        total:                           2961472
    transactions:                        185092 (3034.20 per sec.)
    read/write requests:                 2591288 (42478.79 per sec.)
    other operations:                    370184 (6068.40 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0019s
    total number of events:              185092
    total time taken by event execution: 487.7069s
    response time:
         min:                                  1.74ms
         avg:                                  2.63ms
         max:                                 85.41ms
         approx.  95 percentile:               3.67ms

Threads fairness:
    events (avg/stddev):           23136.5000/680.03
    execution time (avg/stddev):   60.9634/0.00

