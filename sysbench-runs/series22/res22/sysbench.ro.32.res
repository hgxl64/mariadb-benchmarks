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
        read:                            1457480
        write:                           0
        other:                           1457480
        total:                           2914960
    transactions:                        1457480 (24290.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1457480 (24290.93 per sec.)
    other operations:                    1457480 (24290.93 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1457480
    total time taken by event execution: 1917.6876
    per-request statistics:
         min:                                  0.67ms
         avg:                                  1.32ms
         max:                                  4.37ms
         approx.  95 percentile:               1.57ms

Threads fairness:
    events (avg/stddev):           45546.2500/51.14
    execution time (avg/stddev):   59.9277/0.00

