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
        read:                            1723760
        write:                           0
        other:                           1723760
        total:                           3447520
    transactions:                        1723760 (28728.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1723760 (28728.93 per sec.)
    other operations:                    1723760 (28728.93 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1723760
    total time taken by event execution: 1917.2356
    per-request statistics:
         min:                                  0.66ms
         avg:                                  1.11ms
         max:                                 15.65ms
         approx.  95 percentile:               1.31ms

Threads fairness:
    events (avg/stddev):           53867.5000/208.81
    execution time (avg/stddev):   59.9136/0.00

