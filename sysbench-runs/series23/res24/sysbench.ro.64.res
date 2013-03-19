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
        read:                            1076720
        write:                           0
        other:                           1076720
        total:                           2153440
    transactions:                        1076720 (17944.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1076720 (17944.38 per sec.)
    other operations:                    1076720 (17944.38 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1076720
    total time taken by event execution: 3837.9764
    per-request statistics:
         min:                                  2.86ms
         avg:                                  3.56ms
         max:                                  9.49ms
         approx.  95 percentile:               3.86ms

Threads fairness:
    events (avg/stddev):           16823.7500/8.35
    execution time (avg/stddev):   59.9684/0.00

