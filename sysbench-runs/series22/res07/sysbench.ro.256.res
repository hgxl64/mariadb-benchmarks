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
        read:                            1852961
        write:                           0
        other:                           1852961
        total:                           3705922
    transactions:                        1852961 (30878.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1852961 (30878.10 per sec.)
    other operations:                    1852961 (30878.10 per sec.)

Test execution summary:
    total time:                          60.0089s
    total number of events:              1852961
    total time taken by event execution: 15351.9360
    per-request statistics:
         min:                                  1.34ms
         avg:                                  8.29ms
         max:                                 79.96ms
         approx.  95 percentile:              20.79ms

Threads fairness:
    events (avg/stddev):           7238.1289/52.52
    execution time (avg/stddev):   59.9685/0.00

