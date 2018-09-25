sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 32
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 32, tps: 5601.09, reads: 0.00, writes: 56103.90, response time: 8.43ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 32, tps: 6163.63, reads: 0.00, writes: 61588.76, response time: 8.22ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 32, tps: 6283.50, reads: 0.00, writes: 62866.97, response time: 7.93ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 32, tps: 6241.50, reads: 0.00, writes: 62436.53, response time: 7.69ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 32, tps: 6168.50, reads: 0.00, writes: 61667.52, response time: 7.86ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 32, tps: 5972.50, reads: 0.00, writes: 59803.52, response time: 8.59ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 32, tps: 6123.50, reads: 0.00, writes: 61235.01, response time: 8.16ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 32, tps: 6159.00, reads: 0.00, writes: 61590.02, response time: 8.09ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 32, tps: 6047.50, reads: 0.00, writes: 60474.99, response time: 7.87ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 32, tps: 6169.50, reads: 0.00, writes: 61688.98, response time: 8.00ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 32, tps: 5900.99, reads: 0.00, writes: 58969.44, response time: 8.31ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 32, tps: 6055.50, reads: 0.00, writes: 60580.04, response time: 8.04ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 32, tps: 6084.50, reads: 0.00, writes: 60772.98, response time: 8.45ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 32, tps: 5885.01, reads: 0.00, writes: 58937.56, response time: 8.37ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 32, tps: 5891.50, reads: 0.00, writes: 58865.00, response time: 8.66ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 32, tps: 6031.00, reads: 0.00, writes: 60279.48, response time: 8.44ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 32, tps: 5793.49, reads: 0.00, writes: 58001.89, response time: 8.31ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 32, tps: 5917.51, reads: 0.00, writes: 59120.58, response time: 8.17ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 32, tps: 5695.50, reads: 0.00, writes: 57027.53, response time: 9.20ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 32, tps: 5797.50, reads: 0.00, writes: 57919.50, response time: 8.52ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 32, tps: 5780.99, reads: 0.00, writes: 57836.93, response time: 9.16ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 32, tps: 5767.51, reads: 0.00, writes: 57667.06, response time: 8.78ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 32, tps: 6122.50, reads: 0.00, writes: 61162.01, response time: 8.09ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 32, tps: 5976.00, reads: 0.00, writes: 59861.00, response time: 7.90ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 32, tps: 5909.96, reads: 0.00, writes: 59081.10, response time: 8.69ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           3049090
        other:                           609818
        total:                           3658908
    transactions:                        304909 (5978.14 per sec.)
    read/write requests:                 3049090 (59781.37 per sec.)
    other operations:                    609818 (11956.27 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0040s
    total number of events:              304909
    total time taken by event execution: 1631.6439s
    response time:
         min:                                  0.75ms
         avg:                                  5.35ms
         max:                                 58.93ms
         approx.  95 percentile:               8.31ms

Threads fairness:
    events (avg/stddev):           9528.4062/58.12
    execution time (avg/stddev):   50.9889/0.00

