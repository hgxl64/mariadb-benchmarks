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
        read:                            1059845
        write:                           0
        other:                           1059845
        total:                           2119690
    transactions:                        1059845 (17663.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1059845 (17663.11 per sec.)
    other operations:                    1059845 (17663.11 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1059845
    total time taken by event execution: 3837.9812
    per-request statistics:
         min:                                  2.25ms
         avg:                                  3.62ms
         max:                                  7.99ms
         approx.  95 percentile:               3.91ms

Threads fairness:
    events (avg/stddev):           16560.0781/6.84
    execution time (avg/stddev):   59.9685/0.00

