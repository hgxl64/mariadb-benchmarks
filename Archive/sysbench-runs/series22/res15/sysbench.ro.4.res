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
        read:                            993523
        write:                           0
        other:                           993523
        total:                           1987046
    transactions:                        993523 (16558.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 993523 (16558.64 per sec.)
    other operations:                    993523 (16558.64 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              993523
    total time taken by event execution: 238.5070
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  7.86ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           248380.7500/25894.26
    execution time (avg/stddev):   59.6268/0.05

