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
        read:                            404032
        write:                           0
        other:                           404032
        total:                           808064
    transactions:                        404032 (6733.84 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 404032 (6733.84 per sec.)
    other operations:                    404032 (6733.84 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              404032
    total time taken by event execution: 119.4252
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.30ms
         max:                                  0.82ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           202016.0000/1016.00
    execution time (avg/stddev):   59.7126/0.01

