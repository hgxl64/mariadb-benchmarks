sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1041816
        write:                           0
        other:                           1041816
        total:                           2083632
    transactions:                        1041816 (17363.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1041816 (17363.04 per sec.)
    other operations:                    1041816 (17363.04 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1041816
    total time taken by event execution: 1918.2318
    per-request statistics:
         min:                                  1.25ms
         avg:                                  1.84ms
         max:                                  4.24ms
         approx.  95 percentile:               2.07ms

Threads fairness:
    events (avg/stddev):           32556.7500/21.24
    execution time (avg/stddev):   59.9447/0.00

