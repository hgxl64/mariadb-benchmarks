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
        read:                            888530
        write:                           0
        other:                           888530
        total:                           1777060
    transactions:                        888530 (14808.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 888530 (14808.73 per sec.)
    other operations:                    888530 (14808.73 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              888530
    total time taken by event execution: 238.6467
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  1.61ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           222132.5000/31727.79
    execution time (avg/stddev):   59.6617/0.04

