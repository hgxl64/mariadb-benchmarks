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
        read:                            1779661
        write:                           0
        other:                           1779661
        total:                           3559322
    transactions:                        1779661 (29660.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1779661 (29660.76 per sec.)
    other operations:                    1779661 (29660.76 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1779661
    total time taken by event execution: 477.5109
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.27ms
         max:                                  1.31ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           222457.6250/12749.96
    execution time (avg/stddev):   59.6889/0.02

