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
        read:                            1066713
        write:                           0
        other:                           1066713
        total:                           2133426
    transactions:                        1066713 (17776.55 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1066713 (17776.55 per sec.)
    other operations:                    1066713 (17776.55 per sec.)

Test execution summary:
    total time:                          60.0067s
    total number of events:              1066713
    total time taken by event execution: 7677.1546
    per-request statistics:
         min:                                  1.40ms
         avg:                                  7.20ms
         max:                                 16.88ms
         approx.  95 percentile:               7.63ms

Threads fairness:
    events (avg/stddev):           8333.6953/2.31
    execution time (avg/stddev):   59.9778/0.00

