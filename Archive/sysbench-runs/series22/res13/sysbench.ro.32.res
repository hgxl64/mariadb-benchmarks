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
        read:                            1351359
        write:                           0
        other:                           1351359
        total:                           2702718
    transactions:                        1351359 (22522.33 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1351359 (22522.33 per sec.)
    other operations:                    1351359 (22522.33 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1351359
    total time taken by event execution: 1917.7818
    per-request statistics:
         min:                                  0.76ms
         avg:                                  1.42ms
         max:                                  4.35ms
         approx.  95 percentile:               1.69ms

Threads fairness:
    events (avg/stddev):           42229.9688/55.04
    execution time (avg/stddev):   59.9307/0.00

