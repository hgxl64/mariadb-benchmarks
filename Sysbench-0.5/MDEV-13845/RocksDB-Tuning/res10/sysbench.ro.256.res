sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 256
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 256, tps: 3345.86, reads: 48512.45, writes: 0.00, response time: 240.25ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 256, tps: 3622.51, reads: 50767.18, writes: 0.00, response time: 199.20ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 256, tps: 3795.50, reads: 53133.45, writes: 0.00, response time: 195.24ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 256, tps: 3781.50, reads: 52928.52, writes: 0.00, response time: 191.08ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 256, tps: 3856.99, reads: 53968.84, writes: 0.00, response time: 184.72ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 256, tps: 3776.51, reads: 52868.19, writes: 0.00, response time: 192.74ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 256, tps: 3771.99, reads: 52875.84, writes: 0.00, response time: 185.67ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 256, tps: 3790.50, reads: 52987.07, writes: 0.00, response time: 190.51ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 256, tps: 3834.00, reads: 53684.99, writes: 0.00, response time: 187.28ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 256, tps: 3712.01, reads: 52043.08, writes: 0.00, response time: 193.73ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 256, tps: 3850.50, reads: 53869.51, writes: 0.00, response time: 188.41ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 256, tps: 3810.99, reads: 53346.39, writes: 0.00, response time: 189.94ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 256, tps: 3810.50, reads: 53348.56, writes: 0.00, response time: 189.94ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 256, tps: 3823.50, reads: 53552.54, writes: 0.00, response time: 185.89ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 256, tps: 3864.50, reads: 54038.99, writes: 0.00, response time: 182.85ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 256, tps: 3764.49, reads: 52757.40, writes: 0.00, response time: 191.54ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 256, tps: 3834.01, reads: 53683.08, writes: 0.00, response time: 185.22ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 256, tps: 3847.50, reads: 53822.97, writes: 0.00, response time: 182.63ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 256, tps: 3794.00, reads: 53123.98, writes: 0.00, response time: 188.86ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 256, tps: 3847.50, reads: 53886.48, writes: 0.00, response time: 182.14ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 256, tps: 3828.01, reads: 53564.11, writes: 0.00, response time: 189.48ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 256, tps: 3822.99, reads: 53502.89, writes: 0.00, response time: 186.78ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 256, tps: 3759.00, reads: 52614.01, writes: 0.00, response time: 191.25ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 256, tps: 3796.50, reads: 53245.01, writes: 0.00, response time: 187.73ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 256, tps: 3869.00, reads: 54113.06, writes: 0.00, response time: 184.95ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 256, tps: 3782.49, reads: 52948.40, writes: 0.00, response time: 190.45ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 256, tps: 3766.00, reads: 52689.56, writes: 0.00, response time: 191.02ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 256, tps: 3798.50, reads: 53211.94, writes: 0.00, response time: 190.05ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 256, tps: 3815.50, reads: 53451.48, writes: 0.00, response time: 191.82ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 256, tps: 3794.00, reads: 53116.56, writes: 0.00, response time: 189.71ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            3235946
        write:                           0
        other:                           462278
        total:                           3698224
    transactions:                        231139 (3787.47 per sec.)
    read/write requests:                 3235946 (53024.56 per sec.)
    other operations:                    462278 (7574.94 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0273s
    total number of events:              231139
    total time taken by event execution: 15618.5564s
    response time:
         min:                                  2.17ms
         avg:                                 67.57ms
         max:                                777.79ms
         approx.  95 percentile:             190.34ms

Threads fairness:
    events (avg/stddev):           902.8867/24.80
    execution time (avg/stddev):   61.0100/0.01

