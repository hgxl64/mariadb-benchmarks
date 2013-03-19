sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1828703
        write:                           0
        other:                           1828703
        total:                           3657406
    transactions:                        1828703 (30474.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1828703 (30474.31 per sec.)
    other operations:                    1828703 (30474.31 per sec.)

Test execution summary:
    total time:                          60.0080s
    total number of events:              1828703
    total time taken by event execution: 15352.0523
    per-request statistics:
         min:                                  1.39ms
         avg:                                  8.40ms
         max:                                 78.89ms
         approx.  95 percentile:              21.09ms

Threads fairness:
    events (avg/stddev):           7143.3711/52.08
    execution time (avg/stddev):   59.9690/0.00

