sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1589883
        write:                           0
        other:                           1589883
        total:                           3179766
    transactions:                        1589883 (26497.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1589883 (26497.20 per sec.)
    other operations:                    1589883 (26497.20 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1589883
    total time taken by event execution: 3837.2039
    per-request statistics:
         min:                                  1.62ms
         avg:                                  2.41ms
         max:                                  7.42ms
         approx.  95 percentile:               2.87ms

Threads fairness:
    events (avg/stddev):           24841.9219/17.07
    execution time (avg/stddev):   59.9563/0.00

