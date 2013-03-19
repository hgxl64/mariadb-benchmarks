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
        read:                            1107728
        write:                           0
        other:                           1107728
        total:                           2215456
    transactions:                        1107728 (18461.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1107728 (18461.95 per sec.)
    other operations:                    1107728 (18461.95 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1107728
    total time taken by event execution: 478.1718
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.43ms
         max:                                  1.55ms
         approx.  95 percentile:               0.58ms

Threads fairness:
    events (avg/stddev):           138466.0000/4152.47
    execution time (avg/stddev):   59.7715/0.01

