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
        read:                            1299513
        write:                           0
        other:                           1299513
        total:                           2599026
    transactions:                        1299513 (21658.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1299513 (21658.44 per sec.)
    other operations:                    1299513 (21658.44 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1299513
    total time taken by event execution: 477.6867
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.37ms
         max:                                  1.48ms
         approx.  95 percentile:               0.52ms

Threads fairness:
    events (avg/stddev):           162439.1250/8621.96
    execution time (avg/stddev):   59.7108/0.01

