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
        read:                            154996
        write:                           0
        other:                           154996
        total:                           309992
    transactions:                        154996 (2583.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 154996 (2583.24 per sec.)
    other operations:                    154996 (2583.24 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              154996
    total time taken by event execution: 59.8014
    per-request statistics:
         min:                                  0.23ms
         avg:                                  0.39ms
         max:                                  0.75ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           154996.0000/0.00
    execution time (avg/stddev):   59.8014/0.00

