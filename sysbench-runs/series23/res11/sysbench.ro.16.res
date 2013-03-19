sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1603120
        write:                           0
        other:                           1603120
        total:                           3206240
    transactions:                        1603120 (26718.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1603120 (26718.32 per sec.)
    other operations:                    1603120 (26718.32 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1603120
    total time taken by event execution: 957.6555
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.60ms
         max:                                  2.26ms
         approx.  95 percentile:               0.74ms

Threads fairness:
    events (avg/stddev):           100195.0000/796.14
    execution time (avg/stddev):   59.8535/0.00

