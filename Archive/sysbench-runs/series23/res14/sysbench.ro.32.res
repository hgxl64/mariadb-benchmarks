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
        read:                            1067640
        write:                           0
        other:                           1067640
        total:                           2135280
    transactions:                        1067640 (17793.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1067640 (17793.56 per sec.)
    other operations:                    1067640 (17793.56 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1067640
    total time taken by event execution: 1918.2210
    per-request statistics:
         min:                                  1.29ms
         avg:                                  1.80ms
         max:                                  4.71ms
         approx.  95 percentile:               2.03ms

Threads fairness:
    events (avg/stddev):           33363.7500/19.67
    execution time (avg/stddev):   59.9444/0.00

