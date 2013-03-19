sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            479282
        write:                           0
        other:                           479282
        total:                           958564
    transactions:                        479282 (7987.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 479282 (7987.98 per sec.)
    other operations:                    479282 (7987.98 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              479282
    total time taken by event execution: 119.4057
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.25ms
         max:                                  1.34ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           239641.0000/1110.00
    execution time (avg/stddev):   59.7028/0.01

