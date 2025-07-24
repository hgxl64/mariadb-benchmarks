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
        read:                            1640218
        write:                           0
        other:                           1640218
        total:                           3280436
    transactions:                        1640218 (27336.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1640218 (27336.82 per sec.)
    other operations:                    1640218 (27336.82 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1640218
    total time taken by event execution: 477.7129
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.29ms
         max:                                  1.81ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           205027.2500/4112.35
    execution time (avg/stddev):   59.7141/0.01

