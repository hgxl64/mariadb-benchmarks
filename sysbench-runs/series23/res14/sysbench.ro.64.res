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
        read:                            1071233
        write:                           0
        other:                           1071233
        total:                           2142466
    transactions:                        1071233 (17852.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1071233 (17852.96 per sec.)
    other operations:                    1071233 (17852.96 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1071233
    total time taken by event execution: 3837.9562
    per-request statistics:
         min:                                  1.83ms
         avg:                                  3.58ms
         max:                                  8.74ms
         approx.  95 percentile:               3.88ms

Threads fairness:
    events (avg/stddev):           16738.0156/5.32
    execution time (avg/stddev):   59.9681/0.00

