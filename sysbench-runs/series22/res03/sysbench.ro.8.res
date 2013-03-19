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
        read:                            2039011
        write:                           0
        other:                           2039011
        total:                           4078022
    transactions:                        2039011 (33983.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2039011 (33983.34 per sec.)
    other operations:                    2039011 (33983.34 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              2039011
    total time taken by event execution: 476.2406
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.23ms
         max:                                  1.97ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           254876.3750/26761.78
    execution time (avg/stddev):   59.5301/0.09

