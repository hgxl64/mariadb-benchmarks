sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 64, tps: 4534.31, reads: 63815.87, writes: 0.00, response time: 27.08ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 4763.02, reads: 66717.29, writes: 0.00, response time: 24.58ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 5093.00, reads: 71318.94, writes: 0.00, response time: 23.16ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 5279.01, reads: 73846.58, writes: 0.00, response time: 22.43ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 5044.49, reads: 70619.92, writes: 0.00, response time: 22.93ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 5707.00, reads: 79917.52, writes: 0.00, response time: 20.73ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 4942.00, reads: 69190.97, writes: 0.00, response time: 23.33ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 5780.01, reads: 80900.59, writes: 0.00, response time: 20.29ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 5125.00, reads: 71732.04, writes: 0.00, response time: 22.77ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 5017.49, reads: 70210.37, writes: 0.00, response time: 23.98ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 4961.51, reads: 69559.58, writes: 0.00, response time: 22.95ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 5050.50, reads: 70669.48, writes: 0.00, response time: 24.23ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 5242.00, reads: 73406.46, writes: 0.00, response time: 22.35ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 5405.50, reads: 75606.04, writes: 0.00, response time: 22.09ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 5573.49, reads: 78082.83, writes: 0.00, response time: 21.80ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 5767.01, reads: 80739.64, writes: 0.00, response time: 21.75ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 5251.51, reads: 73549.07, writes: 0.00, response time: 22.99ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 5453.99, reads: 76293.39, writes: 0.00, response time: 23.40ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 5093.00, reads: 71341.99, writes: 0.00, response time: 23.80ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 5870.51, reads: 82206.09, writes: 0.00, response time: 20.74ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 5073.50, reads: 71000.96, writes: 0.00, response time: 24.50ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 5565.50, reads: 77930.99, writes: 0.00, response time: 22.00ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 5271.51, reads: 73812.16, writes: 0.00, response time: 22.90ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 5655.99, reads: 79178.40, writes: 0.00, response time: 21.69ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 5931.00, reads: 83013.01, writes: 0.00, response time: 21.53ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 64, tps: 5733.00, reads: 80273.46, writes: 0.00, response time: 20.69ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 64, tps: 5822.01, reads: 81610.12, writes: 0.00, response time: 20.58ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 64, tps: 5425.50, reads: 75875.48, writes: 0.00, response time: 22.23ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 64, tps: 5240.00, reads: 73345.98, writes: 0.00, response time: 22.76ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 64, tps: 5700.94, reads: 79905.71, writes: 0.00, response time: 20.32ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            4565484
        write:                           0
        other:                           652212
        total:                           5217696
    transactions:                        326106 (5345.45 per sec.)
    read/write requests:                 4565484 (74836.35 per sec.)
    other operations:                    652212 (10690.91 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0062s
    total number of events:              326106
    total time taken by event execution: 3903.6235s
    response time:
         min:                                  1.81ms
         avg:                                 11.97ms
         max:                                182.28ms
         approx.  95 percentile:              22.46ms

Threads fairness:
    events (avg/stddev):           5095.4062/260.10
    execution time (avg/stddev):   60.9941/0.00

