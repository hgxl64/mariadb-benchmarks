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
        read:                            1056929
        write:                           0
        other:                           1056929
        total:                           2113858
    transactions:                        1056929 (17613.53 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1056929 (17613.53 per sec.)
    other operations:                    1056929 (17613.53 per sec.)

Test execution summary:
    total time:                          60.0067s
    total number of events:              1056929
    total time taken by event execution: 7677.2387
    per-request statistics:
         min:                                  6.24ms
         avg:                                  7.26ms
         max:                                 19.87ms
         approx.  95 percentile:               7.67ms

Threads fairness:
    events (avg/stddev):           8257.2578/2.00
    execution time (avg/stddev):   59.9784/0.00

