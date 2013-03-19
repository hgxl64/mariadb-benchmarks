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
        read:                            758750
        write:                           0
        other:                           758750
        total:                           1517500
    transactions:                        758750 (12645.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 758750 (12645.75 per sec.)
    other operations:                    758750 (12645.75 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              758750
    total time taken by event execution: 238.5848
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.31ms
         max:                                  1.06ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           189687.5000/560.30
    execution time (avg/stddev):   59.6462/0.01

