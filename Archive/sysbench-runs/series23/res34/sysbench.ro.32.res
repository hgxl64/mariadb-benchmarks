sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1105440
        write:                           0
        other:                           1105440
        total:                           2210880
    transactions:                        1105440 (18423.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1105440 (18423.49 per sec.)
    other operations:                    1105440 (18423.49 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1105440
    total time taken by event execution: 1918.0228
    per-request statistics:
         min:                                  1.11ms
         avg:                                  1.74ms
         max:                                  4.38ms
         approx.  95 percentile:               1.96ms

Threads fairness:
    events (avg/stddev):           34545.0000/30.09
    execution time (avg/stddev):   59.9382/0.00

