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
        read:                            1658369
        write:                           0
        other:                           1658369
        total:                           3316738
    transactions:                        1658369 (27637.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1658369 (27637.89 per sec.)
    other operations:                    1658369 (27637.89 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1658369
    total time taken by event execution: 7676.1136
    per-request statistics:
         min:                                  1.50ms
         avg:                                  4.63ms
         max:                                 31.46ms
         approx.  95 percentile:               9.36ms

Threads fairness:
    events (avg/stddev):           12956.0078/55.86
    execution time (avg/stddev):   59.9696/0.00

