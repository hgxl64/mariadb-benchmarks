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
        read:                            1332919
        write:                           0
        other:                           1332919
        total:                           2665838
    transactions:                        1332919 (22214.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1332919 (22214.94 per sec.)
    other operations:                    1332919 (22214.94 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1332919
    total time taken by event execution: 1917.7479
    per-request statistics:
         min:                                  0.72ms
         avg:                                  1.44ms
         max:                                  3.30ms
         approx.  95 percentile:               1.75ms

Threads fairness:
    events (avg/stddev):           41653.7188/66.46
    execution time (avg/stddev):   59.9296/0.00

