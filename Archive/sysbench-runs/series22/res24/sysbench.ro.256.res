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
        read:                            1036087
        write:                           0
        other:                           1036087
        total:                           2072174
    transactions:                        1036087 (17264.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1036087 (17264.21 per sec.)
    other operations:                    1036087 (17264.21 per sec.)

Test execution summary:
    total time:                          60.0136s
    total number of events:              1036087
    total time taken by event execution: 15353.8058
    per-request statistics:
         min:                                  6.83ms
         avg:                                 14.82ms
         max:                                 75.60ms
         approx.  95 percentile:              22.53ms

Threads fairness:
    events (avg/stddev):           4047.2148/23.72
    execution time (avg/stddev):   59.9758/0.01

