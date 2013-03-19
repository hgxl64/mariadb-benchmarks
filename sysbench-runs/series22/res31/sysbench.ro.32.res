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
        read:                            1751571
        write:                           0
        other:                           1751571
        total:                           3503142
    transactions:                        1751571 (29192.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1751571 (29192.40 per sec.)
    other operations:                    1751571 (29192.40 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1751571
    total time taken by event execution: 1917.4159
    per-request statistics:
         min:                                  0.56ms
         avg:                                  1.09ms
         max:                                  3.49ms
         approx.  95 percentile:               1.29ms

Threads fairness:
    events (avg/stddev):           54736.5938/77.37
    execution time (avg/stddev):   59.9192/0.00

