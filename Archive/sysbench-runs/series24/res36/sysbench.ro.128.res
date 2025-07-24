sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1950627
        write:                           0
        other:                           1950627
        total:                           3901254
    transactions:                        1950627 (32508.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1950627 (32508.62 per sec.)
    other operations:                    1950627 (32508.62 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1950627
    total time taken by event execution: 7675.7498
    per-request statistics:
         min:                                  1.26ms
         avg:                                  3.94ms
         max:                                 31.05ms
         approx.  95 percentile:               8.14ms

Threads fairness:
    events (avg/stddev):           15239.2734/70.73
    execution time (avg/stddev):   59.9668/0.00

