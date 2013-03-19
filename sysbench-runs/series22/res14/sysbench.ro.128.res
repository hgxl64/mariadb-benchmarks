sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1052704
        write:                           0
        other:                           1052704
        total:                           2105408
    transactions:                        1052704 (17543.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1052704 (17543.22 per sec.)
    other operations:                    1052704 (17543.22 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1052704
    total time taken by event execution: 7677.0814
    per-request statistics:
         min:                                  4.11ms
         avg:                                  7.29ms
         max:                                 16.96ms
         approx.  95 percentile:               7.71ms

Threads fairness:
    events (avg/stddev):           8224.2500/2.58
    execution time (avg/stddev):   59.9772/0.00

