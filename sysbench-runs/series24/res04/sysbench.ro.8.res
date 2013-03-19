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
        read:                            1345278
        write:                           0
        other:                           1345278
        total:                           2690556
    transactions:                        1345278 (22421.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1345278 (22421.07 per sec.)
    other operations:                    1345278 (22421.07 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1345278
    total time taken by event execution: 477.2936
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.35ms
         max:                                  3.62ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           168159.7500/1494.91
    execution time (avg/stddev):   59.6617/0.02

