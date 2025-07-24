sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1912596
        write:                           0
        other:                           1912596
        total:                           3825192
    transactions:                        1912596 (31876.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1912596 (31876.29 per sec.)
    other operations:                    1912596 (31876.29 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1912596
    total time taken by event execution: 957.1469
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.50ms
         max:                                 11.49ms
         approx.  95 percentile:               0.64ms

Threads fairness:
    events (avg/stddev):           119537.2500/728.62
    execution time (avg/stddev):   59.8217/0.01

