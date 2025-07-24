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
        read:                            1947125
        write:                           0
        other:                           1947125
        total:                           3894250
    transactions:                        1947125 (32451.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1947125 (32451.14 per sec.)
    other operations:                    1947125 (32451.14 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1947125
    total time taken by event execution: 3836.7093
    per-request statistics:
         min:                                  1.32ms
         avg:                                  1.97ms
         max:                                  7.02ms
         approx.  95 percentile:               2.35ms

Threads fairness:
    events (avg/stddev):           30423.8281/24.65
    execution time (avg/stddev):   59.9486/0.00

