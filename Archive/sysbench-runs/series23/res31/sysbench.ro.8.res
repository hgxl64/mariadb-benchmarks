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
        read:                            1693019
        write:                           0
        other:                           1693019
        total:                           3386038
    transactions:                        1693019 (28216.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1693019 (28216.79 per sec.)
    other operations:                    1693019 (28216.79 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1693019
    total time taken by event execution: 477.7955
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.28ms
         max:                                  5.37ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           211627.3750/2669.32
    execution time (avg/stddev):   59.7244/0.01

