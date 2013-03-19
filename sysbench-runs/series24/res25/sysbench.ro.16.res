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
        read:                            2575086
        write:                           0
        other:                           2575086
        total:                           5150172
    transactions:                        2575086 (42917.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2575086 (42917.74 per sec.)
    other operations:                    2575086 (42917.74 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2575086
    total time taken by event execution: 956.1861
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.37ms
         max:                                  9.46ms
         approx.  95 percentile:               0.50ms

Threads fairness:
    events (avg/stddev):           160942.8750/2070.68
    execution time (avg/stddev):   59.7616/0.01

