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
        read:                            1272146
        write:                           0
        other:                           1272146
        total:                           2544292
    transactions:                        1272146 (21200.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1272146 (21200.21 per sec.)
    other operations:                    1272146 (21200.21 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1272146
    total time taken by event execution: 15352.5729
    per-request statistics:
         min:                                  1.62ms
         avg:                                 12.07ms
         max:                                110.72ms
         approx.  95 percentile:              23.22ms

Threads fairness:
    events (avg/stddev):           4969.3203/41.75
    execution time (avg/stddev):   59.9710/0.00

