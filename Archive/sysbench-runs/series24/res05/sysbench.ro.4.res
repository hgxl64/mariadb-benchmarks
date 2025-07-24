sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1067938
        write:                           0
        other:                           1067938
        total:                           2135876
    transactions:                        1067938 (17798.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1067938 (17798.89 per sec.)
    other operations:                    1067938 (17798.89 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1067938
    total time taken by event execution: 238.4963
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.22ms
         max:                                  0.64ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           266984.5000/14615.29
    execution time (avg/stddev):   59.6241/0.04

