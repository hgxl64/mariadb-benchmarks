sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            178744
        write:                           0
        other:                           178744
        total:                           357488
    transactions:                        178744 (2979.06 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 178744 (2979.06 per sec.)
    other operations:                    178744 (2979.06 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              178744
    total time taken by event execution: 59.8358
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.33ms
         max:                                  1.52ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           178744.0000/0.00
    execution time (avg/stddev):   59.8358/0.00

