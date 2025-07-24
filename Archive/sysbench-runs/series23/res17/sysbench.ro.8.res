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
        read:                            1476138
        write:                           0
        other:                           1476138
        total:                           2952276
    transactions:                        1476138 (24602.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1476138 (24602.12 per sec.)
    other operations:                    1476138 (24602.12 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1476138
    total time taken by event execution: 477.5634
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.32ms
         max:                                  5.53ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           184517.2500/3180.60
    execution time (avg/stddev):   59.6954/0.02

