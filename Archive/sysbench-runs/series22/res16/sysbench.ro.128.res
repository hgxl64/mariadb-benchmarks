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
        read:                            1956405
        write:                           0
        other:                           1956405
        total:                           3912810
    transactions:                        1956405 (32604.90 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1956405 (32604.90 per sec.)
    other operations:                    1956405 (32604.90 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1956405
    total time taken by event execution: 7675.7399
    per-request statistics:
         min:                                  1.26ms
         avg:                                  3.92ms
         max:                                 32.17ms
         approx.  95 percentile:               8.09ms

Threads fairness:
    events (avg/stddev):           15284.4141/63.12
    execution time (avg/stddev):   59.9667/0.00

