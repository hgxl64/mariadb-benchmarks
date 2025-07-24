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
        read:                            1054544
        write:                           0
        other:                           1054544
        total:                           2109088
    transactions:                        1054544 (17573.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1054544 (17573.81 per sec.)
    other operations:                    1054544 (17573.81 per sec.)

Test execution summary:
    total time:                          60.0066s
    total number of events:              1054544
    total time taken by event execution: 7677.0575
    per-request statistics:
         min:                                  3.23ms
         avg:                                  7.28ms
         max:                                 19.67ms
         approx.  95 percentile:               7.69ms

Threads fairness:
    events (avg/stddev):           8238.6250/2.07
    execution time (avg/stddev):   59.9770/0.00

