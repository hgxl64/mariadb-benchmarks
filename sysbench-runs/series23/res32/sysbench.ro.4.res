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
        read:                            879276
        write:                           0
        other:                           879276
        total:                           1758552
    transactions:                        879276 (14654.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 879276 (14654.52 per sec.)
    other operations:                    879276 (14654.52 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              879276
    total time taken by event execution: 238.5130
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  1.03ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           219819.0000/2001.72
    execution time (avg/stddev):   59.6283/0.03

