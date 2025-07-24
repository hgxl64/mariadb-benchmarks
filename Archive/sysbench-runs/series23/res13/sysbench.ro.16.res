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
        read:                            1107781
        write:                           0
        other:                           1107781
        total:                           2215562
    transactions:                        1107781 (18462.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1107781 (18462.82 per sec.)
    other operations:                    1107781 (18462.82 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1107781
    total time taken by event execution: 958.1144
    per-request statistics:
         min:                                  0.25ms
         avg:                                  0.86ms
         max:                                  3.10ms
         approx.  95 percentile:               1.11ms

Threads fairness:
    events (avg/stddev):           69236.3125/769.22
    execution time (avg/stddev):   59.8821/0.00

