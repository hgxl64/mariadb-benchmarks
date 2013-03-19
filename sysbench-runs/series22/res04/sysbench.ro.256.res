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
        read:                            1048360
        write:                           0
        other:                           1048360
        total:                           2096720
    transactions:                        1048360 (17469.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048360 (17469.02 per sec.)
    other operations:                    1048360 (17469.02 per sec.)

Test execution summary:
    total time:                          60.0125s
    total number of events:              1048360
    total time taken by event execution: 15353.7386
    per-request statistics:
         min:                                  6.57ms
         avg:                                 14.65ms
         max:                                 77.02ms
         approx.  95 percentile:              22.17ms

Threads fairness:
    events (avg/stddev):           4095.1562/28.28
    execution time (avg/stddev):   59.9755/0.01

