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
        read:                            160351
        write:                           0
        other:                           160351
        total:                           320702
    transactions:                        160351 (2672.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 160351 (2672.50 per sec.)
    other operations:                    160351 (2672.50 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              160351
    total time taken by event execution: 59.8746
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.37ms
         max:                                  0.85ms
         approx.  95 percentile:               0.48ms

Threads fairness:
    events (avg/stddev):           160351.0000/0.00
    execution time (avg/stddev):   59.8746/0.00

