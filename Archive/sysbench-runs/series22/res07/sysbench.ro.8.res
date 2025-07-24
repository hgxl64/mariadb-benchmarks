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
        read:                            1692833
        write:                           0
        other:                           1692833
        total:                           3385666
    transactions:                        1692833 (28213.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1692833 (28213.69 per sec.)
    other operations:                    1692833 (28213.69 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1692833
    total time taken by event execution: 476.9396
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                  3.59ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           211604.1250/5428.61
    execution time (avg/stddev):   59.6174/0.02

