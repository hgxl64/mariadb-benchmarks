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
        read:                            1171963
        write:                           0
        other:                           1171963
        total:                           2343926
    transactions:                        1171963 (19532.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1171963 (19532.13 per sec.)
    other operations:                    1171963 (19532.13 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1171963
    total time taken by event execution: 1917.9441
    per-request statistics:
         min:                                  1.16ms
         avg:                                  1.64ms
         max:                                  4.24ms
         approx.  95 percentile:               1.80ms

Threads fairness:
    events (avg/stddev):           36623.8438/32.74
    execution time (avg/stddev):   59.9358/0.00

