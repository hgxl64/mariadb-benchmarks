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
        read:                            1058400
        write:                           0
        other:                           1058400
        total:                           2116800
    transactions:                        1058400 (17639.55 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1058400 (17639.55 per sec.)
    other operations:                    1058400 (17639.55 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1058400
    total time taken by event execution: 1918.2062
    per-request statistics:
         min:                                  1.06ms
         avg:                                  1.81ms
         max:                                  3.79ms
         approx.  95 percentile:               2.04ms

Threads fairness:
    events (avg/stddev):           33075.0000/18.58
    execution time (avg/stddev):   59.9439/0.00

