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
        read:                            1734805
        write:                           0
        other:                           1734805
        total:                           3469610
    transactions:                        1734805 (28913.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1734805 (28913.14 per sec.)
    other operations:                    1734805 (28913.14 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1734805
    total time taken by event execution: 957.3748
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.55ms
         max:                                  2.81ms
         approx.  95 percentile:               0.70ms

Threads fairness:
    events (avg/stddev):           108425.3125/1375.55
    execution time (avg/stddev):   59.8359/0.01

