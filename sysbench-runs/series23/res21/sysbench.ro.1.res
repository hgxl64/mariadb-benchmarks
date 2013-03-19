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
        read:                            184479
        write:                           0
        other:                           184479
        total:                           368958
    transactions:                        184479 (3074.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 184479 (3074.62 per sec.)
    other operations:                    184479 (3074.62 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              184479
    total time taken by event execution: 59.8423
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.32ms
         max:                                  0.66ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           184479.0000/0.00
    execution time (avg/stddev):   59.8423/0.00

