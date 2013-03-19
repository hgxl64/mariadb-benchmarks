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
        read:                            211847
        write:                           0
        other:                           211847
        total:                           423694
    transactions:                        211847 (3530.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 211847 (3530.76 per sec.)
    other operations:                    211847 (3530.76 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              211847
    total time taken by event execution: 59.8025
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  0.99ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           211847.0000/0.00
    execution time (avg/stddev):   59.8025/0.00

