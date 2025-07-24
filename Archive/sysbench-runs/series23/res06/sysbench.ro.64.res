sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1767670
        write:                           0
        other:                           1767670
        total:                           3535340
    transactions:                        1767670 (29460.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1767670 (29460.32 per sec.)
    other operations:                    1767670 (29460.32 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1767670
    total time taken by event execution: 3836.8775
    per-request statistics:
         min:                                  1.47ms
         avg:                                  2.17ms
         max:                                  6.18ms
         approx.  95 percentile:               2.57ms

Threads fairness:
    events (avg/stddev):           27619.8438/36.27
    execution time (avg/stddev):   59.9512/0.00

