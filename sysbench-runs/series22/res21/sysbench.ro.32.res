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
        read:                            1736774
        write:                           0
        other:                           1736774
        total:                           3473548
    transactions:                        1736774 (28945.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1736774 (28945.83 per sec.)
    other operations:                    1736774 (28945.83 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1736774
    total time taken by event execution: 1917.3168
    per-request statistics:
         min:                                  0.59ms
         avg:                                  1.10ms
         max:                                  3.60ms
         approx.  95 percentile:               1.30ms

Threads fairness:
    events (avg/stddev):           54274.1875/66.01
    execution time (avg/stddev):   59.9162/0.00

