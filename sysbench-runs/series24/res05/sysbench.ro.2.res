sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            802818
        write:                           0
        other:                           802818
        total:                           1605636
    transactions:                        802818 (13380.24 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 802818 (13380.24 per sec.)
    other operations:                    802818 (13380.24 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              802818
    total time taken by event execution: 118.7359
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.15ms
         max:                                  0.49ms
         approx.  95 percentile:               0.23ms

Threads fairness:
    events (avg/stddev):           401409.0000/97423.00
    execution time (avg/stddev):   59.3680/0.09

