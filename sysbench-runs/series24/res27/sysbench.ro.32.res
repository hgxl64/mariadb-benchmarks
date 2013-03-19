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
        read:                            1910986
        write:                           0
        other:                           1910986
        total:                           3821972
    transactions:                        1910986 (31849.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1910986 (31849.21 per sec.)
    other operations:                    1910986 (31849.21 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1910986
    total time taken by event execution: 1917.0683
    per-request statistics:
         min:                                  0.58ms
         avg:                                  1.00ms
         max:                                  8.63ms
         approx.  95 percentile:               1.19ms

Threads fairness:
    events (avg/stddev):           59718.3125/53.28
    execution time (avg/stddev):   59.9084/0.00

