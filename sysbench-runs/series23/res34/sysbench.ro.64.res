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
        read:                            1072277
        write:                           0
        other:                           1072277
        total:                           2144554
    transactions:                        1072277 (17870.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1072277 (17870.29 per sec.)
    other operations:                    1072277 (17870.29 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1072277
    total time taken by event execution: 3837.9122
    per-request statistics:
         min:                                  2.94ms
         avg:                                  3.58ms
         max:                                  8.18ms
         approx.  95 percentile:               3.88ms

Threads fairness:
    events (avg/stddev):           16754.3281/5.90
    execution time (avg/stddev):   59.9674/0.00

