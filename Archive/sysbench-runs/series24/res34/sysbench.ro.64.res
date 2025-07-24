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
        read:                            1043722
        write:                           0
        other:                           1043722
        total:                           2087444
    transactions:                        1043722 (17394.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1043722 (17394.21 per sec.)
    other operations:                    1043722 (17394.21 per sec.)

Test execution summary:
    total time:                          60.0040s
    total number of events:              1043722
    total time taken by event execution: 3838.0008
    per-request statistics:
         min:                                  2.99ms
         avg:                                  3.68ms
         max:                                  7.77ms
         approx.  95 percentile:               3.98ms

Threads fairness:
    events (avg/stddev):           16308.1562/6.85
    execution time (avg/stddev):   59.9688/0.00

