sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1048626
        write:                           0
        other:                           1048626
        total:                           2097252
    transactions:                        1048626 (17476.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048626 (17476.56 per sec.)
    other operations:                    1048626 (17476.56 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1048626
    total time taken by event execution: 1918.2345
    per-request statistics:
         min:                                  1.31ms
         avg:                                  1.83ms
         max:                                  4.12ms
         approx.  95 percentile:               2.05ms

Threads fairness:
    events (avg/stddev):           32769.5625/20.22
    execution time (avg/stddev):   59.9448/0.00

