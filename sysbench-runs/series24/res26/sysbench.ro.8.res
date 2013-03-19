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
        read:                            1709897
        write:                           0
        other:                           1709897
        total:                           3419794
    transactions:                        1709897 (28498.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1709897 (28498.07 per sec.)
    other operations:                    1709897 (28498.07 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1709897
    total time taken by event execution: 477.2986
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                 12.01ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           213737.1250/10491.06
    execution time (avg/stddev):   59.6623/0.02

