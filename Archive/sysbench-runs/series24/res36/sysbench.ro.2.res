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
        read:                            459732
        write:                           0
        other:                           459732
        total:                           919464
    transactions:                        459732 (7662.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 459732 (7662.15 per sec.)
    other operations:                    459732 (7662.15 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              459732
    total time taken by event execution: 119.4298
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.26ms
         max:                                  0.81ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           229866.0000/328.00
    execution time (avg/stddev):   59.7149/0.00

