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
        read:                            1967909
        write:                           0
        other:                           1967909
        total:                           3935818
    transactions:                        1967909 (32798.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1967909 (32798.35 per sec.)
    other operations:                    1967909 (32798.35 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1967909
    total time taken by event execution: 477.0642
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.24ms
         max:                                  1.57ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           245988.6250/14182.86
    execution time (avg/stddev):   59.6330/0.03

