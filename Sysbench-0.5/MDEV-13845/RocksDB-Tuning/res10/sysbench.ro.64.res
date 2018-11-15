sysbench 0.5:  multi-threaded system evaluation benchmark

Running the test with following options:
Number of threads: 64
Report intermediate results every 2 second(s)
Initializing random number generator from seed (42).


Threads started!

[   2s] threads: 64, tps: 5158.81, reads: 72589.29, writes: 0.00, response time: 26.96ms (95%), errors: 0.00, reconnects:  0.00
[   4s] threads: 64, tps: 5226.50, reads: 73159.07, writes: 0.00, response time: 26.16ms (95%), errors: 0.00, reconnects:  0.00
[   6s] threads: 64, tps: 5574.01, reads: 78041.60, writes: 0.00, response time: 23.88ms (95%), errors: 0.00, reconnects:  0.00
[   8s] threads: 64, tps: 5840.99, reads: 81755.87, writes: 0.00, response time: 22.21ms (95%), errors: 0.00, reconnects:  0.00
[  10s] threads: 64, tps: 5027.50, reads: 70379.02, writes: 0.00, response time: 29.13ms (95%), errors: 0.00, reconnects:  0.00
[  12s] threads: 64, tps: 6020.00, reads: 84290.00, writes: 0.00, response time: 20.36ms (95%), errors: 0.00, reconnects:  0.00
[  14s] threads: 64, tps: 5643.01, reads: 79019.60, writes: 0.00, response time: 22.33ms (95%), errors: 0.00, reconnects:  0.00
[  16s] threads: 64, tps: 5519.00, reads: 77254.98, writes: 0.00, response time: 22.85ms (95%), errors: 0.00, reconnects:  0.00
[  18s] threads: 64, tps: 5489.00, reads: 76840.54, writes: 0.00, response time: 23.07ms (95%), errors: 0.00, reconnects:  0.00
[  20s] threads: 64, tps: 5401.00, reads: 75713.44, writes: 0.00, response time: 24.32ms (95%), errors: 0.00, reconnects:  0.00
[  22s] threads: 64, tps: 5428.95, reads: 76007.29, writes: 0.00, response time: 23.54ms (95%), errors: 0.00, reconnects:  0.00
[  24s] threads: 64, tps: 5356.55, reads: 74877.70, writes: 0.00, response time: 24.44ms (95%), errors: 0.00, reconnects:  0.00
[  26s] threads: 64, tps: 5367.49, reads: 75156.90, writes: 0.00, response time: 24.51ms (95%), errors: 0.00, reconnects:  0.00
[  28s] threads: 64, tps: 5165.50, reads: 72302.44, writes: 0.00, response time: 25.92ms (95%), errors: 0.00, reconnects:  0.00
[  30s] threads: 64, tps: 5819.52, reads: 81502.22, writes: 0.00, response time: 22.37ms (95%), errors: 0.00, reconnects:  0.00
[  32s] threads: 64, tps: 5308.00, reads: 74331.54, writes: 0.00, response time: 25.31ms (95%), errors: 0.00, reconnects:  0.00
[  34s] threads: 64, tps: 5732.49, reads: 80217.90, writes: 0.00, response time: 23.00ms (95%), errors: 0.00, reconnects:  0.00
[  36s] threads: 64, tps: 6504.51, reads: 91064.59, writes: 0.00, response time: 18.76ms (95%), errors: 0.00, reconnects:  0.00
[  38s] threads: 64, tps: 6517.49, reads: 91247.39, writes: 0.00, response time: 19.02ms (95%), errors: 0.00, reconnects:  0.00
[  40s] threads: 64, tps: 6393.01, reads: 89529.62, writes: 0.00, response time: 19.67ms (95%), errors: 0.00, reconnects:  0.00
[  42s] threads: 64, tps: 6325.00, reads: 88512.49, writes: 0.00, response time: 19.80ms (95%), errors: 0.00, reconnects:  0.00
[  44s] threads: 64, tps: 6452.50, reads: 90321.00, writes: 0.00, response time: 19.08ms (95%), errors: 0.00, reconnects:  0.00
[  46s] threads: 64, tps: 6364.99, reads: 89104.35, writes: 0.00, response time: 19.74ms (95%), errors: 0.00, reconnects:  0.00
[  48s] threads: 64, tps: 6290.01, reads: 88105.14, writes: 0.00, response time: 19.84ms (95%), errors: 0.00, reconnects:  0.00
[  50s] threads: 64, tps: 6357.50, reads: 88958.54, writes: 0.00, response time: 19.53ms (95%), errors: 0.00, reconnects:  0.00
[  52s] threads: 64, tps: 6414.50, reads: 89858.98, writes: 0.00, response time: 19.41ms (95%), errors: 0.00, reconnects:  0.00
[  54s] threads: 64, tps: 6392.99, reads: 89470.36, writes: 0.00, response time: 19.65ms (95%), errors: 0.00, reconnects:  0.00
[  56s] threads: 64, tps: 6414.51, reads: 89784.62, writes: 0.00, response time: 19.61ms (95%), errors: 0.00, reconnects:  0.00
[  58s] threads: 64, tps: 6397.99, reads: 89572.38, writes: 0.00, response time: 19.54ms (95%), errors: 0.00, reconnects:  0.00
[  60s] threads: 64, tps: 6365.00, reads: 89117.47, writes: 0.00, response time: 19.65ms (95%), errors: 0.00, reconnects:  0.00
OLTP test statistics:
    queries performed:
        read:                            5026140
        write:                           0
        other:                           718020
        total:                           5744160
    transactions:                        359010 (5884.84 per sec.)
    read/write requests:                 5026140 (82387.71 per sec.)
    other operations:                    718020 (11769.67 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

General statistics:
    total time:                          61.0059s
    total number of events:              359010
    total time taken by event execution: 3903.5675s
    response time:
         min:                                  2.16ms
         avg:                                 10.87ms
         max:                                105.59ms
         approx.  95 percentile:              21.60ms

Threads fairness:
    events (avg/stddev):           5609.5312/196.79
    execution time (avg/stddev):   60.9932/0.00

