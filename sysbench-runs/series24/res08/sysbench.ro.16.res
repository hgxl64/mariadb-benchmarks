sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1418682
        write:                           0
        other:                           1418682
        total:                           2837364
    transactions:                        1418682 (23644.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1418682 (23644.41 per sec.)
    other operations:                    1418682 (23644.41 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              1418682
    total time taken by event execution: 957.0202
    per-request statistics:
         min:                                  0.38ms
         avg:                                  0.67ms
         max:                                  6.20ms
         approx.  95 percentile:               0.79ms

Threads fairness:
    events (avg/stddev):           88667.6250/3849.77
    execution time (avg/stddev):   59.8138/0.01

