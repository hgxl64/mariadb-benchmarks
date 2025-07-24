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
        read:                            1885555
        write:                           0
        other:                           1885555
        total:                           3771110
    transactions:                        1885555 (31425.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1885555 (31425.61 per sec.)
    other operations:                    1885555 (31425.61 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1885555
    total time taken by event execution: 956.9322
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.51ms
         max:                                 14.57ms
         approx.  95 percentile:               0.65ms

Threads fairness:
    events (avg/stddev):           117847.1875/2648.77
    execution time (avg/stddev):   59.8083/0.01

