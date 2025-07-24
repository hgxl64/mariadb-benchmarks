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
        read:                            1261036
        write:                           0
        other:                           1261036
        total:                           2522072
    transactions:                        1261036 (21015.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1261036 (21015.07 per sec.)
    other operations:                    1261036 (21015.07 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1261036
    total time taken by event execution: 15352.6139
    per-request statistics:
         min:                                  1.46ms
         avg:                                 12.17ms
         max:                                 96.67ms
         approx.  95 percentile:              23.26ms

Threads fairness:
    events (avg/stddev):           4925.9219/37.96
    execution time (avg/stddev):   59.9711/0.00

