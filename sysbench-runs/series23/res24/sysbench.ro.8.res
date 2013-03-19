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
        read:                            1058883
        write:                           0
        other:                           1058883
        total:                           2117766
    transactions:                        1058883 (17647.87 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1058883 (17647.87 per sec.)
    other operations:                    1058883 (17647.87 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1058883
    total time taken by event execution: 478.2351
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.45ms
         max:                                  3.99ms
         approx.  95 percentile:               0.59ms

Threads fairness:
    events (avg/stddev):           132360.3750/3510.43
    execution time (avg/stddev):   59.7794/0.01

