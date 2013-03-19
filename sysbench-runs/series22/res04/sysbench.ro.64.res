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
        read:                            1075205
        write:                           0
        other:                           1075205
        total:                           2150410
    transactions:                        1075205 (17919.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1075205 (17919.30 per sec.)
    other operations:                    1075205 (17919.30 per sec.)

Test execution summary:
    total time:                          60.0026s
    total number of events:              1075205
    total time taken by event execution: 3837.9311
    per-request statistics:
         min:                                  2.51ms
         avg:                                  3.57ms
         max:                                  6.90ms
         approx.  95 percentile:               3.83ms

Threads fairness:
    events (avg/stddev):           16800.0781/5.53
    execution time (avg/stddev):   59.9677/0.00

