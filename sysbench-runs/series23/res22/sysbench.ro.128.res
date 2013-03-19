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
        read:                            1316200
        write:                           0
        other:                           1316200
        total:                           2632400
    transactions:                        1316200 (21935.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1316200 (21935.47 per sec.)
    other operations:                    1316200 (21935.47 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1316200
    total time taken by event execution: 7676.6444
    per-request statistics:
         min:                                  1.75ms
         avg:                                  5.83ms
         max:                                 35.75ms
         approx.  95 percentile:              10.09ms

Threads fairness:
    events (avg/stddev):           10282.8125/46.71
    execution time (avg/stddev):   59.9738/0.00

