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
        read:                            212131
        write:                           0
        other:                           212131
        total:                           424262
    transactions:                        212131 (3535.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 212131 (3535.50 per sec.)
    other operations:                    212131 (3535.50 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              212131
    total time taken by event execution: 59.8391
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  0.99ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           212131.0000/0.00
    execution time (avg/stddev):   59.8391/0.00

