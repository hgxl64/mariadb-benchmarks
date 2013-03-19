sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1761132
        write:                           0
        other:                           1761132
        total:                           3522264
    transactions:                        1761132 (29351.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1761132 (29351.93 per sec.)
    other operations:                    1761132 (29351.93 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1761132
    total time taken by event execution: 957.2916
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.54ms
         max:                                  2.99ms
         approx.  95 percentile:               0.69ms

Threads fairness:
    events (avg/stddev):           110070.7500/611.97
    execution time (avg/stddev):   59.8307/0.01

