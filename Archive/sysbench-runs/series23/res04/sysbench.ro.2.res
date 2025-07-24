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
        read:                            461607
        write:                           0
        other:                           461607
        total:                           923214
    transactions:                        461607 (7693.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 461607 (7693.41 per sec.)
    other operations:                    461607 (7693.41 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              461607
    total time taken by event execution: 119.6721
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.26ms
         max:                                  0.84ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           230803.5000/197.50
    execution time (avg/stddev):   59.8360/0.00

