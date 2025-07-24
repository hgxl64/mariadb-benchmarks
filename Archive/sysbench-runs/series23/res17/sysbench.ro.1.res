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
        read:                            163241
        write:                           0
        other:                           163241
        total:                           326482
    transactions:                        163241 (2720.67 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 163241 (2720.67 per sec.)
    other operations:                    163241 (2720.67 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              163241
    total time taken by event execution: 59.8536
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.37ms
         max:                                  0.77ms
         approx.  95 percentile:               0.48ms

Threads fairness:
    events (avg/stddev):           163241.0000/0.00
    execution time (avg/stddev):   59.8536/0.00

