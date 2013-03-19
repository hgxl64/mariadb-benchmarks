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
        read:                            1266575
        write:                           0
        other:                           1266575
        total:                           2533150
    transactions:                        1266575 (21109.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1266575 (21109.50 per sec.)
    other operations:                    1266575 (21109.50 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1266575
    total time taken by event execution: 238.1413
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.19ms
         max:                                  1.15ms
         approx.  95 percentile:               0.26ms

Threads fairness:
    events (avg/stddev):           316643.7500/75353.74
    execution time (avg/stddev):   59.5353/0.12

