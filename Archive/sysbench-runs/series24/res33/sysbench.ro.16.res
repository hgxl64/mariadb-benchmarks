sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1414378
        write:                           0
        other:                           1414378
        total:                           2828756
    transactions:                        1414378 (23572.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1414378 (23572.63 per sec.)
    other operations:                    1414378 (23572.63 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1414378
    total time taken by event execution: 957.7689
    per-request statistics:
         min:                                  0.21ms
         avg:                                  0.68ms
         max:                                  2.66ms
         approx.  95 percentile:               0.87ms

Threads fairness:
    events (avg/stddev):           88398.6250/1456.06
    execution time (avg/stddev):   59.8606/0.01

