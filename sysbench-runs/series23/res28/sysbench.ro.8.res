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
        read:                            1034378
        write:                           0
        other:                           1034378
        total:                           2068756
    transactions:                        1034378 (17239.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1034378 (17239.49 per sec.)
    other operations:                    1034378 (17239.49 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1034378
    total time taken by event execution: 478.2410
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.46ms
         max:                                  1.59ms
         approx.  95 percentile:               0.60ms

Threads fairness:
    events (avg/stddev):           129297.2500/3282.58
    execution time (avg/stddev):   59.7801/0.02

