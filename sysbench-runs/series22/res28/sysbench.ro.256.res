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
        read:                            1048772
        write:                           0
        other:                           1048772
        total:                           2097544
    transactions:                        1048772 (17475.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048772 (17475.78 per sec.)
    other operations:                    1048772 (17475.78 per sec.)

Test execution summary:
    total time:                          60.0129s
    total number of events:              1048772
    total time taken by event execution: 15353.5684
    per-request statistics:
         min:                                  6.75ms
         avg:                                 14.64ms
         max:                                 71.45ms
         approx.  95 percentile:              22.20ms

Threads fairness:
    events (avg/stddev):           4096.7656/27.39
    execution time (avg/stddev):   59.9749/0.01

