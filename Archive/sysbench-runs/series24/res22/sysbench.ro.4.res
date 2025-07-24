sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1051287
        write:                           0
        other:                           1051287
        total:                           2102574
    transactions:                        1051287 (17521.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1051287 (17521.32 per sec.)
    other operations:                    1051287 (17521.32 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1051287
    total time taken by event execution: 238.7402
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.23ms
         max:                                  1.08ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           262821.7500/3385.13
    execution time (avg/stddev):   59.6851/0.01

