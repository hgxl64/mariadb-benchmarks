sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2203270
        write:                           0
        other:                           2203270
        total:                           4406540
    transactions:                        2203270 (36720.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2203270 (36720.72 per sec.)
    other operations:                    2203270 (36720.72 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              2203270
    total time taken by event execution: 1916.1962
    per-request statistics:
         min:                                  0.48ms
         avg:                                  0.87ms
         max:                                  3.60ms
         approx.  95 percentile:               1.04ms

Threads fairness:
    events (avg/stddev):           68852.1875/352.68
    execution time (avg/stddev):   59.8811/0.00

