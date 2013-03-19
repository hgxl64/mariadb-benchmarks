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
        read:                            1041058
        write:                           0
        other:                           1041058
        total:                           2082116
    transactions:                        1041058 (17350.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1041058 (17350.57 per sec.)
    other operations:                    1041058 (17350.57 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1041058
    total time taken by event execution: 958.1240
    per-request statistics:
         min:                                  0.34ms
         avg:                                  0.92ms
         max:                                 11.12ms
         approx.  95 percentile:               1.09ms

Threads fairness:
    events (avg/stddev):           65066.1250/770.20
    execution time (avg/stddev):   59.8827/0.00

