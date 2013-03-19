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
        read:                            1058954
        write:                           0
        other:                           1058954
        total:                           2117908
    transactions:                        1058954 (17647.60 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1058954 (17647.60 per sec.)
    other operations:                    1058954 (17647.60 per sec.)

Test execution summary:
    total time:                          60.0055s
    total number of events:              1058954
    total time taken by event execution: 7677.0041
    per-request statistics:
         min:                                  3.49ms
         avg:                                  7.25ms
         max:                                 17.17ms
         approx.  95 percentile:               7.65ms

Threads fairness:
    events (avg/stddev):           8273.0781/2.50
    execution time (avg/stddev):   59.9766/0.00

