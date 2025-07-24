sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            439803
        write:                           0
        other:                           439803
        total:                           879606
    transactions:                        439803 (7330.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 439803 (7330.02 per sec.)
    other operations:                    439803 (7330.02 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              439803
    total time taken by event execution: 119.4415
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  0.85ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           219901.5000/258.50
    execution time (avg/stddev):   59.7208/0.00

