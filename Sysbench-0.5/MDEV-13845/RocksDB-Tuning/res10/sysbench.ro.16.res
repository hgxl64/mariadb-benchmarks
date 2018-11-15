sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 16
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 16, tps: 4402.43, reads: 61745.96, writes: 0.00, response time: 4.86ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 16, tps: 5396.56, reads: 75502.40, writes: 0.00, response time: 3.98ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 16, tps: 6193.50, reads: 86726.45, writes: 0.00, response time: 3.25ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 16, tps: 6666.50, reads: 93334.01, writes: 0.00, response time: 2.91ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 16, tps: 6496.50, reads: 90930.97, writes: 0.00, response time: 3.05ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 16, tps: 6463.51, reads: 90504.09, writes: 0.00, response time: 3.14ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 16, tps: 6455.50, reads: 90360.55, writes: 0.00, response time: 3.13ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 16, tps: 6591.99, reads: 92298.43, writes: 0.00, response time: 3.00ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 16, tps: 6448.01, reads: 90281.07, writes: 0.00, response time: 3.05ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 16, tps: 6532.50, reads: 91454.44, writes: 0.00, response time: 3.04ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 16, tps: 6500.99, reads: 91003.87, writes: 0.00, response time: 3.09ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 16, tps: 6224.01, reads: 87137.64, writes: 0.00, response time: 3.38ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 16, tps: 6241.50, reads: 87373.46, writes: 0.00, response time: 3.17ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 16, tps: 6527.00, reads: 91375.99, writes: 0.00, response time: 3.04ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 16, tps: 6594.98, reads: 92320.26, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 16, tps: 6554.02, reads: 91772.23, writes: 0.00, response time: 3.03ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 16, tps: 6359.49, reads: 89024.91, writes: 0.00, response time: 3.24ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 16, tps: 6447.51, reads: 90285.59, writes: 0.00, response time: 3.13ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 16, tps: 6460.50, reads: 90424.04, writes: 0.00, response time: 3.05ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 16, tps: 6457.50, reads: 90416.95, writes: 0.00, response time: 3.07ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 16, tps: 6540.50, reads: 91563.07, writes: 0.00, response time: 3.05ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 16, tps: 6519.49, reads: 91297.34, writes: 0.00, response time: 3.08ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 16, tps: 6266.00, reads: 87698.55, writes: 0.00, response time: 3.24ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 16, tps: 6091.51, reads: 85286.09, writes: 0.00, response time: 3.41ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 16, tps: 6383.00, reads: 89359.98, writes: 0.00, response time: 3.17ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 16, tps: 6564.00, reads: 91908.47, writes: 0.00, response time: 3.04ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 16, tps: 6382.00, reads: 89329.98, writes: 0.00, response time: 3.17ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 16, tps: 6424.50, reads: 89952.04, writes: 0.00, response time: 3.17ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 16, tps: 6405.50, reads: 89674.98, writes: 0.00, response time: 3.07ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 16, tps: 6480.50, reads: 90725.46, writes: 0.00, response time: 3.05ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5413576
        write:                           0
        other:                           773368
        total:                           6186944
    transactions:                        386684 (6338.86 per sec.)
    read/write requests:                 5413576 (88744.10 per sec.)
    other operations:                    773368 (12677.73 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0021s
    total number of events:              386684
    total time taken by event execution: 975.4663s
    response time:
         min:                                  1.90ms
         avg:                                  2.52ms
         max:                                 53.33ms
         approx.  95 percentile:               3.22ms

Threads fairness:
    events (avg/stddev):           24167.7500/904.94
    execution time (avg/stddev):   60.9666/0.00

