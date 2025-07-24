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
        read:                            1362135
        write:                           0
        other:                           1362135
        total:                           2724270
    transactions:                        1362135 (22702.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1362135 (22702.09 per sec.)
    other operations:                    1362135 (22702.09 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1362135
    total time taken by event execution: 477.5010
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.35ms
         max:                                  1.82ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           170266.8750/3864.60
    execution time (avg/stddev):   59.6876/0.02

