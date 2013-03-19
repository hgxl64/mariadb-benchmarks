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
        read:                            1908818
        write:                           0
        other:                           1908818
        total:                           3817636
    transactions:                        1908818 (31813.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1908818 (31813.48 per sec.)
    other operations:                    1908818 (31813.48 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1908818
    total time taken by event execution: 476.9254
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.25ms
         max:                                 14.12ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           238602.2500/20703.62
    execution time (avg/stddev):   59.6157/0.05

