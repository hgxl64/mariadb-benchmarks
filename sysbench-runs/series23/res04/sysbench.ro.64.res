sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1138342
        write:                           0
        other:                           1138342
        total:                           2276684
    transactions:                        1138342 (18971.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1138342 (18971.36 per sec.)
    other operations:                    1138342 (18971.36 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1138342
    total time taken by event execution: 3837.8555
    per-request statistics:
         min:                                  2.74ms
         avg:                                  3.37ms
         max:                                  8.46ms
         approx.  95 percentile:               3.70ms

Threads fairness:
    events (avg/stddev):           17786.5938/8.53
    execution time (avg/stddev):   59.9665/0.00

