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
        read:                            2040731
        write:                           0
        other:                           2040731
        total:                           4081462
    transactions:                        2040731 (34011.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2040731 (34011.31 per sec.)
    other operations:                    2040731 (34011.31 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              2040731
    total time taken by event execution: 3836.5826
    per-request statistics:
         min:                                  1.21ms
         avg:                                  1.88ms
         max:                                  5.52ms
         approx.  95 percentile:               2.25ms

Threads fairness:
    events (avg/stddev):           31886.4219/33.38
    execution time (avg/stddev):   59.9466/0.00

