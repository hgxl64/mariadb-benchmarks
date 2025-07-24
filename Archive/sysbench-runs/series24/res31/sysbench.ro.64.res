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
        read:                            1661740
        write:                           0
        other:                           1661740
        total:                           3323480
    transactions:                        1661740 (27694.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1661740 (27694.95 per sec.)
    other operations:                    1661740 (27694.95 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1661740
    total time taken by event execution: 3837.1731
    per-request statistics:
         min:                                  1.47ms
         avg:                                  2.31ms
         max:                                  4.93ms
         approx.  95 percentile:               2.77ms

Threads fairness:
    events (avg/stddev):           25964.6875/19.49
    execution time (avg/stddev):   59.9558/0.00

