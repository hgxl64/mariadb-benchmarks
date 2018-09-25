sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 443.98, reads: 0.00, writes: 4452.30, response time: 177.94ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 443.00, reads: 0.00, writes: 4441.01, response time: 163.34ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 448.50, reads: 0.00, writes: 4471.50, response time: 161.64ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 441.00, reads: 0.00, writes: 4406.46, response time: 157.72ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 443.50, reads: 0.00, writes: 4437.47, response time: 151.06ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 452.50, reads: 0.00, writes: 4530.03, response time: 149.13ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 453.50, reads: 0.00, writes: 4531.53, response time: 145.30ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 450.50, reads: 0.00, writes: 4502.01, response time: 145.39ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 443.50, reads: 0.00, writes: 4435.99, response time: 153.25ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 447.99, reads: 0.00, writes: 4478.93, response time: 147.18ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 448.01, reads: 0.00, writes: 4484.07, response time: 148.29ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 453.50, reads: 0.00, writes: 4528.46, response time: 146.61ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 449.00, reads: 0.00, writes: 4493.03, response time: 145.69ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 449.00, reads: 0.00, writes: 4487.00, response time: 147.45ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 446.00, reads: 0.00, writes: 4459.49, response time: 148.78ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 445.00, reads: 0.00, writes: 4451.46, response time: 154.40ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 454.01, reads: 0.00, writes: 4538.06, response time: 146.21ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 441.50, reads: 0.00, writes: 4419.99, response time: 159.95ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 443.00, reads: 0.00, writes: 4426.96, response time: 153.25ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 445.50, reads: 0.00, writes: 4454.54, response time: 149.00ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 447.00, reads: 0.00, writes: 4477.00, response time: 149.36ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 453.50, reads: 0.00, writes: 4531.46, response time: 144.99ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 446.00, reads: 0.00, writes: 4457.04, response time: 149.13ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 443.50, reads: 0.00, writes: 4434.49, response time: 148.46ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 441.00, reads: 0.00, writes: 4415.00, response time: 150.03ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           228570
        other:                           45714
        total:                           274284
    transactions:                        22857  (446.93 per sec.)
    read/write requests:                 228570 (4469.31 per sec.)
    other operations:                    45714  (893.86 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.1422s
    total number of events:              22857
    total time taken by event execution: 3268.3875s
    response time:
         min:                                  7.47ms
         avg:                                142.99ms
         max:                                182.74ms
         approx.  95 percentile:             149.62ms

Threads fairness:
    events (avg/stddev):           357.1406/0.35
    execution time (avg/stddev):   51.0686/0.04

