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
        read:                            1691469
        write:                           0
        other:                           1691469
        total:                           3382938
    transactions:                        1691469 (28191.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1691469 (28191.02 per sec.)
    other operations:                    1691469 (28191.02 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1691469
    total time taken by event execution: 477.5184
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                 16.25ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           211433.6250/8245.72
    execution time (avg/stddev):   59.6898/0.01

