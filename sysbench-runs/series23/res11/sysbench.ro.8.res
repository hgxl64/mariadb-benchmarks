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
        read:                            1485307
        write:                           0
        other:                           1485307
        total:                           2970614
    transactions:                        1485307 (24754.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1485307 (24754.89 per sec.)
    other operations:                    1485307 (24754.89 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1485307
    total time taken by event execution: 477.8060
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.32ms
         max:                                  5.40ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           185663.3750/9571.81
    execution time (avg/stddev):   59.7257/0.03

