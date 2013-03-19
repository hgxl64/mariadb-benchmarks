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
        read:                            400640
        write:                           0
        other:                           400640
        total:                           801280
    transactions:                        400640 (6677.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 400640 (6677.30 per sec.)
    other operations:                    400640 (6677.30 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              400640
    total time taken by event execution: 119.3183
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.30ms
         max:                                  0.96ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           200320.0000/257.00
    execution time (avg/stddev):   59.6592/0.01

