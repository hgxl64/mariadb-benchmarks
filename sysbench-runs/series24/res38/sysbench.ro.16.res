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
        read:                            1017912
        write:                           0
        other:                           1017912
        total:                           2035824
    transactions:                        1017912 (16964.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1017912 (16964.92 per sec.)
    other operations:                    1017912 (16964.92 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1017912
    total time taken by event execution: 958.1791
    per-request statistics:
         min:                                  0.44ms
         avg:                                  0.94ms
         max:                                  3.28ms
         approx.  95 percentile:               1.11ms

Threads fairness:
    events (avg/stddev):           63619.5000/591.94
    execution time (avg/stddev):   59.8862/0.01

