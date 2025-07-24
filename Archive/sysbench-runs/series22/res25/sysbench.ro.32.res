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
        read:                            2549223
        write:                           0
        other:                           2549223
        total:                           5098446
    transactions:                        2549223 (42486.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2549223 (42486.40 per sec.)
    other operations:                    2549223 (42486.40 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2549223
    total time taken by event execution: 1916.1029
    per-request statistics:
         min:                                  0.32ms
         avg:                                  0.75ms
         max:                                 16.70ms
         approx.  95 percentile:               0.93ms

Threads fairness:
    events (avg/stddev):           79663.2188/209.41
    execution time (avg/stddev):   59.8782/0.00

