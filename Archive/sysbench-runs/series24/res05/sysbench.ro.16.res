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
        read:                            2983708
        write:                           0
        other:                           2983708
        total:                           5967416
    transactions:                        2983708 (49728.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2983708 (49728.10 per sec.)
    other operations:                    2983708 (49728.10 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2983708
    total time taken by event execution: 955.1800
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.32ms
         max:                                  9.17ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           186481.7500/4128.05
    execution time (avg/stddev):   59.6988/0.01

