sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1301984
        write:                           0
        other:                           1301984
        total:                           2603968
    transactions:                        1301984 (21699.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1301984 (21699.30 per sec.)
    other operations:                    1301984 (21699.30 per sec.)

Test execution summary:
    total time:                          60.0012s
    total number of events:              1301984
    total time taken by event execution: 1917.9689
    per-request statistics:
         min:                                  0.83ms
         avg:                                  1.47ms
         max:                                  4.30ms
         approx.  95 percentile:               1.75ms

Threads fairness:
    events (avg/stddev):           40687.0000/17.98
    execution time (avg/stddev):   59.9365/0.00

