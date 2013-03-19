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
        read:                            212248
        write:                           0
        other:                           212248
        total:                           424496
    transactions:                        212248 (3537.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 212248 (3537.44 per sec.)
    other operations:                    212248 (3537.44 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              212248
    total time taken by event execution: 59.8338
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.28ms
         max:                                  0.93ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           212248.0000/0.00
    execution time (avg/stddev):   59.8338/0.00

