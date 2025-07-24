sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1083099
        write:                           0
        other:                           1083099
        total:                           2166198
    transactions:                        1083099 (18051.39 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1083099 (18051.39 per sec.)
    other operations:                    1083099 (18051.39 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1083099
    total time taken by event execution: 1918.1831
    per-request statistics:
         min:                                  0.92ms
         avg:                                  1.77ms
         max:                                  4.89ms
         approx.  95 percentile:               2.14ms

Threads fairness:
    events (avg/stddev):           33846.8438/31.48
    execution time (avg/stddev):   59.9432/0.00

