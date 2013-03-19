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
        read:                            435533
        write:                           0
        other:                           435533
        total:                           871066
    transactions:                        435533 (7258.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 435533 (7258.85 per sec.)
    other operations:                    435533 (7258.85 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              435533
    total time taken by event execution: 119.5144
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.27ms
         max:                                  0.90ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           217766.5000/712.50
    execution time (avg/stddev):   59.7572/0.01

