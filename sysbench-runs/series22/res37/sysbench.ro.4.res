sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            880043
        write:                           0
        other:                           880043
        total:                           1760086
    transactions:                        880043 (14667.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 880043 (14667.26 per sec.)
    other operations:                    880043 (14667.26 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              880043
    total time taken by event execution: 239.0545
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.27ms
         max:                                  6.03ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           220010.7500/1561.91
    execution time (avg/stddev):   59.7636/0.00

