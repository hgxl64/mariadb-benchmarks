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
        read:                            1365284
        write:                           0
        other:                           1365284
        total:                           2730568
    transactions:                        1365284 (22754.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1365284 (22754.31 per sec.)
    other operations:                    1365284 (22754.31 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1365284
    total time taken by event execution: 1917.7367
    per-request statistics:
         min:                                  0.81ms
         avg:                                  1.40ms
         max:                                  4.40ms
         approx.  95 percentile:               1.68ms

Threads fairness:
    events (avg/stddev):           42665.1250/37.90
    execution time (avg/stddev):   59.9293/0.00

