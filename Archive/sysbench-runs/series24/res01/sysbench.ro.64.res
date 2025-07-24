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
        read:                            1722379
        write:                           0
        other:                           1722379
        total:                           3444758
    transactions:                        1722379 (28705.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1722379 (28705.49 per sec.)
    other operations:                    1722379 (28705.49 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1722379
    total time taken by event execution: 3836.9657
    per-request statistics:
         min:                                  1.47ms
         avg:                                  2.23ms
         max:                                  6.29ms
         approx.  95 percentile:               2.67ms

Threads fairness:
    events (avg/stddev):           26912.1719/25.54
    execution time (avg/stddev):   59.9526/0.00

