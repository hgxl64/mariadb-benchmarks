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
        read:                            1379736
        write:                           0
        other:                           1379736
        total:                           2759472
    transactions:                        1379736 (22994.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1379736 (22994.30 per sec.)
    other operations:                    1379736 (22994.30 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1379736
    total time taken by event execution: 7676.5889
    per-request statistics:
         min:                                  1.62ms
         avg:                                  5.56ms
         max:                                 36.69ms
         approx.  95 percentile:              10.44ms

Threads fairness:
    events (avg/stddev):           10779.1875/40.58
    execution time (avg/stddev):   59.9734/0.00

