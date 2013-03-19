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
        read:                            513067
        write:                           0
        other:                           513067
        total:                           1026134
    transactions:                        513067 (8551.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 513067 (8551.07 per sec.)
    other operations:                    513067 (8551.07 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              513067
    total time taken by event execution: 119.3327
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.23ms
         max:                                  0.66ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           256533.5000/20259.50
    execution time (avg/stddev):   59.6663/0.02

