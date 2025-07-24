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
        read:                            1831776
        write:                           0
        other:                           1831776
        total:                           3663552
    transactions:                        1831776 (30528.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1831776 (30528.63 per sec.)
    other operations:                    1831776 (30528.63 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1831776
    total time taken by event execution: 3836.8680
    per-request statistics:
         min:                                  1.39ms
         avg:                                  2.09ms
         max:                                 18.45ms
         approx.  95 percentile:               2.51ms

Threads fairness:
    events (avg/stddev):           28621.5000/24.59
    execution time (avg/stddev):   59.9511/0.00

