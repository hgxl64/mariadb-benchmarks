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
        read:                            1591581
        write:                           0
        other:                           1591581
        total:                           3183162
    transactions:                        1591581 (26525.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1591581 (26525.93 per sec.)
    other operations:                    1591581 (26525.93 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1591581
    total time taken by event execution: 1917.3540
    per-request statistics:
         min:                                  0.59ms
         avg:                                  1.20ms
         max:                                  4.26ms
         approx.  95 percentile:               1.50ms

Threads fairness:
    events (avg/stddev):           49736.9062/120.98
    execution time (avg/stddev):   59.9173/0.00

