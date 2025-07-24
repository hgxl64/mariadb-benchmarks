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
        read:                            1119334
        write:                           0
        other:                           1119334
        total:                           2238668
    transactions:                        1119334 (18655.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1119334 (18655.38 per sec.)
    other operations:                    1119334 (18655.38 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1119334
    total time taken by event execution: 478.2679
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.43ms
         max:                                  5.34ms
         approx.  95 percentile:               0.57ms

Threads fairness:
    events (avg/stddev):           139916.7500/4027.16
    execution time (avg/stddev):   59.7835/0.01

