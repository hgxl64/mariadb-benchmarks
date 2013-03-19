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
        read:                            2702250
        write:                           0
        other:                           2702250
        total:                           5404500
    transactions:                        2702250 (45037.19 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2702250 (45037.19 per sec.)
    other operations:                    2702250 (45037.19 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2702250
    total time taken by event execution: 955.1912
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.35ms
         max:                                 14.90ms
         approx.  95 percentile:               0.50ms

Threads fairness:
    events (avg/stddev):           168890.6250/6842.91
    execution time (avg/stddev):   59.6994/0.02

