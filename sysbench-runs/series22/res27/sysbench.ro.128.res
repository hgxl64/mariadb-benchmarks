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
        read:                            1834424
        write:                           0
        other:                           1834424
        total:                           3668848
    transactions:                        1834424 (30571.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1834424 (30571.83 per sec.)
    other operations:                    1834424 (30571.83 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              1834424
    total time taken by event execution: 7675.7360
    per-request statistics:
         min:                                  1.42ms
         avg:                                  4.18ms
         max:                                 30.87ms
         approx.  95 percentile:               8.56ms

Threads fairness:
    events (avg/stddev):           14331.4375/63.46
    execution time (avg/stddev):   59.9667/0.00

