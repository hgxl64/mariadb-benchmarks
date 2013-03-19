sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1006345
        write:                           0
        other:                           1006345
        total:                           2012690
    transactions:                        1006345 (16771.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1006345 (16771.86 per sec.)
    other operations:                    1006345 (16771.86 per sec.)

Test execution summary:
    total time:                          60.0020s
    total number of events:              1006345
    total time taken by event execution: 3837.9845
    per-request statistics:
         min:                                  1.94ms
         avg:                                  3.81ms
         max:                                  9.48ms
         approx.  95 percentile:               4.50ms

Threads fairness:
    events (avg/stddev):           15724.1406/14.86
    execution time (avg/stddev):   59.9685/0.00

