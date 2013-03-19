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
        read:                            1711232
        write:                           0
        other:                           1711232
        total:                           3422464
    transactions:                        1711232 (28520.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1711232 (28520.02 per sec.)
    other operations:                    1711232 (28520.02 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1711232
    total time taken by event execution: 1917.3570
    per-request statistics:
         min:                                  0.62ms
         avg:                                  1.12ms
         max:                                  3.68ms
         approx.  95 percentile:               1.32ms

Threads fairness:
    events (avg/stddev):           53476.0000/43.86
    execution time (avg/stddev):   59.9174/0.00

