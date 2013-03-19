sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1308030
        write:                           0
        other:                           1308030
        total:                           2616060
    transactions:                        1308030 (21800.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1308030 (21800.24 per sec.)
    other operations:                    1308030 (21800.24 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1308030
    total time taken by event execution: 957.9502
    per-request statistics:
         min:                                  0.23ms
         avg:                                  0.73ms
         max:                                  5.28ms
         approx.  95 percentile:               0.95ms

Threads fairness:
    events (avg/stddev):           81751.8750/369.68
    execution time (avg/stddev):   59.8719/0.00

