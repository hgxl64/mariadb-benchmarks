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
        read:                            1055336
        write:                           0
        other:                           1055336
        total:                           2110672
    transactions:                        1055336 (17585.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1055336 (17585.04 per sec.)
    other operations:                    1055336 (17585.04 per sec.)

Test execution summary:
    total time:                          60.0133s
    total number of events:              1055336
    total time taken by event execution: 15353.8393
    per-request statistics:
         min:                                  6.61ms
         avg:                                 14.55ms
         max:                                 82.49ms
         approx.  95 percentile:              22.03ms

Threads fairness:
    events (avg/stddev):           4122.4062/26.30
    execution time (avg/stddev):   59.9759/0.00

