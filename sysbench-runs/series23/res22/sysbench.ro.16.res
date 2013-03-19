sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1434628
        write:                           0
        other:                           1434628
        total:                           2869256
    transactions:                        1434628 (23910.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1434628 (23910.25 per sec.)
    other operations:                    1434628 (23910.25 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1434628
    total time taken by event execution: 957.5481
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.67ms
         max:                                  3.83ms
         approx.  95 percentile:               0.86ms

Threads fairness:
    events (avg/stddev):           89664.2500/2750.65
    execution time (avg/stddev):   59.8468/0.01

