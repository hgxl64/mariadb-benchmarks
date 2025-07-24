sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1866022
        write:                           0
        other:                           1866022
        total:                           3732044
    transactions:                        1866022 (31100.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1866022 (31100.19 per sec.)
    other operations:                    1866022 (31100.19 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1866022
    total time taken by event execution: 477.4013
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                 13.87ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           233252.7500/3386.29
    execution time (avg/stddev):   59.6752/0.01

