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
        read:                            173137
        write:                           0
        other:                           173137
        total:                           346274
    transactions:                        173137 (2885.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 173137 (2885.59 per sec.)
    other operations:                    173137 (2885.59 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              173137
    total time taken by event execution: 59.8678
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.35ms
         max:                                  0.64ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           173137.0000/0.00
    execution time (avg/stddev):   59.8678/0.00

