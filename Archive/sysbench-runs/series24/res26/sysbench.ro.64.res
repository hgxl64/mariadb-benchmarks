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
        read:                            1958346
        write:                           0
        other:                           1958346
        total:                           3916692
    transactions:                        1958346 (32638.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1958346 (32638.27 per sec.)
    other operations:                    1958346 (32638.27 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1958346
    total time taken by event execution: 3836.6825
    per-request statistics:
         min:                                  1.26ms
         avg:                                  1.96ms
         max:                                  7.61ms
         approx.  95 percentile:               2.35ms

Threads fairness:
    events (avg/stddev):           30599.1562/21.23
    execution time (avg/stddev):   59.9482/0.00

