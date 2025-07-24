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
        read:                            1523490
        write:                           0
        other:                           1523490
        total:                           3046980
    transactions:                        1523490 (25391.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1523490 (25391.15 per sec.)
    other operations:                    1523490 (25391.15 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1523490
    total time taken by event execution: 1917.3639
    per-request statistics:
         min:                                  0.57ms
         avg:                                  1.26ms
         max:                                  3.42ms
         approx.  95 percentile:               1.56ms

Threads fairness:
    events (avg/stddev):           47609.0625/103.11
    execution time (avg/stddev):   59.9176/0.00

