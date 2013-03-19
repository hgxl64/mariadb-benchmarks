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
        read:                            762895
        write:                           0
        other:                           762895
        total:                           1525790
    transactions:                        762895 (12714.84 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 762895 (12714.84 per sec.)
    other operations:                    762895 (12714.84 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              762895
    total time taken by event execution: 238.7851
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  1.08ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           190723.7500/1881.22
    execution time (avg/stddev):   59.6963/0.01

