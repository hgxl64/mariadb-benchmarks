sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            641051
        write:                           0
        other:                           641051
        total:                           1282102
    transactions:                        641051 (10684.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 641051 (10684.14 per sec.)
    other operations:                    641051 (10684.14 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              641051
    total time taken by event execution: 118.9073
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.19ms
         max:                                  0.65ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           320525.5000/89045.50
    execution time (avg/stddev):   59.4537/0.15

