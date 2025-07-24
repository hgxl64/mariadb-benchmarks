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
        read:                            1050781
        write:                           0
        other:                           1050781
        total:                           2101562
    transactions:                        1050781 (17509.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1050781 (17509.44 per sec.)
    other operations:                    1050781 (17509.44 per sec.)

Test execution summary:
    total time:                          60.0123s
    total number of events:              1050781
    total time taken by event execution: 15353.6352
    per-request statistics:
         min:                                  6.17ms
         avg:                                 14.61ms
         max:                                 77.93ms
         approx.  95 percentile:              22.25ms

Threads fairness:
    events (avg/stddev):           4104.6133/25.82
    execution time (avg/stddev):   59.9751/0.00

