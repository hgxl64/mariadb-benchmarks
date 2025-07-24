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
        read:                            1564887
        write:                           0
        other:                           1564887
        total:                           3129774
    transactions:                        1564887 (26081.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1564887 (26081.25 per sec.)
    other operations:                    1564887 (26081.25 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1564887
    total time taken by event execution: 477.4095
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.31ms
         max:                                  1.68ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           195610.8750/4428.76
    execution time (avg/stddev):   59.6762/0.02

