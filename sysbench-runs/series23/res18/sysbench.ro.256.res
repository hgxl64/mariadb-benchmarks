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
        read:                            1043753
        write:                           0
        other:                           1043753
        total:                           2087506
    transactions:                        1043753 (17392.18 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1043753 (17392.18 per sec.)
    other operations:                    1043753 (17392.18 per sec.)

Test execution summary:
    total time:                          60.0128s
    total number of events:              1043753
    total time taken by event execution: 15353.7352
    per-request statistics:
         min:                                  2.35ms
         avg:                                 14.71ms
         max:                                 71.06ms
         approx.  95 percentile:              22.25ms

Threads fairness:
    events (avg/stddev):           4077.1602/27.33
    execution time (avg/stddev):   59.9755/0.00

