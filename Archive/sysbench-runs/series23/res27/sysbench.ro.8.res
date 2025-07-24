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
        read:                            1556681
        write:                           0
        other:                           1556681
        total:                           3113362
    transactions:                        1556681 (25944.45 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1556681 (25944.45 per sec.)
    other operations:                    1556681 (25944.45 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1556681
    total time taken by event execution: 477.7762
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.31ms
         max:                                  1.60ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           194585.1250/8298.98
    execution time (avg/stddev):   59.7220/0.01

