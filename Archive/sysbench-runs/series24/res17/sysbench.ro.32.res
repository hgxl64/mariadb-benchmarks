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
        read:                            1901511
        write:                           0
        other:                           1901511
        total:                           3803022
    transactions:                        1901511 (31691.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1901511 (31691.35 per sec.)
    other operations:                    1901511 (31691.35 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1901511
    total time taken by event execution: 1916.8958
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.01ms
         max:                                 11.12ms
         approx.  95 percentile:               1.20ms

Threads fairness:
    events (avg/stddev):           59422.2188/270.07
    execution time (avg/stddev):   59.9030/0.00

