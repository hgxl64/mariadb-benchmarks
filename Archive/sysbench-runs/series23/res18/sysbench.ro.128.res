sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1046962
        write:                           0
        other:                           1046962
        total:                           2093924
    transactions:                        1046962 (17447.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1046962 (17447.57 per sec.)
    other operations:                    1046962 (17447.57 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1046962
    total time taken by event execution: 7677.1229
    per-request statistics:
         min:                                  4.96ms
         avg:                                  7.33ms
         max:                                 19.21ms
         approx.  95 percentile:               7.73ms

Threads fairness:
    events (avg/stddev):           8179.3906/2.63
    execution time (avg/stddev):   59.9775/0.00

