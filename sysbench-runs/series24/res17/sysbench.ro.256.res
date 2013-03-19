sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1838195
        write:                           0
        other:                           1838195
        total:                           3676390
    transactions:                        1838195 (30632.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1838195 (30632.48 per sec.)
    other operations:                    1838195 (30632.48 per sec.)

Test execution summary:
    total time:                          60.0080s
    total number of events:              1838195
    total time taken by event execution: 15352.3652
    per-request statistics:
         min:                                  1.34ms
         avg:                                  8.35ms
         max:                                 92.44ms
         approx.  95 percentile:              20.97ms

Threads fairness:
    events (avg/stddev):           7180.4492/50.71
    execution time (avg/stddev):   59.9702/0.00

