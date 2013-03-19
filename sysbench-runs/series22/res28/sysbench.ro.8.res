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
        read:                            1033335
        write:                           0
        other:                           1033335
        total:                           2066670
    transactions:                        1033335 (17222.06 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1033335 (17222.06 per sec.)
    other operations:                    1033335 (17222.06 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1033335
    total time taken by event execution: 478.0431
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.46ms
         max:                                  5.81ms
         approx.  95 percentile:               0.60ms

Threads fairness:
    events (avg/stddev):           129166.8750/5952.36
    execution time (avg/stddev):   59.7554/0.02

