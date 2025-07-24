sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1732421
        write:                           0
        other:                           1732421
        total:                           3464842
    transactions:                        1732421 (28873.23 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1732421 (28873.23 per sec.)
    other operations:                    1732421 (28873.23 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1732421
    total time taken by event execution: 1917.3254
    per-request statistics:
         min:                                  0.64ms
         avg:                                  1.11ms
         max:                                  4.16ms
         approx.  95 percentile:               1.31ms

Threads fairness:
    events (avg/stddev):           54138.1562/32.72
    execution time (avg/stddev):   59.9164/0.00

