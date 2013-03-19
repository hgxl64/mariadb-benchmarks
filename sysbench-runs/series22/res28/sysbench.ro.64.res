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
        read:                            1039077
        write:                           0
        other:                           1039077
        total:                           2078154
    transactions:                        1039077 (17317.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1039077 (17317.01 per sec.)
    other operations:                    1039077 (17317.01 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1039077
    total time taken by event execution: 3837.9526
    per-request statistics:
         min:                                  1.70ms
         avg:                                  3.69ms
         max:                                  9.20ms
         approx.  95 percentile:               4.01ms

Threads fairness:
    events (avg/stddev):           16235.5781/5.20
    execution time (avg/stddev):   59.9680/0.00

