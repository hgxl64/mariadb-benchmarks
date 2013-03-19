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
        read:                            1309043
        write:                           0
        other:                           1309043
        total:                           2618086
    transactions:                        1309043 (21817.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1309043 (21817.22 per sec.)
    other operations:                    1309043 (21817.22 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1309043
    total time taken by event execution: 477.8490
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.37ms
         max:                                  1.61ms
         approx.  95 percentile:               0.51ms

Threads fairness:
    events (avg/stddev):           163630.3750/8515.18
    execution time (avg/stddev):   59.7311/0.01

