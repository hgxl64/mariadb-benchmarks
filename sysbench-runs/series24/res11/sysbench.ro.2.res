sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            489885
        write:                           0
        other:                           489885
        total:                           979770
    transactions:                        489885 (8164.71 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 489885 (8164.71 per sec.)
    other operations:                    489885 (8164.71 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              489885
    total time taken by event execution: 119.4226
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.24ms
         max:                                  0.69ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           244942.5000/6987.50
    execution time (avg/stddev):   59.7113/0.01

