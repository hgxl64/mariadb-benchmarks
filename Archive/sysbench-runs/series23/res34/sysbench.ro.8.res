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
        read:                            1154389
        write:                           0
        other:                           1154389
        total:                           2308778
    transactions:                        1154389 (19239.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1154389 (19239.63 per sec.)
    other operations:                    1154389 (19239.63 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1154389
    total time taken by event execution: 478.2321
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.41ms
         max:                                  6.69ms
         approx.  95 percentile:               0.53ms

Threads fairness:
    events (avg/stddev):           144298.6250/4648.47
    execution time (avg/stddev):   59.7790/0.01

