sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 32, tps: 6403.28, reads: 89777.35, writes: 0.00, response time: 6.79ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6123.01, reads: 85753.63, writes: 0.00, response time: 6.88ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 7053.98, reads: 98748.18, writes: 0.00, response time: 6.66ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6249.02, reads: 87477.72, writes: 0.00, response time: 7.28ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6690.00, reads: 93655.51, writes: 0.00, response time: 6.42ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 6490.50, reads: 90899.55, writes: 0.00, response time: 6.93ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 7133.99, reads: 99842.92, writes: 0.00, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 7315.50, reads: 102418.00, writes: 0.00, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6772.00, reads: 94808.98, writes: 0.00, response time: 6.45ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 7345.99, reads: 102923.89, writes: 0.00, response time: 6.17ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 7267.01, reads: 101657.10, writes: 0.00, response time: 5.92ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 6487.45, reads: 90905.28, writes: 0.00, response time: 6.62ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6895.06, reads: 96473.28, writes: 0.00, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 6926.50, reads: 96939.97, writes: 0.00, response time: 6.25ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 6704.92, reads: 93957.44, writes: 0.00, response time: 6.20ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 7039.58, reads: 98469.68, writes: 0.00, response time: 6.26ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 7018.44, reads: 98342.67, writes: 0.00, response time: 5.92ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 7306.04, reads: 102213.11, writes: 0.00, response time: 5.94ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 7174.01, reads: 100441.68, writes: 0.00, response time: 6.37ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 7202.00, reads: 100820.04, writes: 0.00, response time: 6.44ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 8510.49, reads: 119128.85, writes: 0.00, response time: 5.23ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 8633.02, reads: 120892.81, writes: 0.00, response time: 5.06ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 8686.49, reads: 121585.80, writes: 0.00, response time: 4.95ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 8661.51, reads: 121277.11, writes: 0.00, response time: 5.18ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 8684.49, reads: 121569.89, writes: 0.00, response time: 5.00ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 32, tps: 8680.51, reads: 121552.10, writes: 0.00, response time: 5.01ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 32, tps: 8665.00, reads: 121282.01, writes: 0.00, response time: 5.05ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 32, tps: 8646.01, reads: 121061.58, writes: 0.00, response time: 5.06ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 32, tps: 8668.49, reads: 121346.41, writes: 0.00, response time: 5.21ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 32, tps: 8681.99, reads: 121556.83, writes: 0.00, response time: 5.04ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            6397146
        write:                           0
        other:                           913878
        total:                           7311024
    transactions:                        456939 (7490.47 per sec.)
    read/write requests:                 6397146 (104866.60 per sec.)
    other operations:                    913878 (14980.94 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0027s
    total number of events:              456939
    total time taken by event execution: 1951.3009s
    response time:
         min:                                  2.11ms
         avg:                                  4.27ms
         max:                                272.59ms
         approx.  95 percentile:               5.93ms

Threads fairness:
    events (avg/stddev):           14279.3438/221.46
    execution time (avg/stddev):   60.9782/0.00

