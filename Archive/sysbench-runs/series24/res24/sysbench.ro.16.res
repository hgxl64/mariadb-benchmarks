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
        read:                            1049985
        write:                           0
        other:                           1049985
        total:                           2099970
    transactions:                        1049985 (17499.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1049985 (17499.50 per sec.)
    other operations:                    1049985 (17499.50 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1049985
    total time taken by event execution: 958.1654
    per-request statistics:
         min:                                  0.52ms
         avg:                                  0.91ms
         max:                                  2.63ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65624.0625/610.85
    execution time (avg/stddev):   59.8853/0.00

