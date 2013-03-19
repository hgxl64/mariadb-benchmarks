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
        read:                            1825551
        write:                           0
        other:                           1825551
        total:                           3651102
    transactions:                        1825551 (30425.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1825551 (30425.51 per sec.)
    other operations:                    1825551 (30425.51 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1825551
    total time taken by event execution: 477.2679
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.26ms
         max:                                  7.07ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           228193.8750/8645.36
    execution time (avg/stddev):   59.6585/0.02

