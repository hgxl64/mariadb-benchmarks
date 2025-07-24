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
        read:                            692055
        write:                           0
        other:                           692055
        total:                           1384110
    transactions:                        692055 (11534.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 692055 (11534.19 per sec.)
    other operations:                    692055 (11534.19 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              692055
    total time taken by event execution: 238.7383
    per-request statistics:
         min:                                  0.21ms
         avg:                                  0.34ms
         max:                                  5.60ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           173013.7500/620.10
    execution time (avg/stddev):   59.6846/0.01

