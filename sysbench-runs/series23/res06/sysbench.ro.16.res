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
        read:                            1980493
        write:                           0
        other:                           1980493
        total:                           3960986
    transactions:                        1980493 (33008.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1980493 (33008.00 per sec.)
    other operations:                    1980493 (33008.00 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1980493
    total time taken by event execution: 956.6642
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.48ms
         max:                                  4.95ms
         approx.  95 percentile:               0.63ms

Threads fairness:
    events (avg/stddev):           123780.8125/3942.65
    execution time (avg/stddev):   59.7915/0.01

