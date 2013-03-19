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
        read:                            564109
        write:                           0
        other:                           564109
        total:                           1128218
    transactions:                        564109 (9401.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 564109 (9401.79 per sec.)
    other operations:                    564109 (9401.79 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              564109
    total time taken by event execution: 119.3389
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.21ms
         max:                                  0.65ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           282054.5000/46746.50
    execution time (avg/stddev):   59.6695/0.13

