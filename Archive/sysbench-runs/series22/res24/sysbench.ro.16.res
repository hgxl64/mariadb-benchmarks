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
        read:                            1069551
        write:                           0
        other:                           1069551
        total:                           2139102
    transactions:                        1069551 (17825.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1069551 (17825.62 per sec.)
    other operations:                    1069551 (17825.62 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1069551
    total time taken by event execution: 958.1556
    per-request statistics:
         min:                                  0.52ms
         avg:                                  0.90ms
         max:                                  2.77ms
         approx.  95 percentile:               1.06ms

Threads fairness:
    events (avg/stddev):           66846.9375/941.78
    execution time (avg/stddev):   59.8847/0.01

