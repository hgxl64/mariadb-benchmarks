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
        read:                            1134278
        write:                           0
        other:                           1134278
        total:                           2268556
    transactions:                        1134278 (18904.53 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1134278 (18904.53 per sec.)
    other operations:                    1134278 (18904.53 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1134278
    total time taken by event execution: 238.8237
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.21ms
         max:                                  1.04ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           283569.5000/20761.90
    execution time (avg/stddev):   59.7059/0.05

