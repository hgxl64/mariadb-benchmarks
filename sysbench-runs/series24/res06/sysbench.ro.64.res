sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2034547
        write:                           0
        other:                           2034547
        total:                           4069094
    transactions:                        2034547 (33908.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2034547 (33908.22 per sec.)
    other operations:                    2034547 (33908.22 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              2034547
    total time taken by event execution: 3836.4217
    per-request statistics:
         min:                                  0.50ms
         avg:                                  1.89ms
         max:                                  7.63ms
         approx.  95 percentile:               2.27ms

Threads fairness:
    events (avg/stddev):           31789.7969/29.35
    execution time (avg/stddev):   59.9441/0.00

