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
        read:                            1611107
        write:                           0
        other:                           1611107
        total:                           3222214
    transactions:                        1611107 (26851.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1611107 (26851.36 per sec.)
    other operations:                    1611107 (26851.36 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1611107
    total time taken by event execution: 1917.5267
    per-request statistics:
         min:                                  0.69ms
         avg:                                  1.19ms
         max:                                  3.45ms
         approx.  95 percentile:               1.39ms

Threads fairness:
    events (avg/stddev):           50347.0938/36.04
    execution time (avg/stddev):   59.9227/0.00

