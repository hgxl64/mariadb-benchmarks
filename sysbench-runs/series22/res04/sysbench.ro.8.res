sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1319531
        write:                           0
        other:                           1319531
        total:                           2639062
    transactions:                        1319531 (21991.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1319531 (21991.97 per sec.)
    other operations:                    1319531 (21991.97 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1319531
    total time taken by event execution: 477.3932
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.36ms
         max:                                  1.55ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           164941.3750/8252.78
    execution time (avg/stddev):   59.6742/0.02

