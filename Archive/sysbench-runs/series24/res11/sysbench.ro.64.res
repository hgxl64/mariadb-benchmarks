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
        read:                            1664320
        write:                           0
        other:                           1664320
        total:                           3328640
    transactions:                        1664320 (27737.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1664320 (27737.95 per sec.)
    other operations:                    1664320 (27737.95 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1664320
    total time taken by event execution: 3837.1381
    per-request statistics:
         min:                                  1.39ms
         avg:                                  2.31ms
         max:                                  6.34ms
         approx.  95 percentile:               2.77ms

Threads fairness:
    events (avg/stddev):           26005.0000/25.97
    execution time (avg/stddev):   59.9553/0.00

