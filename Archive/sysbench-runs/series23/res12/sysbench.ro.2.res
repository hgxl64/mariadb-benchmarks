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
        read:                            424167
        write:                           0
        other:                           424167
        total:                           848334
    transactions:                        424167 (7069.42 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 424167 (7069.42 per sec.)
    other operations:                    424167 (7069.42 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              424167
    total time taken by event execution: 119.4267
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.28ms
         max:                                  0.76ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           212083.5000/490.50
    execution time (avg/stddev):   59.7133/0.01

