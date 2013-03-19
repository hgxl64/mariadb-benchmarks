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
        read:                            1983497
        write:                           0
        other:                           1983497
        total:                           3966994
    transactions:                        1983497 (33057.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1983497 (33057.72 per sec.)
    other operations:                    1983497 (33057.72 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1983497
    total time taken by event execution: 1916.5237
    per-request statistics:
         min:                                  0.51ms
         avg:                                  0.97ms
         max:                                  3.31ms
         approx.  95 percentile:               1.20ms

Threads fairness:
    events (avg/stddev):           61984.2812/396.44
    execution time (avg/stddev):   59.8914/0.00

