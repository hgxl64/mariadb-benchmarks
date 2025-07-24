sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            444392
        write:                           0
        other:                           444392
        total:                           888784
    transactions:                        444392 (7406.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 444392 (7406.49 per sec.)
    other operations:                    444392 (7406.49 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              444392
    total time taken by event execution: 119.6504
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.27ms
         max:                                  0.85ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           222196.0000/112.00
    execution time (avg/stddev):   59.8252/0.00

