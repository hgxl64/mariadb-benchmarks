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
        read:                            1054489
        write:                           0
        other:                           1054489
        total:                           2108978
    transactions:                        1054489 (17574.74 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1054489 (17574.74 per sec.)
    other operations:                    1054489 (17574.74 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1054489
    total time taken by event execution: 238.4290
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.23ms
         max:                                  0.96ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           263622.2500/6885.03
    execution time (avg/stddev):   59.6072/0.03

