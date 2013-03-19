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
        read:                            1538231
        write:                           0
        other:                           1538231
        total:                           3076462
    transactions:                        1538231 (25636.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1538231 (25636.86 per sec.)
    other operations:                    1538231 (25636.86 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1538231
    total time taken by event execution: 957.3986
    per-request statistics:
         min:                                  0.31ms
         avg:                                  0.62ms
         max:                                  7.28ms
         approx.  95 percentile:               0.74ms

Threads fairness:
    events (avg/stddev):           96139.4375/4674.03
    execution time (avg/stddev):   59.8374/0.01

