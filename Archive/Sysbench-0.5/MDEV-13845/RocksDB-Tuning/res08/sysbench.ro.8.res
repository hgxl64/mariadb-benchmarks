sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 8
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 8, tps: 3072.70, reads: 43049.35, writes: 0.00, response time: 3.52ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 8, tps: 3070.02, reads: 42974.79, writes: 0.00, response time: 3.34ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 8, tps: 2914.49, reads: 40809.43, writes: 0.00, response time: 3.47ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 8, tps: 2906.00, reads: 40679.04, writes: 0.00, response time: 3.43ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 8, tps: 3105.00, reads: 43480.97, writes: 0.00, response time: 3.35ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 8, tps: 3327.50, reads: 46581.02, writes: 0.00, response time: 3.14ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 8, tps: 3237.50, reads: 45314.53, writes: 0.00, response time: 3.32ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 8, tps: 3191.00, reads: 44683.04, writes: 0.00, response time: 3.27ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 8, tps: 3196.99, reads: 44770.41, writes: 0.00, response time: 3.17ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 8, tps: 3350.50, reads: 46900.53, writes: 0.00, response time: 3.15ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 8, tps: 3324.50, reads: 46538.47, writes: 0.00, response time: 3.33ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 8, tps: 3198.00, reads: 44774.51, writes: 0.00, response time: 3.57ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 8, tps: 3245.50, reads: 45424.56, writes: 0.00, response time: 3.57ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 8, tps: 3579.50, reads: 50121.99, writes: 0.00, response time: 2.42ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 8, tps: 3510.00, reads: 49155.50, writes: 0.00, response time: 2.48ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 8, tps: 3375.49, reads: 47245.93, writes: 0.00, response time: 3.19ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 8, tps: 3132.00, reads: 43844.01, writes: 0.00, response time: 3.54ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 8, tps: 3164.00, reads: 44297.02, writes: 0.00, response time: 3.38ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 8, tps: 3324.50, reads: 46548.02, writes: 0.00, response time: 3.11ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 8, tps: 3447.01, reads: 48262.68, writes: 0.00, response time: 3.13ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 8, tps: 3526.99, reads: 49359.34, writes: 0.00, response time: 2.48ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 8, tps: 3499.00, reads: 49008.00, writes: 0.00, response time: 2.65ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 8, tps: 3509.00, reads: 49112.94, writes: 0.00, response time: 2.54ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 8, tps: 3196.48, reads: 44753.71, writes: 0.00, response time: 3.33ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 8, tps: 3184.02, reads: 44580.80, writes: 0.00, response time: 3.44ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 8, tps: 3345.50, reads: 46839.06, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 8, tps: 3279.50, reads: 45910.44, writes: 0.00, response time: 3.10ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 8, tps: 3280.00, reads: 45920.51, writes: 0.00, response time: 3.13ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 8, tps: 3289.00, reads: 46035.49, writes: 0.00, response time: 3.18ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 8, tps: 3419.00, reads: 47867.47, writes: 0.00, response time: 2.79ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            2796794
        write:                           0
        other:                           399542
        total:                           3196336
    transactions:                        199771 (3274.81 per sec.)
    read/write requests:                 2796794 (45847.38 per sec.)
    other operations:                    399542 (6549.63 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0023s
    total number of events:              199771
    total time taken by event execution: 487.6737s
    response time:
         min:                                  1.88ms
         avg:                                  2.44ms
         max:                                  8.05ms
         approx.  95 percentile:               3.28ms

Threads fairness:
    events (avg/stddev):           24971.3750/578.44
    execution time (avg/stddev):   60.9592/0.00

