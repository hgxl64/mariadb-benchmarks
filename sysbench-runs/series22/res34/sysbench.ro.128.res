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
        read:                            1050185
        write:                           0
        other:                           1050185
        total:                           2100370
    transactions:                        1050185 (17501.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1050185 (17501.20 per sec.)
    other operations:                    1050185 (17501.20 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1050185
    total time taken by event execution: 7677.1305
    per-request statistics:
         min:                                  6.09ms
         avg:                                  7.31ms
         max:                                 17.09ms
         approx.  95 percentile:               7.73ms

Threads fairness:
    events (avg/stddev):           8204.5703/2.48
    execution time (avg/stddev):   59.9776/0.00

