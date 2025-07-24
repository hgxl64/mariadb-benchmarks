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
        read:                            2662676
        write:                           0
        other:                           2662676
        total:                           5325352
    transactions:                        2662676 (44377.28 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2662676 (44377.28 per sec.)
    other operations:                    2662676 (44377.28 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2662676
    total time taken by event execution: 1915.5513
    per-request statistics:
         min:                                  0.34ms
         avg:                                  0.72ms
         max:                                 10.87ms
         approx.  95 percentile:               0.88ms

Threads fairness:
    events (avg/stddev):           83208.6250/800.57
    execution time (avg/stddev):   59.8610/0.00

