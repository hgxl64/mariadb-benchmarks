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
        read:                            2040905
        write:                           0
        other:                           2040905
        total:                           4081810
    transactions:                        2040905 (34014.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2040905 (34014.61 per sec.)
    other operations:                    2040905 (34014.61 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              2040905
    total time taken by event execution: 1916.8761
    per-request statistics:
         min:                                  0.54ms
         avg:                                  0.94ms
         max:                                 16.38ms
         approx.  95 percentile:               1.13ms

Threads fairness:
    events (avg/stddev):           63778.2812/49.19
    execution time (avg/stddev):   59.9024/0.00

