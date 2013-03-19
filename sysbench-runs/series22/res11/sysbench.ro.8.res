sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1675238
        write:                           0
        other:                           1675238
        total:                           3350476
    transactions:                        1675238 (27920.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1675238 (27920.44 per sec.)
    other operations:                    1675238 (27920.44 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1675238
    total time taken by event execution: 477.7777
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.29ms
         max:                                  1.31ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           209404.7500/7063.11
    execution time (avg/stddev):   59.7222/0.01

