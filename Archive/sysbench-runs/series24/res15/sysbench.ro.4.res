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
        read:                            951343
        write:                           0
        other:                           951343
        total:                           1902686
    transactions:                        951343 (15855.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 951343 (15855.63 per sec.)
    other operations:                    951343 (15855.63 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              951343
    total time taken by event execution: 238.9314
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.25ms
         max:                                 10.24ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           237835.7500/1853.96
    execution time (avg/stddev):   59.7329/0.01

