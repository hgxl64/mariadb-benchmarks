sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1271552
        write:                           0
        other:                           1271552
        total:                           2543104
    transactions:                        1271552 (21192.46 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1271552 (21192.46 per sec.)
    other operations:                    1271552 (21192.46 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1271552
    total time taken by event execution: 238.6841
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.19ms
         max:                                  0.95ms
         approx.  95 percentile:               0.26ms

Threads fairness:
    events (avg/stddev):           317888.0000/34182.89
    execution time (avg/stddev):   59.6710/0.06

