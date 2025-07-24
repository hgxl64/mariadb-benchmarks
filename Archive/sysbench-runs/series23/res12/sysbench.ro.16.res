sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1299052
        write:                           0
        other:                           1299052
        total:                           2598104
    transactions:                        1299052 (21650.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1299052 (21650.64 per sec.)
    other operations:                    1299052 (21650.64 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1299052
    total time taken by event execution: 958.0069
    per-request statistics:
         min:                                  0.21ms
         avg:                                  0.74ms
         max:                                  2.52ms
         approx.  95 percentile:               0.96ms

Threads fairness:
    events (avg/stddev):           81190.7500/203.26
    execution time (avg/stddev):   59.8754/0.00

