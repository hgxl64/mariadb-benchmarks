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
        read:                            566958
        write:                           0
        other:                           566958
        total:                           1133916
    transactions:                        566958 (9449.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 566958 (9449.25 per sec.)
    other operations:                    566958 (9449.25 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              566958
    total time taken by event execution: 59.6869
    per-request statistics:
         min:                                  0.09ms
         avg:                                  0.11ms
         max:                                  0.83ms
         approx.  95 percentile:               0.12ms

Threads fairness:
    events (avg/stddev):           566958.0000/0.00
    execution time (avg/stddev):   59.6869/0.00

