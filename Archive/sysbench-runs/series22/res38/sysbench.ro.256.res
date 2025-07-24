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
        read:                            1034194
        write:                           0
        other:                           1034194
        total:                           2068388
    transactions:                        1034194 (17233.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1034194 (17233.09 per sec.)
    other operations:                    1034194 (17233.09 per sec.)

Test execution summary:
    total time:                          60.0121s
    total number of events:              1034194
    total time taken by event execution: 15353.8263
    per-request statistics:
         min:                                  2.79ms
         avg:                                 14.85ms
         max:                                 84.63ms
         approx.  95 percentile:              22.77ms

Threads fairness:
    events (avg/stddev):           4039.8203/25.99
    execution time (avg/stddev):   59.9759/0.00

