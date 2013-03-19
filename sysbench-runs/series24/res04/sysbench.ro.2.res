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
        read:                            512389
        write:                           0
        other:                           512389
        total:                           1024778
    transactions:                        512389 (8539.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 512389 (8539.79 per sec.)
    other operations:                    512389 (8539.79 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              512389
    total time taken by event execution: 119.4488
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.23ms
         max:                                  0.87ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           256194.5000/23520.50
    execution time (avg/stddev):   59.7244/0.08

