sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            198200
        write:                           0
        other:                           198200
        total:                           396400
    transactions:                        198200 (3303.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 198200 (3303.31 per sec.)
    other operations:                    198200 (3303.31 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              198200
    total time taken by event execution: 59.8431
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.30ms
         max:                                  1.18ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           198200.0000/0.00
    execution time (avg/stddev):   59.8431/0.00

