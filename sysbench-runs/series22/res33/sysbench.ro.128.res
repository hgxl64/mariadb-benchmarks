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
        read:                            1323486
        write:                           0
        other:                           1323486
        total:                           2646972
    transactions:                        1323486 (22056.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1323486 (22056.86 per sec.)
    other operations:                    1323486 (22056.86 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1323486
    total time taken by event execution: 7676.4352
    per-request statistics:
         min:                                  1.82ms
         avg:                                  5.80ms
         max:                                 40.45ms
         approx.  95 percentile:              10.04ms

Threads fairness:
    events (avg/stddev):           10339.7344/47.67
    execution time (avg/stddev):   59.9721/0.00

