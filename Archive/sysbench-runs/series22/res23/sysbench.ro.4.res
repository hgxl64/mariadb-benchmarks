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
        read:                            902548
        write:                           0
        other:                           902548
        total:                           1805096
    transactions:                        902548 (15042.39 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 902548 (15042.39 per sec.)
    other operations:                    902548 (15042.39 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              902548
    total time taken by event execution: 238.4643
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                  1.14ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           225637.0000/6741.00
    execution time (avg/stddev):   59.6161/0.02

