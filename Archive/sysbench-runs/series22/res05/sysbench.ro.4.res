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
        read:                            1053337
        write:                           0
        other:                           1053337
        total:                           2106674
    transactions:                        1053337 (17555.55 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1053337 (17555.55 per sec.)
    other operations:                    1053337 (17555.55 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1053337
    total time taken by event execution: 238.7865
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.23ms
         max:                                  0.93ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           263334.2500/28417.76
    execution time (avg/stddev):   59.6966/0.05

