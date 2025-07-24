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
        read:                            1878288
        write:                           0
        other:                           1878288
        total:                           3756576
    transactions:                        1878288 (31302.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1878288 (31302.50 per sec.)
    other operations:                    1878288 (31302.50 per sec.)

Test execution summary:
    total time:                          60.0044s
    total number of events:              1878288
    total time taken by event execution: 7675.9196
    per-request statistics:
         min:                                  1.35ms
         avg:                                  4.09ms
         max:                                 28.36ms
         approx.  95 percentile:               8.38ms

Threads fairness:
    events (avg/stddev):           14674.1250/71.39
    execution time (avg/stddev):   59.9681/0.00

