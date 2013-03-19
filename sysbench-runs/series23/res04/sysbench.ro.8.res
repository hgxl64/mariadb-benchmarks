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
        read:                            1380048
        write:                           0
        other:                           1380048
        total:                           2760096
    transactions:                        1380048 (23000.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1380048 (23000.63 per sec.)
    other operations:                    1380048 (23000.63 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1380048
    total time taken by event execution: 477.7532
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.35ms
         max:                                  1.52ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           172506.0000/1444.65
    execution time (avg/stddev):   59.7191/0.02

