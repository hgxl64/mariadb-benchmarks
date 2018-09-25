sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 64, tps: 420.48, reads: 0.00, writes: 8424.58, response time: 171.20ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 409.50, reads: 0.00, writes: 8187.05, response time: 171.76ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 415.00, reads: 0.00, writes: 8299.02, response time: 167.55ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 414.00, reads: 0.00, writes: 8288.98, response time: 169.42ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 421.00, reads: 0.00, writes: 8416.53, response time: 159.81ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 418.00, reads: 0.00, writes: 8354.50, response time: 157.06ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 410.99, reads: 0.00, writes: 8220.37, response time: 187.79ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 417.51, reads: 0.00, writes: 8349.63, response time: 161.35ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 415.00, reads: 0.00, writes: 8305.50, response time: 158.14ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 423.00, reads: 0.00, writes: 8452.00, response time: 156.17ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 421.00, reads: 0.00, writes: 8426.00, response time: 156.36ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 421.50, reads: 0.00, writes: 8419.50, response time: 159.00ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 421.00, reads: 0.00, writes: 8432.50, response time: 157.34ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 415.49, reads: 0.00, writes: 8304.89, response time: 160.43ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 427.01, reads: 0.00, writes: 8533.60, response time: 158.71ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 422.50, reads: 0.00, writes: 8457.52, response time: 155.19ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 416.00, reads: 0.00, writes: 8313.99, response time: 158.81ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 412.50, reads: 0.00, writes: 8255.51, response time: 174.09ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 414.00, reads: 0.00, writes: 8277.99, response time: 157.81ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 422.50, reads: 0.00, writes: 8450.52, response time: 157.91ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 414.00, reads: 0.00, writes: 8291.98, response time: 159.47ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 424.00, reads: 0.00, writes: 8465.51, response time: 160.29ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 411.00, reads: 0.00, writes: 8229.50, response time: 168.25ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 415.50, reads: 0.00, writes: 8303.99, response time: 160.77ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 413.50, reads: 0.00, writes: 8273.49, response time: 158.14ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           427140
        other:                           42714
        total:                           469854
    transactions:                        21357  (417.49 per sec.)
    read/write requests:                 427140 (8349.78 per sec.)
    other operations:                    42714  (834.98 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.1558s
    total number of events:              21357
    total time taken by event execution: 3268.8787s
    response time:
         min:                                  7.81ms
         avg:                                153.06ms
         max:                                191.55ms
         approx.  95 percentile:             159.95ms

Threads fairness:
    events (avg/stddev):           333.7031/0.46
    execution time (avg/stddev):   51.0762/0.05

