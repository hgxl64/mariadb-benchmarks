sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1020984
        write:                           0
        other:                           1020984
        total:                           2041968
    transactions:                        1020984 (17016.33 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1020984 (17016.33 per sec.)
    other operations:                    1020984 (17016.33 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1020984
    total time taken by event execution: 238.7874
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.23ms
         max:                                  0.97ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           255246.0000/20237.59
    execution time (avg/stddev):   59.6968/0.04

