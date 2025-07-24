sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1036497
        write:                           0
        other:                           1036497
        total:                           2072994
    transactions:                        1036497 (17271.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1036497 (17271.24 per sec.)
    other operations:                    1036497 (17271.24 per sec.)

Test execution summary:
    total time:                          60.0129s
    total number of events:              1036497
    total time taken by event execution: 15353.9955
    per-request statistics:
         min:                                  2.06ms
         avg:                                 14.81ms
         max:                                 77.36ms
         approx.  95 percentile:              22.54ms

Threads fairness:
    events (avg/stddev):           4048.8164/24.55
    execution time (avg/stddev):   59.9765/0.00

