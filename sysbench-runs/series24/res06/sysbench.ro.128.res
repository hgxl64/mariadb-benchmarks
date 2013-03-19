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
        read:                            2026756
        write:                           0
        other:                           2026756
        total:                           4053512
    transactions:                        2026756 (33777.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2026756 (33777.13 per sec.)
    other operations:                    2026756 (33777.13 per sec.)

Test execution summary:
    total time:                          60.0038s
    total number of events:              2026756
    total time taken by event execution: 7675.5639
    per-request statistics:
         min:                                  1.25ms
         avg:                                  3.79ms
         max:                                 30.17ms
         approx.  95 percentile:               7.89ms

Threads fairness:
    events (avg/stddev):           15834.0312/69.85
    execution time (avg/stddev):   59.9653/0.00

