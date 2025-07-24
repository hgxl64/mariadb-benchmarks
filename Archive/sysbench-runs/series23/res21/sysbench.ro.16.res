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
        read:                            1603233
        write:                           0
        other:                           1603233
        total:                           3206466
    transactions:                        1603233 (26720.33 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1603233 (26720.33 per sec.)
    other operations:                    1603233 (26720.33 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1603233
    total time taken by event execution: 957.6201
    per-request statistics:
         min:                                  0.21ms
         avg:                                  0.60ms
         max:                                  2.43ms
         approx.  95 percentile:               0.74ms

Threads fairness:
    events (avg/stddev):           100202.0625/923.49
    execution time (avg/stddev):   59.8513/0.01

