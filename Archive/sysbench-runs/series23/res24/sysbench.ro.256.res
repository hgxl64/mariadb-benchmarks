sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1064840
        write:                           0
        other:                           1064840
        total:                           2129680
    transactions:                        1064840 (17743.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1064840 (17743.56 per sec.)
    other operations:                    1064840 (17743.56 per sec.)

Test execution summary:
    total time:                          60.0127s
    total number of events:              1064840
    total time taken by event execution: 15354.1331
    per-request statistics:
         min:                                  5.55ms
         avg:                                 14.42ms
         max:                                 75.83ms
         approx.  95 percentile:              21.85ms

Threads fairness:
    events (avg/stddev):           4159.5312/26.55
    execution time (avg/stddev):   59.9771/0.00

