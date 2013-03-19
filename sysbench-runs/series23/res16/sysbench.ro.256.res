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
        read:                            1683864
        write:                           0
        other:                           1683864
        total:                           3367728
    transactions:                        1683864 (28061.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1683864 (28061.24 per sec.)
    other operations:                    1683864 (28061.24 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1683864
    total time taken by event execution: 15352.0725
    per-request statistics:
         min:                                  1.49ms
         avg:                                  9.12ms
         max:                                 92.45ms
         approx.  95 percentile:              22.79ms

Threads fairness:
    events (avg/stddev):           6577.5938/52.17
    execution time (avg/stddev):   59.9690/0.00

