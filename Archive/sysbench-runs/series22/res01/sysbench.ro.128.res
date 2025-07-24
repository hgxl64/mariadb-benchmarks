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
        read:                            1690254
        write:                           0
        other:                           1690254
        total:                           3380508
    transactions:                        1690254 (28169.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1690254 (28169.34 per sec.)
    other operations:                    1690254 (28169.34 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1690254
    total time taken by event execution: 7676.1350
    per-request statistics:
         min:                                  1.46ms
         avg:                                  4.54ms
         max:                                 38.49ms
         approx.  95 percentile:               9.23ms

Threads fairness:
    events (avg/stddev):           13205.1094/62.80
    execution time (avg/stddev):   59.9698/0.00

