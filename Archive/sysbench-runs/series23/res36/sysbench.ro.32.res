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
        read:                            1726434
        write:                           0
        other:                           1726434
        total:                           3452868
    transactions:                        1726434 (28773.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1726434 (28773.44 per sec.)
    other operations:                    1726434 (28773.44 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1726434
    total time taken by event execution: 1917.3331
    per-request statistics:
         min:                                  0.67ms
         avg:                                  1.11ms
         max:                                  4.84ms
         approx.  95 percentile:               1.31ms

Threads fairness:
    events (avg/stddev):           53951.0625/31.75
    execution time (avg/stddev):   59.9167/0.00

