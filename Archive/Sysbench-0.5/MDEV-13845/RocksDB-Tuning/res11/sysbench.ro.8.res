sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 8, tps: 1929.34, reads: 27053.70, writes: 0.00, response time: 5.50ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 2273.00, reads: 31813.94, writes: 0.00, response time: 4.65ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 2468.02, reads: 34565.73, writes: 0.00, response time: 4.15ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 2677.00, reads: 37468.51, writes: 0.00, response time: 3.71ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 2802.50, reads: 39242.96, writes: 0.00, response time: 3.73ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 2867.50, reads: 40133.01, writes: 0.00, response time: 3.67ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 2861.50, reads: 40061.48, writes: 0.00, response time: 3.52ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 2957.99, reads: 41413.81, writes: 0.00, response time: 3.51ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 2639.51, reads: 36945.16, writes: 0.00, response time: 3.82ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 2710.00, reads: 37933.48, writes: 0.00, response time: 3.74ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 2556.00, reads: 35800.49, writes: 0.00, response time: 3.89ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 2774.00, reads: 38824.47, writes: 0.00, response time: 3.75ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 2580.00, reads: 36124.53, writes: 0.00, response time: 4.00ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 3028.00, reads: 42389.54, writes: 0.00, response time: 3.22ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 2745.00, reads: 38440.50, writes: 0.00, response time: 3.86ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 3047.00, reads: 42654.48, writes: 0.00, response time: 3.30ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 3021.00, reads: 42300.49, writes: 0.00, response time: 3.36ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 2866.50, reads: 40123.06, writes: 0.00, response time: 3.48ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 2980.50, reads: 41729.01, writes: 0.00, response time: 3.44ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 2956.49, reads: 41393.88, writes: 0.00, response time: 3.37ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 3011.01, reads: 42145.15, writes: 0.00, response time: 3.39ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 3506.50, reads: 49095.97, writes: 0.00, response time: 2.73ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 3606.00, reads: 50471.99, writes: 0.00, response time: 2.59ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 3645.00, reads: 51037.93, writes: 0.00, response time: 2.61ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 3334.50, reads: 46680.05, writes: 0.00, response time: 3.45ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 8, tps: 3296.51, reads: 46147.08, writes: 0.00, response time: 3.54ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 8, tps: 3216.45, reads: 45045.83, writes: 0.00, response time: 3.47ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 8, tps: 3238.54, reads: 45332.10, writes: 0.00, response time: 3.52ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 8, tps: 3304.44, reads: 46271.19, writes: 0.00, response time: 3.30ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 8, tps: 3439.06, reads: 48151.86, writes: 0.00, response time: 3.04ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            2518446
        write:                           0
        other:                           359778
        total:                           2878224
    transactions:                        179889 (2948.86 per sec.)
    read/write requests:                 2518446 (41284.09 per sec.)
    other operations:                    359778 (5897.73 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0028s
    total number of events:              179889
    total time taken by event execution: 487.7226s
    response time:
         min:                                  1.79ms
         avg:                                  2.71ms
         max:                                 87.32ms
         approx.  95 percentile:               3.63ms

Threads fairness:
    events (avg/stddev):           22486.1250/616.99
    execution time (avg/stddev):   60.9653/0.00

