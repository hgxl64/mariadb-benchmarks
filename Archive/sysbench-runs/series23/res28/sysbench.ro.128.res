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
        read:                            1043673
        write:                           0
        other:                           1043673
        total:                           2087346
    transactions:                        1043673 (17392.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1043673 (17392.74 per sec.)
    other operations:                    1043673 (17392.74 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1043673
    total time taken by event execution: 7677.0043
    per-request statistics:
         min:                                  4.08ms
         avg:                                  7.36ms
         max:                                 17.12ms
         approx.  95 percentile:               7.76ms

Threads fairness:
    events (avg/stddev):           8153.6953/2.04
    execution time (avg/stddev):   59.9766/0.00

