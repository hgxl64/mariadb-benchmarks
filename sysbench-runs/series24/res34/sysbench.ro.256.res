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
        read:                            1030229
        write:                           0
        other:                           1030229
        total:                           2060458
    transactions:                        1030229 (17166.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1030229 (17166.76 per sec.)
    other operations:                    1030229 (17166.76 per sec.)

Test execution summary:
    total time:                          60.0130s
    total number of events:              1030229
    total time taken by event execution: 15352.3241
    per-request statistics:
         min:                                  6.31ms
         avg:                                 14.90ms
         max:                                 80.08ms
         approx.  95 percentile:              22.61ms

Threads fairness:
    events (avg/stddev):           4024.3320/23.64
    execution time (avg/stddev):   59.9700/0.00

