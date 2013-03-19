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
        read:                            2570104
        write:                           0
        other:                           2570104
        total:                           5140208
    transactions:                        2570104 (42834.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2570104 (42834.38 per sec.)
    other operations:                    2570104 (42834.38 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              2570104
    total time taken by event execution: 1915.9892
    per-request statistics:
         min:                                  0.38ms
         avg:                                  0.75ms
         max:                                  5.92ms
         approx.  95 percentile:               0.92ms

Threads fairness:
    events (avg/stddev):           80315.7500/300.46
    execution time (avg/stddev):   59.8747/0.00

