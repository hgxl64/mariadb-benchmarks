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
        read:                            2870490
        write:                           0
        other:                           2870490
        total:                           5740980
    transactions:                        2870490 (47841.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2870490 (47841.13 per sec.)
    other operations:                    2870490 (47841.13 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2870490
    total time taken by event execution: 955.2649
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.33ms
         max:                                  6.88ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           179405.6250/3402.37
    execution time (avg/stddev):   59.7041/0.01

