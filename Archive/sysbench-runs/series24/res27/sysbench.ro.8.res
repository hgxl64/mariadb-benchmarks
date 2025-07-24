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
        read:                            1680199
        write:                           0
        other:                           1680199
        total:                           3360398
    transactions:                        1680199 (28003.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1680199 (28003.13 per sec.)
    other operations:                    1680199 (28003.13 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1680199
    total time taken by event execution: 477.5414
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.28ms
         max:                                 11.65ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           210024.8750/4798.78
    execution time (avg/stddev):   59.6927/0.01

