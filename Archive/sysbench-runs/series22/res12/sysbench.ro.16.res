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
        read:                            1455202
        write:                           0
        other:                           1455202
        total:                           2910404
    transactions:                        1455202 (24253.18 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1455202 (24253.18 per sec.)
    other operations:                    1455202 (24253.18 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1455202
    total time taken by event execution: 957.6369
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.66ms
         max:                                  5.35ms
         approx.  95 percentile:               0.85ms

Threads fairness:
    events (avg/stddev):           90950.1250/1892.24
    execution time (avg/stddev):   59.8523/0.01

