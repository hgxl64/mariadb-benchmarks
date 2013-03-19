sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2050432
        write:                           0
        other:                           2050432
        total:                           4100864
    transactions:                        2050432 (34173.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2050432 (34173.57 per sec.)
    other operations:                    2050432 (34173.57 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2050432
    total time taken by event execution: 957.0241
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.47ms
         max:                                 13.04ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           128152.0000/885.21
    execution time (avg/stddev):   59.8140/0.01

