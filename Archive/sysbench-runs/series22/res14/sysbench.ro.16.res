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
        read:                            1048112
        write:                           0
        other:                           1048112
        total:                           2096224
    transactions:                        1048112 (17468.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048112 (17468.27 per sec.)
    other operations:                    1048112 (17468.27 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1048112
    total time taken by event execution: 958.2296
    per-request statistics:
         min:                                  0.55ms
         avg:                                  0.91ms
         max:                                  5.99ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65507.0000/614.82
    execution time (avg/stddev):   59.8894/0.00

