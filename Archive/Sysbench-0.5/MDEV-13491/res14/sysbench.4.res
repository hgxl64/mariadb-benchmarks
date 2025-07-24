sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 4
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 4, tps: 977.30, reads: 0.00, writes: 9792.99, response time: 6.31ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 4, tps: 986.52, reads: 0.00, writes: 9865.24, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 4, tps: 983.01, reads: 0.00, writes: 9811.59, response time: 6.10ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 4, tps: 1006.01, reads: 0.00, writes: 10078.55, response time: 6.01ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 4, tps: 1003.49, reads: 0.00, writes: 10026.93, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 4, tps: 991.50, reads: 0.00, writes: 9922.96, response time: 6.34ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 4, tps: 1015.50, reads: 0.00, writes: 10154.98, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 4, tps: 1001.50, reads: 0.00, writes: 10014.99, response time: 6.19ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 4, tps: 968.50, reads: 0.00, writes: 9684.98, response time: 6.52ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 4, tps: 980.50, reads: 0.00, writes: 9794.04, response time: 6.48ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 4, tps: 1009.00, reads: 0.00, writes: 10096.50, response time: 6.12ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 4, tps: 982.00, reads: 0.00, writes: 9824.49, response time: 6.39ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 4, tps: 970.00, reads: 0.00, writes: 9700.00, response time: 6.38ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 4, tps: 1011.51, reads: 0.00, writes: 10105.12, response time: 6.05ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 4, tps: 1020.49, reads: 0.00, writes: 10214.37, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 4, tps: 995.50, reads: 0.00, writes: 9955.50, response time: 6.51ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 4, tps: 1022.00, reads: 0.00, writes: 10219.03, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 4, tps: 1001.50, reads: 0.00, writes: 10008.46, response time: 6.08ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 4, tps: 996.50, reads: 0.00, writes: 9972.52, response time: 6.15ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 4, tps: 984.00, reads: 0.00, writes: 9840.00, response time: 6.40ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 4, tps: 1016.00, reads: 0.00, writes: 10158.51, response time: 6.07ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 4, tps: 1020.01, reads: 0.00, writes: 10195.59, response time: 6.22ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 4, tps: 1004.00, reads: 0.00, writes: 10040.98, response time: 6.04ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 4, tps: 1029.50, reads: 0.00, writes: 10289.53, response time: 6.13ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 4, tps: 994.99, reads: 0.00, writes: 9958.88, response time: 6.23ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           509870
        other:                           101974
        total:                           611844
    transactions:                        50987  (999.71 per sec.)
    read/write requests:                 509870 (9997.11 per sec.)
    other operations:                    101974 (1999.42 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0018s
    total number of events:              50987
    total time taken by event execution: 203.8897s
    response time:
         min:                                  1.01ms
         avg:                                  4.00ms
         max:                                 32.85ms
         approx.  95 percentile:               6.20ms

Threads fairness:
    events (avg/stddev):           12746.7500/25.58
    execution time (avg/stddev):   50.9724/0.00

