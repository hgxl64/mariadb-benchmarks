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
        read:                            1107045
        write:                           0
        other:                           1107045
        total:                           2214090
    transactions:                        1107045 (18450.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1107045 (18450.62 per sec.)
    other operations:                    1107045 (18450.62 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1107045
    total time taken by event execution: 238.3558
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                  0.91ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           276761.2500/39358.12
    execution time (avg/stddev):   59.5890/0.08

