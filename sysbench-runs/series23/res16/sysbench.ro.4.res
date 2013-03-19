sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            862263
        write:                           0
        other:                           862263
        total:                           1724526
    transactions:                        862263 (14370.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 862263 (14370.94 per sec.)
    other operations:                    862263 (14370.94 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              862263
    total time taken by event execution: 238.6072
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.28ms
         max:                                  4.22ms
         approx.  95 percentile:               0.37ms

Threads fairness:
    events (avg/stddev):           215565.7500/24551.34
    execution time (avg/stddev):   59.6518/0.06

