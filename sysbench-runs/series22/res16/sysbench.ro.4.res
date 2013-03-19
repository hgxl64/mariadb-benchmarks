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
        read:                            855575
        write:                           0
        other:                           855575
        total:                           1711150
    transactions:                        855575 (14259.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 855575 (14259.48 per sec.)
    other operations:                    855575 (14259.48 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              855575
    total time taken by event execution: 238.7065
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  1.41ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           213893.7500/426.23
    execution time (avg/stddev):   59.6766/0.02

