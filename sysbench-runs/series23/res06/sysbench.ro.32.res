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
        read:                            1840003
        write:                           0
        other:                           1840003
        total:                           3680006
    transactions:                        1840003 (30666.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1840003 (30666.36 per sec.)
    other operations:                    1840003 (30666.36 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1840003
    total time taken by event execution: 1916.9195
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.04ms
         max:                                  5.21ms
         approx.  95 percentile:               1.23ms

Threads fairness:
    events (avg/stddev):           57500.0938/296.55
    execution time (avg/stddev):   59.9037/0.00

