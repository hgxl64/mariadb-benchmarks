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
        read:                            1768220
        write:                           0
        other:                           1768220
        total:                           3536440
    transactions:                        1768220 (29469.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1768220 (29469.96 per sec.)
    other operations:                    1768220 (29469.96 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1768220
    total time taken by event execution: 1916.9225
    per-request statistics:
         min:                                  0.54ms
         avg:                                  1.08ms
         max:                                  5.87ms
         approx.  95 percentile:               1.29ms

Threads fairness:
    events (avg/stddev):           55256.8750/197.58
    execution time (avg/stddev):   59.9038/0.00

