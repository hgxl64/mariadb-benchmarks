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
        read:                            1343475
        write:                           0
        other:                           1343475
        total:                           2686950
    transactions:                        1343475 (22391.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1343475 (22391.05 per sec.)
    other operations:                    1343475 (22391.05 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1343475
    total time taken by event execution: 957.8606
    per-request statistics:
         min:                                  0.22ms
         avg:                                  0.71ms
         max:                                  2.79ms
         approx.  95 percentile:               0.91ms

Threads fairness:
    events (avg/stddev):           83967.1875/1597.18
    execution time (avg/stddev):   59.8663/0.00

