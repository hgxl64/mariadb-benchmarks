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
        read:                            1077907
        write:                           0
        other:                           1077907
        total:                           2155814
    transactions:                        1077907 (17964.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1077907 (17964.15 per sec.)
    other operations:                    1077907 (17964.15 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1077907
    total time taken by event execution: 3837.9699
    per-request statistics:
         min:                                  2.87ms
         avg:                                  3.56ms
         max:                                  7.21ms
         approx.  95 percentile:               3.85ms

Threads fairness:
    events (avg/stddev):           16842.2969/7.12
    execution time (avg/stddev):   59.9683/0.00

