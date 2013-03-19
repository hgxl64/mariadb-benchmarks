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
        read:                            1063585
        write:                           0
        other:                           1063585
        total:                           2127170
    transactions:                        1063585 (17725.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1063585 (17725.49 per sec.)
    other operations:                    1063585 (17725.49 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1063585
    total time taken by event execution: 3837.9162
    per-request statistics:
         min:                                  2.83ms
         avg:                                  3.61ms
         max:                                  7.75ms
         approx.  95 percentile:               3.90ms

Threads fairness:
    events (avg/stddev):           16618.5156/7.67
    execution time (avg/stddev):   59.9674/0.00

