sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            547802
        write:                           0
        other:                           547802
        total:                           1095604
    transactions:                        547802 (9129.99 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 547802 (9129.99 per sec.)
    other operations:                    547802 (9129.99 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              547802
    total time taken by event execution: 119.1434
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.22ms
         max:                                  0.64ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           273901.0000/42486.00
    execution time (avg/stddev):   59.5717/0.02

