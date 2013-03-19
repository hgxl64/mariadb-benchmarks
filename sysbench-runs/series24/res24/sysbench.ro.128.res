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
        read:                            1062239
        write:                           0
        other:                           1062239
        total:                           2124478
    transactions:                        1062239 (17702.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1062239 (17702.15 per sec.)
    other operations:                    1062239 (17702.15 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1062239
    total time taken by event execution: 7676.8854
    per-request statistics:
         min:                                  3.34ms
         avg:                                  7.23ms
         max:                                 20.61ms
         approx.  95 percentile:               7.63ms

Threads fairness:
    events (avg/stddev):           8298.7422/2.32
    execution time (avg/stddev):   59.9757/0.00

