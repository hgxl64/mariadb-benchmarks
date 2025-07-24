sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1633438
        write:                           0
        other:                           1633438
        total:                           3266876
    transactions:                        1633438 (27223.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1633438 (27223.82 per sec.)
    other operations:                    1633438 (27223.82 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1633438
    total time taken by event execution: 477.3644
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.29ms
         max:                                  1.42ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           204179.7500/8851.27
    execution time (avg/stddev):   59.6705/0.04

