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
        read:                            1596985
        write:                           0
        other:                           1596985
        total:                           3193970
    transactions:                        1596985 (26615.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1596985 (26615.91 per sec.)
    other operations:                    1596985 (26615.91 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1596985
    total time taken by event execution: 1917.5336
    per-request statistics:
         min:                                  0.73ms
         avg:                                  1.20ms
         max:                                  3.79ms
         approx.  95 percentile:               1.39ms

Threads fairness:
    events (avg/stddev):           49905.7812/28.16
    execution time (avg/stddev):   59.9229/0.00

