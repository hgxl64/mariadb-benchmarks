sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1847536
        write:                           0
        other:                           1847536
        total:                           3695072
    transactions:                        1847536 (30787.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1847536 (30787.70 per sec.)
    other operations:                    1847536 (30787.70 per sec.)

Test execution summary:
    total time:                          60.0089s
    total number of events:              1847536
    total time taken by event execution: 15352.0136
    per-request statistics:
         min:                                  1.31ms
         avg:                                  8.31ms
         max:                                110.99ms
         approx.  95 percentile:              20.89ms

Threads fairness:
    events (avg/stddev):           7216.9375/56.24
    execution time (avg/stddev):   59.9688/0.00

