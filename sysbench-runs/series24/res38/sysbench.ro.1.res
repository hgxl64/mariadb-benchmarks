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
        read:                            163579
        write:                           0
        other:                           163579
        total:                           327158
    transactions:                        163579 (2726.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 163579 (2726.29 per sec.)
    other operations:                    163579 (2726.29 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              163579
    total time taken by event execution: 59.7957
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.37ms
         max:                                  0.80ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           163579.0000/0.00
    execution time (avg/stddev):   59.7957/0.00

