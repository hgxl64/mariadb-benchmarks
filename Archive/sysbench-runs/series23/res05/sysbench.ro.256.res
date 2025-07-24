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
        read:                            2098358
        write:                           0
        other:                           2098358
        total:                           4196716
    transactions:                        2098358 (34967.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2098358 (34967.52 per sec.)
    other operations:                    2098358 (34967.52 per sec.)

Test execution summary:
    total time:                          60.0088s
    total number of events:              2098358
    total time taken by event execution: 15351.7845
    per-request statistics:
         min:                                  1.27ms
         avg:                                  7.32ms
         max:                                 91.68ms
         approx.  95 percentile:              18.50ms

Threads fairness:
    events (avg/stddev):           8196.7109/60.43
    execution time (avg/stddev):   59.9679/0.00

