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
        read:                            1914529
        write:                           0
        other:                           1914529
        total:                           3829058
    transactions:                        1914529 (31908.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1914529 (31908.50 per sec.)
    other operations:                    1914529 (31908.50 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1914529
    total time taken by event execution: 957.1833
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.50ms
         max:                                 14.41ms
         approx.  95 percentile:               0.64ms

Threads fairness:
    events (avg/stddev):           119658.0625/763.66
    execution time (avg/stddev):   59.8240/0.01

