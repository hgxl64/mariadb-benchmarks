sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            840747
        write:                           0
        other:                           840747
        total:                           1681494
    transactions:                        840747 (14012.37 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 840747 (14012.37 per sec.)
    other operations:                    840747 (14012.37 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              840747
    total time taken by event execution: 238.6255
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.28ms
         max:                                  6.66ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           210186.7500/18018.38
    execution time (avg/stddev):   59.6564/0.03

