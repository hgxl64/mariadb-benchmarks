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
        read:                            217088
        write:                           0
        other:                           217088
        total:                           434176
    transactions:                        217088 (3618.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 217088 (3618.11 per sec.)
    other operations:                    217088 (3618.11 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              217088
    total time taken by event execution: 59.8539
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  0.85ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           217088.0000/0.00
    execution time (avg/stddev):   59.8539/0.00

