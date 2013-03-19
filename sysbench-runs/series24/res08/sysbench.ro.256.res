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
        read:                            1036282
        write:                           0
        other:                           1036282
        total:                           2072564
    transactions:                        1036282 (17267.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1036282 (17267.59 per sec.)
    other operations:                    1036282 (17267.59 per sec.)

Test execution summary:
    total time:                          60.0131s
    total number of events:              1036282
    total time taken by event execution: 15353.6865
    per-request statistics:
         min:                                  4.47ms
         avg:                                 14.82ms
         max:                                 86.24ms
         approx.  95 percentile:              22.45ms

Threads fairness:
    events (avg/stddev):           4047.9766/26.29
    execution time (avg/stddev):   59.9753/0.01

