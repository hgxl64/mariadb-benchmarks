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
        read:                            1039828
        write:                           0
        other:                           1039828
        total:                           2079656
    transactions:                        1039828 (17327.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1039828 (17327.01 per sec.)
    other operations:                    1039828 (17327.01 per sec.)

Test execution summary:
    total time:                          60.0120s
    total number of events:              1039828
    total time taken by event execution: 15353.8092
    per-request statistics:
         min:                                  4.71ms
         avg:                                 14.77ms
         max:                                 73.44ms
         approx.  95 percentile:              22.30ms

Threads fairness:
    events (avg/stddev):           4061.8281/24.94
    execution time (avg/stddev):   59.9758/0.01

