sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1629469
        write:                           0
        other:                           1629469
        total:                           3258938
    transactions:                        1629469 (27157.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1629469 (27157.41 per sec.)
    other operations:                    1629469 (27157.41 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1629469
    total time taken by event execution: 1917.4815
    per-request statistics:
         min:                                  0.73ms
         avg:                                  1.18ms
         max:                                 14.81ms
         approx.  95 percentile:               1.39ms

Threads fairness:
    events (avg/stddev):           50920.9062/34.92
    execution time (avg/stddev):   59.9213/0.00

