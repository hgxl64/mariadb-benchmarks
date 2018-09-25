sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 128
Report intermediate results every 2 second(s)
Random number generator seed is 0 and will be ignored


Threads started!

[   2s] threads: 128, tps: 1243.45, reads: 0.00, writes: 25528.88, response time: 110.32ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 128, tps: 1359.00, reads: 0.00, writes: 27122.58, response time: 101.57ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 128, tps: 1378.99, reads: 0.00, writes: 27607.27, response time: 99.44ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 128, tps: 1341.51, reads: 0.00, writes: 26774.15, response time: 103.07ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 128, tps: 1344.00, reads: 0.00, writes: 26762.07, response time: 102.12ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 128, tps: 1383.00, reads: 0.00, writes: 27808.00, response time: 99.62ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 128, tps: 1352.00, reads: 0.00, writes: 27102.50, response time: 99.71ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 128, tps: 1349.50, reads: 0.00, writes: 26921.00, response time: 102.15ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 128, tps: 1367.00, reads: 0.00, writes: 27247.47, response time: 100.48ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 128, tps: 1381.00, reads: 0.00, writes: 27722.02, response time: 98.87ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 128, tps: 1357.50, reads: 0.00, writes: 27179.99, response time: 100.64ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 128, tps: 1355.50, reads: 0.00, writes: 27068.51, response time: 101.48ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 128, tps: 1367.00, reads: 0.00, writes: 27299.53, response time: 102.15ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 128, tps: 1365.00, reads: 0.00, writes: 27382.50, response time: 101.00ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 128, tps: 1344.50, reads: 0.00, writes: 26880.01, response time: 103.60ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 128, tps: 1325.50, reads: 0.00, writes: 26517.47, response time: 106.62ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 128, tps: 1353.00, reads: 0.00, writes: 27093.51, response time: 104.53ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 128, tps: 1339.00, reads: 0.00, writes: 26737.45, response time: 102.92ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 128, tps: 1349.50, reads: 0.00, writes: 26975.04, response time: 102.43ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 128, tps: 1394.50, reads: 0.00, writes: 27930.97, response time: 97.35ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 128, tps: 1376.00, reads: 0.00, writes: 27449.02, response time: 99.23ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 128, tps: 1384.50, reads: 0.00, writes: 27696.45, response time: 101.09ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 128, tps: 1326.50, reads: 0.00, writes: 26665.08, response time: 101.97ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 128, tps: 1337.50, reads: 0.00, writes: 26640.43, response time: 102.86ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 128, tps: 1347.50, reads: 0.00, writes: 26901.49, response time: 99.59ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            0
        write:                           1382800
        other:                           138280
        total:                           1521080
    transactions:                        69140  (1354.15 per sec.)
    read/write requests:                 1382800 (27082.90 per sec.)
    other operations:                    138280 (2708.29 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          51.0580s
    total number of events:              69140
    total time taken by event execution: 6532.2234s
    response time:
         min:                                 56.51ms
         avg:                                 94.48ms
         max:                                137.60ms
         approx.  95 percentile:             102.00ms

Threads fairness:
    events (avg/stddev):           540.1562/0.65
    execution time (avg/stddev):   51.0330/0.02

