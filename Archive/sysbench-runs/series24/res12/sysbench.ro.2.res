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
        read:                            594302
        write:                           0
        other:                           594302
        total:                           1188604
    transactions:                        594302 (9904.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 594302 (9904.97 per sec.)
    other operations:                    594302 (9904.97 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              594302
    total time taken by event execution: 119.1300
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.20ms
         max:                                  0.65ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           297151.0000/45277.00
    execution time (avg/stddev):   59.5650/0.01

