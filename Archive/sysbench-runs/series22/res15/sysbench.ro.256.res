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
        read:                            2405247
        write:                           0
        other:                           2405247
        total:                           4810494
    transactions:                        2405247 (40082.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2405247 (40082.54 per sec.)
    other operations:                    2405247 (40082.54 per sec.)

Test execution summary:
    total time:                          60.0073s
    total number of events:              2405247
    total time taken by event execution: 15350.9917
    per-request statistics:
         min:                                  1.09ms
         avg:                                  6.38ms
         max:                                 78.89ms
         approx.  95 percentile:              16.37ms

Threads fairness:
    events (avg/stddev):           9395.4961/67.42
    execution time (avg/stddev):   59.9648/0.00

