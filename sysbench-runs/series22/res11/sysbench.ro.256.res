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
        read:                            1667974
        write:                           0
        other:                           1667974
        total:                           3335948
    transactions:                        1667974 (27796.65 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1667974 (27796.65 per sec.)
    other operations:                    1667974 (27796.65 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1667974
    total time taken by event execution: 15352.5131
    per-request statistics:
         min:                                  1.51ms
         avg:                                  9.20ms
         max:                                 85.48ms
         approx.  95 percentile:              22.68ms

Threads fairness:
    events (avg/stddev):           6515.5234/53.87
    execution time (avg/stddev):   59.9708/0.00

