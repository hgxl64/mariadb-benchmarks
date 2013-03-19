sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1591576
        write:                           0
        other:                           1591576
        total:                           3183152
    transactions:                        1591576 (26525.46 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1591576 (26525.46 per sec.)
    other operations:                    1591576 (26525.46 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1591576
    total time taken by event execution: 3837.2400
    per-request statistics:
         min:                                  1.58ms
         avg:                                  2.41ms
         max:                                  7.42ms
         approx.  95 percentile:               2.86ms

Threads fairness:
    events (avg/stddev):           24868.3750/17.74
    execution time (avg/stddev):   59.9569/0.00

