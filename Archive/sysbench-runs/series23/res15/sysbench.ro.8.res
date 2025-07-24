sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1707101
        write:                           0
        other:                           1707101
        total:                           3414202
    transactions:                        1707101 (28451.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1707101 (28451.50 per sec.)
    other operations:                    1707101 (28451.50 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1707101
    total time taken by event execution: 477.7201
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  1.74ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           213387.6250/2997.07
    execution time (avg/stddev):   59.7150/0.01

