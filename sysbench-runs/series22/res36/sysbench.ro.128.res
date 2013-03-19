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
        read:                            1947681
        write:                           0
        other:                           1947681
        total:                           3895362
    transactions:                        1947681 (32459.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1947681 (32459.54 per sec.)
    other operations:                    1947681 (32459.54 per sec.)

Test execution summary:
    total time:                          60.0033s
    total number of events:              1947681
    total time taken by event execution: 7675.7322
    per-request statistics:
         min:                                  1.29ms
         avg:                                  3.94ms
         max:                                 31.86ms
         approx.  95 percentile:               8.12ms

Threads fairness:
    events (avg/stddev):           15216.2578/70.09
    execution time (avg/stddev):   59.9667/0.00

