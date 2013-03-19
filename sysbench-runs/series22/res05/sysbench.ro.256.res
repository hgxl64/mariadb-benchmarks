sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2407462
        write:                           0
        other:                           2407462
        total:                           4814924
    transactions:                        2407462 (40118.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2407462 (40118.51 per sec.)
    other operations:                    2407462 (40118.51 per sec.)

Test execution summary:
    total time:                          60.0088s
    total number of events:              2407462
    total time taken by event execution: 15350.9255
    per-request statistics:
         min:                                  1.09ms
         avg:                                  6.38ms
         max:                                 91.04ms
         approx.  95 percentile:              16.38ms

Threads fairness:
    events (avg/stddev):           9404.1484/69.21
    execution time (avg/stddev):   59.9646/0.00

