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
        read:                            1904376
        write:                           0
        other:                           1904376
        total:                           3808752
    transactions:                        1904376 (31739.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1904376 (31739.20 per sec.)
    other operations:                    1904376 (31739.20 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1904376
    total time taken by event execution: 1917.1097
    per-request statistics:
         min:                                  0.60ms
         avg:                                  1.01ms
         max:                                 17.77ms
         approx.  95 percentile:               1.20ms

Threads fairness:
    events (avg/stddev):           59511.7500/36.62
    execution time (avg/stddev):   59.9097/0.00

