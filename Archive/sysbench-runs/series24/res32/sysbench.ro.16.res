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
        read:                            1455377
        write:                           0
        other:                           1455377
        total:                           2910754
    transactions:                        1455377 (24256.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1455377 (24256.03 per sec.)
    other operations:                    1455377 (24256.03 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1455377
    total time taken by event execution: 957.6625
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.66ms
         max:                                  3.05ms
         approx.  95 percentile:               0.85ms

Threads fairness:
    events (avg/stddev):           90961.0625/1393.30
    execution time (avg/stddev):   59.8539/0.01

