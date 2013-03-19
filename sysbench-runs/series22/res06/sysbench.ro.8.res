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
        read:                            1849503
        write:                           0
        other:                           1849503
        total:                           3699006
    transactions:                        1849503 (30824.87 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1849503 (30824.87 per sec.)
    other operations:                    1849503 (30824.87 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1849503
    total time taken by event execution: 476.8779
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.26ms
         max:                                  2.05ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           231187.8750/12663.27
    execution time (avg/stddev):   59.6097/0.03

