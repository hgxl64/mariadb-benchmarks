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
        read:                            1683551
        write:                           0
        other:                           1683551
        total:                           3367102
    transactions:                        1683551 (28059.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1683551 (28059.02 per sec.)
    other operations:                    1683551 (28059.02 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1683551
    total time taken by event execution: 477.7297
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                 11.59ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           210443.8750/10831.06
    execution time (avg/stddev):   59.7162/0.02

