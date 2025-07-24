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
        read:                            1016892
        write:                           0
        other:                           1016892
        total:                           2033784
    transactions:                        1016892 (16948.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1016892 (16948.14 per sec.)
    other operations:                    1016892 (16948.14 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1016892
    total time taken by event execution: 238.4199
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.23ms
         max:                                  2.62ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           254223.0000/27622.33
    execution time (avg/stddev):   59.6050/0.06

