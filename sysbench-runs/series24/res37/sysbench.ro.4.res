sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            825643
        write:                           0
        other:                           825643
        total:                           1651286
    transactions:                        825643 (13760.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 825643 (13760.62 per sec.)
    other operations:                    825643 (13760.62 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              825643
    total time taken by event execution: 238.4432
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.29ms
         max:                                  9.28ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           206410.7500/10951.88
    execution time (avg/stddev):   59.6108/0.03

