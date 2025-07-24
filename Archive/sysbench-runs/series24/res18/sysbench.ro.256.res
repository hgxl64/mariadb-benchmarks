sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1031339
        write:                           0
        other:                           1031339
        total:                           2062678
    transactions:                        1031339 (17185.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1031339 (17185.68 per sec.)
    other operations:                    1031339 (17185.68 per sec.)

Test execution summary:
    total time:                          60.0115s
    total number of events:              1031339
    total time taken by event execution: 15353.1048
    per-request statistics:
         min:                                  6.09ms
         avg:                                 14.89ms
         max:                                 84.93ms
         approx.  95 percentile:              22.56ms

Threads fairness:
    events (avg/stddev):           4028.6680/25.23
    execution time (avg/stddev):   59.9731/0.01

