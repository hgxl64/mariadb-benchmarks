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
        read:                            1733366
        write:                           0
        other:                           1733366
        total:                           3466732
    transactions:                        1733366 (28889.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1733366 (28889.27 per sec.)
    other operations:                    1733366 (28889.27 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1733366
    total time taken by event execution: 477.5120
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.28ms
         max:                                 15.64ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           216670.7500/7548.10
    execution time (avg/stddev):   59.6890/0.02

