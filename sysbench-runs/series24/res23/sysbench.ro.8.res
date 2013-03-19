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
        read:                            1347411
        write:                           0
        other:                           1347411
        total:                           2694822
    transactions:                        1347411 (22456.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1347411 (22456.69 per sec.)
    other operations:                    1347411 (22456.69 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1347411
    total time taken by event execution: 477.5821
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.35ms
         max:                                  1.65ms
         approx.  95 percentile:               0.50ms

Threads fairness:
    events (avg/stddev):           168426.3750/9590.86
    execution time (avg/stddev):   59.6978/0.01

