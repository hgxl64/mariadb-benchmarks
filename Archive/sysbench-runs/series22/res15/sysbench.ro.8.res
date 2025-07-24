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
        read:                            1684673
        write:                           0
        other:                           1684673
        total:                           3369346
    transactions:                        1684673 (28077.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1684673 (28077.68 per sec.)
    other operations:                    1684673 (28077.68 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1684673
    total time taken by event execution: 477.8073
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.28ms
         max:                                  1.52ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           210584.1250/5434.52
    execution time (avg/stddev):   59.7259/0.03

