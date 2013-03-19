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
        read:                            1626685
        write:                           0
        other:                           1626685
        total:                           3253370
    transactions:                        1626685 (27111.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1626685 (27111.17 per sec.)
    other operations:                    1626685 (27111.17 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1626685
    total time taken by event execution: 957.5477
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.59ms
         max:                                  5.62ms
         approx.  95 percentile:               0.75ms

Threads fairness:
    events (avg/stddev):           101667.8125/573.07
    execution time (avg/stddev):   59.8467/0.01

