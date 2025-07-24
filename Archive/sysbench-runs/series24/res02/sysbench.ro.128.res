sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1444106
        write:                           0
        other:                           1444106
        total:                           2888212
    transactions:                        1444106 (24067.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1444106 (24067.17 per sec.)
    other operations:                    1444106 (24067.17 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1444106
    total time taken by event execution: 7676.2131
    per-request statistics:
         min:                                  1.55ms
         avg:                                  5.32ms
         max:                                 39.70ms
         approx.  95 percentile:              10.31ms

Threads fairness:
    events (avg/stddev):           11282.0781/51.44
    execution time (avg/stddev):   59.9704/0.00

