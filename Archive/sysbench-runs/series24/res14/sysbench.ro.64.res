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
        read:                            1061577
        write:                           0
        other:                           1061577
        total:                           2123154
    transactions:                        1061577 (17691.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1061577 (17691.92 per sec.)
    other operations:                    1061577 (17691.92 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              1061577
    total time taken by event execution: 3837.9713
    per-request statistics:
         min:                                  2.26ms
         avg:                                  3.62ms
         max:                                  9.72ms
         approx.  95 percentile:               3.91ms

Threads fairness:
    events (avg/stddev):           16587.1406/7.04
    execution time (avg/stddev):   59.9683/0.00

