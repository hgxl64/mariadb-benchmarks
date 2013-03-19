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
        read:                            1399870
        write:                           0
        other:                           1399870
        total:                           2799740
    transactions:                        1399870 (23331.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1399870 (23331.01 per sec.)
    other operations:                    1399870 (23331.01 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1399870
    total time taken by event execution: 477.8227
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.34ms
         max:                                  1.75ms
         approx.  95 percentile:               0.49ms

Threads fairness:
    events (avg/stddev):           174983.7500/6522.27
    execution time (avg/stddev):   59.7278/0.01

