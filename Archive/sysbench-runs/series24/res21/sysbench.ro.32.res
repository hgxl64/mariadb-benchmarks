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
        read:                            1720410
        write:                           0
        other:                           1720410
        total:                           3440820
    transactions:                        1720410 (28673.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1720410 (28673.08 per sec.)
    other operations:                    1720410 (28673.08 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1720410
    total time taken by event execution: 1917.3284
    per-request statistics:
         min:                                  0.59ms
         avg:                                  1.11ms
         max:                                  3.34ms
         approx.  95 percentile:               1.32ms

Threads fairness:
    events (avg/stddev):           53762.8125/62.70
    execution time (avg/stddev):   59.9165/0.00

