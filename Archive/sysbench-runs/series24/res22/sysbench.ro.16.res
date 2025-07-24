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
        read:                            1476184
        write:                           0
        other:                           1476184
        total:                           2952368
    transactions:                        1476184 (24602.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1476184 (24602.82 per sec.)
    other operations:                    1476184 (24602.82 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1476184
    total time taken by event execution: 957.7176
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.65ms
         max:                                  5.09ms
         approx.  95 percentile:               0.84ms

Threads fairness:
    events (avg/stddev):           92261.5000/1827.66
    execution time (avg/stddev):   59.8573/0.01

