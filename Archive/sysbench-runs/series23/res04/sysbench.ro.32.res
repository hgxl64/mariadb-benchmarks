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
        read:                            1154664
        write:                           0
        other:                           1154664
        total:                           2309328
    transactions:                        1154664 (19243.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1154664 (19243.89 per sec.)
    other operations:                    1154664 (19243.89 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1154664
    total time taken by event execution: 1918.0060
    per-request statistics:
         min:                                  0.88ms
         avg:                                  1.66ms
         max:                                  3.93ms
         approx.  95 percentile:               1.85ms

Threads fairness:
    events (avg/stddev):           36083.2500/31.48
    execution time (avg/stddev):   59.9377/0.00

