sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2146458
        write:                           0
        other:                           2146458
        total:                           4292916
    transactions:                        2146458 (35774.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2146458 (35774.15 per sec.)
    other operations:                    2146458 (35774.15 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              2146458
    total time taken by event execution: 476.4967
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                  1.43ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           268307.2500/21361.96
    execution time (avg/stddev):   59.5621/0.05

