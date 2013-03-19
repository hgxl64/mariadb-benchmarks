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
        read:                            748585
        write:                           0
        other:                           748585
        total:                           1497170
    transactions:                        748585 (12476.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 748585 (12476.38 per sec.)
    other operations:                    748585 (12476.38 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              748585
    total time taken by event execution: 238.6356
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.32ms
         max:                                  1.55ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           187146.2500/3457.69
    execution time (avg/stddev):   59.6589/0.04

