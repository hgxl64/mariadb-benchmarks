sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1661064
        write:                           0
        other:                           1661064
        total:                           3322128
    transactions:                        1661064 (27684.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1661064 (27684.21 per sec.)
    other operations:                    1661064 (27684.21 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1661064
    total time taken by event execution: 957.1642
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.58ms
         max:                                  2.47ms
         approx.  95 percentile:               0.79ms

Threads fairness:
    events (avg/stddev):           103816.5000/2259.39
    execution time (avg/stddev):   59.8228/0.01

