sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1042117
        write:                           0
        other:                           1042117
        total:                           2084234
    transactions:                        1042117 (17366.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1042117 (17366.51 per sec.)
    other operations:                    1042117 (17366.51 per sec.)

Test execution summary:
    total time:                          60.0073s
    total number of events:              1042117
    total time taken by event execution: 7677.2156
    per-request statistics:
         min:                                  2.53ms
         avg:                                  7.37ms
         max:                                 17.94ms
         approx.  95 percentile:               7.82ms

Threads fairness:
    events (avg/stddev):           8141.5391/2.30
    execution time (avg/stddev):   59.9782/0.00

