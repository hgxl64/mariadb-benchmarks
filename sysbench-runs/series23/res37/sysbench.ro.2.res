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
        read:                            373640
        write:                           0
        other:                           373640
        total:                           747280
    transactions:                        373640 (6227.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 373640 (6227.30 per sec.)
    other operations:                    373640 (6227.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              373640
    total time taken by event execution: 119.3379
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.32ms
         max:                                  0.81ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           186820.0000/879.00
    execution time (avg/stddev):   59.6689/0.00

