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
        read:                            1031183
        write:                           0
        other:                           1031183
        total:                           2062366
    transactions:                        1031183 (17186.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1031183 (17186.31 per sec.)
    other operations:                    1031183 (17186.31 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1031183
    total time taken by event execution: 238.4163
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.23ms
         max:                                  1.17ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           257795.7500/12510.64
    execution time (avg/stddev):   59.6041/0.01

