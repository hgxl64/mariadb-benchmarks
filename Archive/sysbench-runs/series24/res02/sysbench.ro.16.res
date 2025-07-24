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
        read:                            2690940
        write:                           0
        other:                           2690940
        total:                           5381880
    transactions:                        2690940 (44848.71 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2690940 (44848.71 per sec.)
    other operations:                    2690940 (44848.71 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2690940
    total time taken by event execution: 955.6376
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.36ms
         max:                                  2.59ms
         approx.  95 percentile:               0.55ms

Threads fairness:
    events (avg/stddev):           168183.7500/7239.38
    execution time (avg/stddev):   59.7274/0.01

