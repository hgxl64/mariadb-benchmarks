sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1663110
        write:                           0
        other:                           1663110
        total:                           3326220
    transactions:                        1663110 (27717.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1663110 (27717.49 per sec.)
    other operations:                    1663110 (27717.49 per sec.)

Test execution summary:
    total time:                          60.0022s
    total number of events:              1663110
    total time taken by event execution: 3837.2066
    per-request statistics:
         min:                                  1.51ms
         avg:                                  2.31ms
         max:                                  5.86ms
         approx.  95 percentile:               2.76ms

Threads fairness:
    events (avg/stddev):           25986.0938/17.70
    execution time (avg/stddev):   59.9564/0.00

