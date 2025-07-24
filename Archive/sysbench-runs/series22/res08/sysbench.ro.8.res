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
        read:                            1482192
        write:                           0
        other:                           1482192
        total:                           2964384
    transactions:                        1482192 (24703.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1482192 (24703.00 per sec.)
    other operations:                    1482192 (24703.00 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1482192
    total time taken by event execution: 477.6867
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.32ms
         max:                                  1.50ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           185274.0000/8551.66
    execution time (avg/stddev):   59.7108/0.02

