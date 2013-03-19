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
        read:                            1054487
        write:                           0
        other:                           1054487
        total:                           2108974
    transactions:                        1054487 (17573.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1054487 (17573.85 per sec.)
    other operations:                    1054487 (17573.85 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1054487
    total time taken by event execution: 3838.0122
    per-request statistics:
         min:                                  1.99ms
         avg:                                  3.64ms
         max:                                  8.12ms
         approx.  95 percentile:               3.94ms

Threads fairness:
    events (avg/stddev):           16476.3594/6.48
    execution time (avg/stddev):   59.9689/0.00

