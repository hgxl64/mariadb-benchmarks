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
        read:                            483538
        write:                           0
        other:                           483538
        total:                           967076
    transactions:                        483538 (8058.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 483538 (8058.91 per sec.)
    other operations:                    483538 (8058.91 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              483538
    total time taken by event execution: 119.4028
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.25ms
         max:                                  0.80ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           241769.0000/27832.00
    execution time (avg/stddev):   59.7014/0.05

