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
        read:                            1774801
        write:                           0
        other:                           1774801
        total:                           3549602
    transactions:                        1774801 (29579.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1774801 (29579.73 per sec.)
    other operations:                    1774801 (29579.73 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1774801
    total time taken by event execution: 957.3394
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.54ms
         max:                                  4.04ms
         approx.  95 percentile:               0.69ms

Threads fairness:
    events (avg/stddev):           110925.0625/2674.35
    execution time (avg/stddev):   59.8337/0.01

