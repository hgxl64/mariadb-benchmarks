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
        read:                            387808
        write:                           0
        other:                           387808
        total:                           775616
    transactions:                        387808 (6463.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 387808 (6463.41 per sec.)
    other operations:                    387808 (6463.41 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              387808
    total time taken by event execution: 119.4037
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.31ms
         max:                                  0.94ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           193904.0000/2240.00
    execution time (avg/stddev):   59.7019/0.01

