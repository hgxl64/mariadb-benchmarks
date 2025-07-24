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
        read:                            2206397
        write:                           0
        other:                           2206397
        total:                           4412794
    transactions:                        2206397 (36772.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2206397 (36772.96 per sec.)
    other operations:                    2206397 (36772.96 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2206397
    total time taken by event execution: 956.8636
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.43ms
         max:                                 16.49ms
         approx.  95 percentile:               0.56ms

Threads fairness:
    events (avg/stddev):           137899.8125/1585.17
    execution time (avg/stddev):   59.8040/0.01

