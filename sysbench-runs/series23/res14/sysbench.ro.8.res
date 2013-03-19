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
        read:                            1040097
        write:                           0
        other:                           1040097
        total:                           2080194
    transactions:                        1040097 (17334.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1040097 (17334.83 per sec.)
    other operations:                    1040097 (17334.83 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1040097
    total time taken by event execution: 478.0605
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.46ms
         max:                                  1.70ms
         approx.  95 percentile:               0.59ms

Threads fairness:
    events (avg/stddev):           130012.1250/4566.16
    execution time (avg/stddev):   59.7576/0.01

