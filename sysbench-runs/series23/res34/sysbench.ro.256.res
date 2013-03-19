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
        read:                            1061612
        write:                           0
        other:                           1061612
        total:                           2123224
    transactions:                        1061612 (17689.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1061612 (17689.85 per sec.)
    other operations:                    1061612 (17689.85 per sec.)

Test execution summary:
    total time:                          60.0125s
    total number of events:              1061612
    total time taken by event execution: 15353.5699
    per-request statistics:
         min:                                  6.61ms
         avg:                                 14.46ms
         max:                                 76.88ms
         approx.  95 percentile:              21.93ms

Threads fairness:
    events (avg/stddev):           4146.9219/25.83
    execution time (avg/stddev):   59.9749/0.00

