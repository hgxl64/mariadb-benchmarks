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
        read:                            1311268
        write:                           0
        other:                           1311268
        total:                           2622536
    transactions:                        1311268 (21852.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1311268 (21852.20 per sec.)
    other operations:                    1311268 (21852.20 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1311268
    total time taken by event execution: 15352.6601
    per-request statistics:
         min:                                  1.58ms
         avg:                                 11.71ms
         max:                                115.67ms
         approx.  95 percentile:              22.60ms

Threads fairness:
    events (avg/stddev):           5122.1406/45.54
    execution time (avg/stddev):   59.9713/0.00

