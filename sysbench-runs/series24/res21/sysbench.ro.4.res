sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1135404
        write:                           0
        other:                           1135404
        total:                           2270808
    transactions:                        1135404 (18923.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1135404 (18923.30 per sec.)
    other operations:                    1135404 (18923.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1135404
    total time taken by event execution: 238.3484
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.21ms
         max:                                  1.56ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           283851.0000/19462.09
    execution time (avg/stddev):   59.5871/0.04

