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
        read:                            1050268
        write:                           0
        other:                           1050268
        total:                           2100536
    transactions:                        1050268 (17503.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1050268 (17503.49 per sec.)
    other operations:                    1050268 (17503.49 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1050268
    total time taken by event execution: 3837.9789
    per-request statistics:
         min:                                  2.36ms
         avg:                                  3.65ms
         max:                                  8.32ms
         approx.  95 percentile:               3.95ms

Threads fairness:
    events (avg/stddev):           16410.4375/5.96
    execution time (avg/stddev):   59.9684/0.00

