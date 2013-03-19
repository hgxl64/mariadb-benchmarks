sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1544041
        write:                           0
        other:                           1544041
        total:                           3088082
    transactions:                        1544041 (25733.86 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1544041 (25733.86 per sec.)
    other operations:                    1544041 (25733.86 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1544041
    total time taken by event execution: 477.5768
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.31ms
         max:                                  1.73ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           193005.1250/10892.02
    execution time (avg/stddev):   59.6971/0.03

