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
        read:                            207624
        write:                           0
        other:                           207624
        total:                           415248
    transactions:                        207624 (3460.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 207624 (3460.38 per sec.)
    other operations:                    207624 (3460.38 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              207624
    total time taken by event execution: 59.8284
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.29ms
         max:                                  0.70ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           207624.0000/0.00
    execution time (avg/stddev):   59.8284/0.00

