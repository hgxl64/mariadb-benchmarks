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
        read:                            2437751
        write:                           0
        other:                           2437751
        total:                           4875502
    transactions:                        2437751 (40628.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2437751 (40628.03 per sec.)
    other operations:                    2437751 (40628.03 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              2437751
    total time taken by event execution: 3836.0355
    per-request statistics:
         min:                                  0.99ms
         avg:                                  1.57ms
         max:                                  6.09ms
         approx.  95 percentile:               1.88ms

Threads fairness:
    events (avg/stddev):           38089.8594/37.91
    execution time (avg/stddev):   59.9381/0.00

