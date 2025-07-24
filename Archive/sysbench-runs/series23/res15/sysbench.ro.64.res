sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2111990
        write:                           0
        other:                           2111990
        total:                           4223980
    transactions:                        2111990 (35198.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2111990 (35198.89 per sec.)
    other operations:                    2111990 (35198.89 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              2111990
    total time taken by event execution: 3836.6101
    per-request statistics:
         min:                                  1.25ms
         avg:                                  1.82ms
         max:                                 15.77ms
         approx.  95 percentile:               2.13ms

Threads fairness:
    events (avg/stddev):           32999.8438/22.61
    execution time (avg/stddev):   59.9470/0.00

