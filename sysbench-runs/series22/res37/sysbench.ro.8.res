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
        read:                            1621156
        write:                           0
        other:                           1621156
        total:                           3242312
    transactions:                        1621156 (27019.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1621156 (27019.08 per sec.)
    other operations:                    1621156 (27019.08 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1621156
    total time taken by event execution: 477.7173
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.29ms
         max:                                 14.72ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           202644.5000/8683.83
    execution time (avg/stddev):   59.7147/0.02

