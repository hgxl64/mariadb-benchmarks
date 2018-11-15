sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 64, tps: 5158.24, reads: 72579.31, writes: 0.00, response time: 25.56ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 5442.62, reads: 76183.23, writes: 0.00, response time: 22.77ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 5856.01, reads: 81980.07, writes: 0.00, response time: 21.13ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 6172.44, reads: 86426.62, writes: 0.00, response time: 19.97ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 5783.51, reads: 81004.09, writes: 0.00, response time: 21.53ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 5985.56, reads: 83738.88, writes: 0.00, response time: 20.94ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 5803.43, reads: 81297.51, writes: 0.00, response time: 21.14ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 5929.50, reads: 83007.02, writes: 0.00, response time: 21.28ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 5967.01, reads: 83476.12, writes: 0.00, response time: 20.84ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 5964.50, reads: 83561.46, writes: 0.00, response time: 21.03ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 5868.06, reads: 82106.40, writes: 0.00, response time: 22.11ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 6088.50, reads: 85237.48, writes: 0.00, response time: 20.19ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 5864.99, reads: 82108.85, writes: 0.00, response time: 21.27ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 5932.44, reads: 83077.60, writes: 0.00, response time: 21.44ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 6157.02, reads: 86182.76, writes: 0.00, response time: 20.29ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 6389.55, reads: 89439.72, writes: 0.00, response time: 19.22ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 6328.94, reads: 88658.73, writes: 0.00, response time: 19.83ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6491.00, reads: 90864.47, writes: 0.00, response time: 18.89ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6347.57, reads: 88833.92, writes: 0.00, response time: 19.87ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6328.48, reads: 88606.77, writes: 0.00, response time: 19.93ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6515.50, reads: 91249.46, writes: 0.00, response time: 18.86ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6531.95, reads: 91418.82, writes: 0.00, response time: 18.65ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6522.50, reads: 91319.97, writes: 0.00, response time: 18.65ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6425.56, reads: 89975.35, writes: 0.00, response time: 20.39ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6373.45, reads: 89205.74, writes: 0.00, response time: 20.02ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 64, tps: 6435.55, reads: 90083.23, writes: 0.00, response time: 19.14ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 64, tps: 6432.45, reads: 90120.29, writes: 0.00, response time: 19.50ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 64, tps: 6522.57, reads: 91294.93, writes: 0.00, response time: 18.74ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 64, tps: 6510.43, reads: 91109.97, writes: 0.00, response time: 18.84ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 64, tps: 6460.07, reads: 90503.53, writes: 0.00, response time: 19.06ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5259492
        write:                           0
        other:                           751356
        total:                           6010848
    transactions:                        375678 (6158.02 per sec.)
    read/write requests:                 5259492 (86212.28 per sec.)
    other operations:                    751356 (12316.04 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0063s
    total number of events:              375678
    total time taken by event execution: 3903.5005s
    response time:
         min:                                  2.23ms
         avg:                                 10.39ms
         max:                                116.69ms
         approx.  95 percentile:              20.26ms

Threads fairness:
    events (avg/stddev):           5869.9688/265.48
    execution time (avg/stddev):   60.9922/0.00

