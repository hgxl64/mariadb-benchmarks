sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1395709
        write:                           0
        other:                           1395709
        total:                           2791418
    transactions:                        1395709 (23260.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1395709 (23260.64 per sec.)
    other operations:                    1395709 (23260.64 per sec.)

Test execution summary:
    total time:                          60.0030s
    total number of events:              1395709
    total time taken by event execution: 7676.4460
    per-request statistics:
         min:                                  1.55ms
         avg:                                  5.50ms
         max:                                 34.13ms
         approx.  95 percentile:              10.50ms

Threads fairness:
    events (avg/stddev):           10903.9766/52.56
    execution time (avg/stddev):   59.9722/0.00

