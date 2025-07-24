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
        read:                            398490
        write:                           0
        other:                           398490
        total:                           796980
    transactions:                        398490 (6641.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 398490 (6641.47 per sec.)
    other operations:                    398490 (6641.47 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              398490
    total time taken by event execution: 59.7391
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.15ms
         max:                                  0.77ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           398490.0000/0.00
    execution time (avg/stddev):   59.7391/0.00

