sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            313815
        write:                           0
        other:                           313815
        total:                           627630
    transactions:                        313815 (5230.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 313815 (5230.22 per sec.)
    other operations:                    313815 (5230.22 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              313815
    total time taken by event execution: 59.7902
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.19ms
         max:                                  8.99ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           313815.0000/0.00
    execution time (avg/stddev):   59.7902/0.00

