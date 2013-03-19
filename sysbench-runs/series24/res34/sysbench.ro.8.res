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
        read:                            1073598
        write:                           0
        other:                           1073598
        total:                           2147196
    transactions:                        1073598 (17893.12 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1073598 (17893.12 per sec.)
    other operations:                    1073598 (17893.12 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1073598
    total time taken by event execution: 477.9713
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.45ms
         max:                                  1.39ms
         approx.  95 percentile:               0.58ms

Threads fairness:
    events (avg/stddev):           134199.7500/4747.81
    execution time (avg/stddev):   59.7464/0.01

