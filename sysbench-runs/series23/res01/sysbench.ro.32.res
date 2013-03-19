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
        read:                            1759160
        write:                           0
        other:                           1759160
        total:                           3518320
    transactions:                        1759160 (29318.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1759160 (29318.91 per sec.)
    other operations:                    1759160 (29318.91 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1759160
    total time taken by event execution: 1916.9743
    per-request statistics:
         min:                                  0.59ms
         avg:                                  1.09ms
         max:                                  3.39ms
         approx.  95 percentile:               1.34ms

Threads fairness:
    events (avg/stddev):           54973.7500/217.08
    execution time (avg/stddev):   59.9054/0.00

