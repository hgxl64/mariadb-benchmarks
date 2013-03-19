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
        read:                            893542
        write:                           0
        other:                           893542
        total:                           1787084
    transactions:                        893542 (14892.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 893542 (14892.30 per sec.)
    other operations:                    893542 (14892.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              893542
    total time taken by event execution: 238.6518
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.27ms
         max:                                  9.62ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           223385.5000/31600.09
    execution time (avg/stddev):   59.6629/0.04

