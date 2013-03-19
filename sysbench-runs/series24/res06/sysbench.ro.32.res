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
        read:                            2212503
        write:                           0
        other:                           2212503
        total:                           4425006
    transactions:                        2212503 (36874.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2212503 (36874.52 per sec.)
    other operations:                    2212503 (36874.52 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2212503
    total time taken by event execution: 1916.2147
    per-request statistics:
         min:                                  0.36ms
         avg:                                  0.87ms
         max:                                  9.31ms
         approx.  95 percentile:               1.04ms

Threads fairness:
    events (avg/stddev):           69140.7188/506.85
    execution time (avg/stddev):   59.8817/0.00

