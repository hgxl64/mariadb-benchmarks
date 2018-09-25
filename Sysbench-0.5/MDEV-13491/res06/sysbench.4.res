sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 992.24, reads: 0.00, writes: 9942.38, response time: 5.97ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 990.51, reads: 0.00, writes: 9905.07, response time: 6.06ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 1010.50, reads: 0.00, writes: 10097.01, response time: 6.14ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 1011.50, reads: 0.00, writes: 10122.98, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 991.50, reads: 0.00, writes: 9915.00, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 999.50, reads: 0.00, writes: 9983.01, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 1016.50, reads: 0.00, writes: 10175.49, response time: 5.84ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 987.50, reads: 0.00, writes: 9875.01, response time: 6.44ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 990.50, reads: 0.00, writes: 9903.98, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 976.50, reads: 0.00, writes: 9767.50, response time: 6.36ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 984.00, reads: 0.00, writes: 9840.00, response time: 6.47ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 1002.50, reads: 0.00, writes: 10015.01, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 1007.50, reads: 0.00, writes: 10078.50, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 1018.50, reads: 0.00, writes: 10186.50, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 1008.50, reads: 0.00, writes: 10090.00, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 987.00, reads: 0.00, writes: 9870.03, response time: 6.32ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1017.50, reads: 0.00, writes: 10164.99, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 1009.00, reads: 0.00, writes: 10099.98, response time: 6.02ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 1016.00, reads: 0.00, writes: 10149.99, response time: 5.95ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 1011.00, reads: 0.00, writes: 10117.50, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 1011.99, reads: 0.00, writes: 10117.92, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 995.51, reads: 0.00, writes: 9959.59, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 1017.00, reads: 0.00, writes: 10161.46, response time: 5.99ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 993.50, reads: 0.00, writes: 9942.04, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 1012.51, reads: 0.00, writes: 10122.07, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           511460
        other:                           102292
        total:                           613752
    transactions:                        51146  (1002.80 per sec.)
    read/write requests:                 511460 (10027.99 per sec.)
    other operations:                    102292 (2005.60 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0032s
    total number of events:              51146
    total time taken by event execution: 203.8937s
    response time:
         min:                                  0.98ms
         avg:                                  3.99ms
         max:                                 21.96ms
         approx.  95 percentile:               6.09ms

Threads fairness:
    events (avg/stddev):           12786.5000/57.25
    execution time (avg/stddev):   50.9734/0.00

