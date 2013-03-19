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
        read:                            1053474
        write:                           0
        other:                           1053474
        total:                           2106948
    transactions:                        1053474 (17556.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1053474 (17556.03 per sec.)
    other operations:                    1053474 (17556.03 per sec.)

Test execution summary:
    total time:                          60.0064s
    total number of events:              1053474
    total time taken by event execution: 7677.1541
    per-request statistics:
         min:                                  4.82ms
         avg:                                  7.29ms
         max:                                 20.79ms
         approx.  95 percentile:               7.71ms

Threads fairness:
    events (avg/stddev):           8230.2656/2.66
    execution time (avg/stddev):   59.9778/0.00

