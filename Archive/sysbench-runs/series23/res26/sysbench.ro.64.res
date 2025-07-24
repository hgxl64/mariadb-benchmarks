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
        read:                            1681236
        write:                           0
        other:                           1681236
        total:                           3362472
    transactions:                        1681236 (28019.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1681236 (28019.89 per sec.)
    other operations:                    1681236 (28019.89 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1681236
    total time taken by event execution: 3837.2123
    per-request statistics:
         min:                                  1.35ms
         avg:                                  2.28ms
         max:                                  7.45ms
         approx.  95 percentile:               2.70ms

Threads fairness:
    events (avg/stddev):           26269.3125/18.54
    execution time (avg/stddev):   59.9564/0.00

