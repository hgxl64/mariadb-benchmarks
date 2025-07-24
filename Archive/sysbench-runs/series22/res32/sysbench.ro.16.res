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
        read:                            1689582
        write:                           0
        other:                           1689582
        total:                           3379164
    transactions:                        1689582 (28159.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1689582 (28159.35 per sec.)
    other operations:                    1689582 (28159.35 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1689582
    total time taken by event execution: 957.3969
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.57ms
         max:                                  2.20ms
         approx.  95 percentile:               0.74ms

Threads fairness:
    events (avg/stddev):           105598.8750/2466.41
    execution time (avg/stddev):   59.8373/0.01

