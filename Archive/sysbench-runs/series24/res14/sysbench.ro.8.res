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
        read:                            1020819
        write:                           0
        other:                           1020819
        total:                           2041638
    transactions:                        1020819 (17013.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1020819 (17013.47 per sec.)
    other operations:                    1020819 (17013.47 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1020819
    total time taken by event execution: 478.1649
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.47ms
         max:                                  2.19ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           127602.3750/3117.65
    execution time (avg/stddev):   59.7706/0.01

