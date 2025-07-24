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
        read:                            1342151
        write:                           0
        other:                           1342151
        total:                           2684302
    transactions:                        1342151 (22367.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1342151 (22367.93 per sec.)
    other operations:                    1342151 (22367.93 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1342151
    total time taken by event execution: 7676.4382
    per-request statistics:
         min:                                  1.53ms
         avg:                                  5.72ms
         max:                                 35.98ms
         approx.  95 percentile:              10.62ms

Threads fairness:
    events (avg/stddev):           10485.5547/51.04
    execution time (avg/stddev):   59.9722/0.00

