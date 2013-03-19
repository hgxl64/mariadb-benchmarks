sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1044316
        write:                           0
        other:                           1044316
        total:                           2088632
    transactions:                        1044316 (17403.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1044316 (17403.35 per sec.)
    other operations:                    1044316 (17403.35 per sec.)

Test execution summary:
    total time:                          60.0066s
    total number of events:              1044316
    total time taken by event execution: 7677.0126
    per-request statistics:
         min:                                  3.97ms
         avg:                                  7.35ms
         max:                                 22.21ms
         approx.  95 percentile:               7.75ms

Threads fairness:
    events (avg/stddev):           8158.7188/2.19
    execution time (avg/stddev):   59.9767/0.00

