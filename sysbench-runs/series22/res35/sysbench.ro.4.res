sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            870758
        write:                           0
        other:                           870758
        total:                           1741516
    transactions:                        870758 (14512.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 870758 (14512.57 per sec.)
    other operations:                    870758 (14512.57 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              870758
    total time taken by event execution: 238.8034
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  0.94ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           217689.5000/5262.14
    execution time (avg/stddev):   59.7009/0.01

