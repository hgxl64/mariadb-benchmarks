sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            167540
        write:                           0
        other:                           167540
        total:                           335080
    transactions:                        167540 (2792.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 167540 (2792.32 per sec.)
    other operations:                    167540 (2792.32 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              167540
    total time taken by event execution: 59.8079
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.36ms
         max:                                  0.71ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           167540.0000/0.00
    execution time (avg/stddev):   59.8079/0.00

