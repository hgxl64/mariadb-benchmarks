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
        read:                            1544542
        write:                           0
        other:                           1544542
        total:                           3089084
    transactions:                        1544542 (25739.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1544542 (25739.57 per sec.)
    other operations:                    1544542 (25739.57 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1544542
    total time taken by event execution: 15352.7155
    per-request statistics:
         min:                                  1.70ms
         avg:                                  9.94ms
         max:                                103.63ms
         approx.  95 percentile:              24.27ms

Threads fairness:
    events (avg/stddev):           6033.3672/46.17
    execution time (avg/stddev):   59.9715/0.00

