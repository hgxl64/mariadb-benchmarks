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
        read:                            452141
        write:                           0
        other:                           452141
        total:                           904282
    transactions:                        452141 (7535.66 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 452141 (7535.66 per sec.)
    other operations:                    452141 (7535.66 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              452141
    total time taken by event execution: 119.5022
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.26ms
         max:                                  0.71ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           226070.5000/12.50
    execution time (avg/stddev):   59.7511/0.01

