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
        read:                            200346
        write:                           0
        other:                           200346
        total:                           400692
    transactions:                        200346 (3339.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 200346 (3339.08 per sec.)
    other operations:                    200346 (3339.08 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              200346
    total time taken by event execution: 59.8235
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.30ms
         max:                                  0.72ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           200346.0000/0.00
    execution time (avg/stddev):   59.8235/0.00

