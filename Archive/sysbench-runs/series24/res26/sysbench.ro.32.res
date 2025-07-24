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
        read:                            2040360
        write:                           0
        other:                           2040360
        total:                           4080720
    transactions:                        2040360 (34005.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2040360 (34005.52 per sec.)
    other operations:                    2040360 (34005.52 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              2040360
    total time taken by event execution: 1916.8713
    per-request statistics:
         min:                                  0.39ms
         avg:                                  0.94ms
         max:                                  9.19ms
         approx.  95 percentile:               1.12ms

Threads fairness:
    events (avg/stddev):           63761.2500/67.40
    execution time (avg/stddev):   59.9022/0.00

