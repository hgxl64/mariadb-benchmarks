sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            529552
        write:                           0
        other:                           529552
        total:                           1059104
    transactions:                        529552 (8825.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 529552 (8825.81 per sec.)
    other operations:                    529552 (8825.81 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              529552
    total time taken by event execution: 119.3619
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.23ms
         max:                                  0.79ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           264776.0000/51984.00
    execution time (avg/stddev):   59.6809/0.10

