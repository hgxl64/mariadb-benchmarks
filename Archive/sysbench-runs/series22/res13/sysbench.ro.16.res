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
        read:                            1376775
        write:                           0
        other:                           1376775
        total:                           2753550
    transactions:                        1376775 (22946.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1376775 (22946.03 per sec.)
    other operations:                    1376775 (22946.03 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1376775
    total time taken by event execution: 957.8825
    per-request statistics:
         min:                                  0.24ms
         avg:                                  0.70ms
         max:                                  2.64ms
         approx.  95 percentile:               0.89ms

Threads fairness:
    events (avg/stddev):           86048.4375/1021.24
    execution time (avg/stddev):   59.8677/0.01

