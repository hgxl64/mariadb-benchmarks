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
        read:                            1028942
        write:                           0
        other:                           1028942
        total:                           2057884
    transactions:                        1028942 (17148.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1028942 (17148.92 per sec.)
    other operations:                    1028942 (17148.92 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1028942
    total time taken by event execution: 238.3166
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.23ms
         max:                                  0.84ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           257235.5000/29149.95
    execution time (avg/stddev):   59.5792/0.05

