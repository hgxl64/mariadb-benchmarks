sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            527415
        write:                           0
        other:                           527415
        total:                           1054830
    transactions:                        527415 (8790.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 527415 (8790.22 per sec.)
    other operations:                    527415 (8790.22 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              527415
    total time taken by event execution: 59.7097
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.11ms
         max:                                  1.40ms
         approx.  95 percentile:               0.13ms

Threads fairness:
    events (avg/stddev):           527415.0000/0.00
    execution time (avg/stddev):   59.7097/0.00

