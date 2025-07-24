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
        read:                            1545340
        write:                           0
        other:                           1545340
        total:                           3090680
    transactions:                        1545340 (25755.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1545340 (25755.01 per sec.)
    other operations:                    1545340 (25755.01 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1545340
    total time taken by event execution: 3837.3937
    per-request statistics:
         min:                                  1.36ms
         avg:                                  2.48ms
         max:                                  6.01ms
         approx.  95 percentile:               2.93ms

Threads fairness:
    events (avg/stddev):           24145.9375/18.13
    execution time (avg/stddev):   59.9593/0.00

