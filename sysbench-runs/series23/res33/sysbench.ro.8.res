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
        read:                            1132009
        write:                           0
        other:                           1132009
        total:                           2264018
    transactions:                        1132009 (18866.65 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1132009 (18866.65 per sec.)
    other operations:                    1132009 (18866.65 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1132009
    total time taken by event execution: 478.2750
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.42ms
         max:                                  4.14ms
         approx.  95 percentile:               0.59ms

Threads fairness:
    events (avg/stddev):           141501.1250/6784.53
    execution time (avg/stddev):   59.7844/0.02

