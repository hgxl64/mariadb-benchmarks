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
        read:                            1183233
        write:                           0
        other:                           1183233
        total:                           2366466
    transactions:                        1183233 (19720.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1183233 (19720.02 per sec.)
    other operations:                    1183233 (19720.02 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1183233
    total time taken by event execution: 1917.9581
    per-request statistics:
         min:                                  1.17ms
         avg:                                  1.62ms
         max:                                  3.81ms
         approx.  95 percentile:               1.79ms

Threads fairness:
    events (avg/stddev):           36976.0312/41.90
    execution time (avg/stddev):   59.9362/0.00

