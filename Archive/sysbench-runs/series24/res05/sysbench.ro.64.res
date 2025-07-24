sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2537379
        write:                           0
        other:                           2537379
        total:                           5074758
    transactions:                        2537379 (42288.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2537379 (42288.31 per sec.)
    other operations:                    2537379 (42288.31 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              2537379
    total time taken by event execution: 3835.7659
    per-request statistics:
         min:                                  0.71ms
         avg:                                  1.51ms
         max:                                  7.62ms
         approx.  95 percentile:               1.80ms

Threads fairness:
    events (avg/stddev):           39646.5469/47.63
    execution time (avg/stddev):   59.9338/0.00

