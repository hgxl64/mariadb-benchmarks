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
        read:                            2035783
        write:                           0
        other:                           2035783
        total:                           4071566
    transactions:                        2035783 (33929.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2035783 (33929.30 per sec.)
    other operations:                    2035783 (33929.30 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              2035783
    total time taken by event execution: 1916.9202
    per-request statistics:
         min:                                  0.53ms
         avg:                                  0.94ms
         max:                                  9.99ms
         approx.  95 percentile:               1.13ms

Threads fairness:
    events (avg/stddev):           63618.2188/53.02
    execution time (avg/stddev):   59.9038/0.00

