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
        read:                            470312
        write:                           0
        other:                           470312
        total:                           940624
    transactions:                        470312 (7838.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 470312 (7838.51 per sec.)
    other operations:                    470312 (7838.51 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              470312
    total time taken by event execution: 119.4637
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.25ms
         max:                                  0.74ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           235156.0000/9178.00
    execution time (avg/stddev):   59.7318/0.02

