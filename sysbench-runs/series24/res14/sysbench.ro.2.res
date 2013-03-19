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
        read:                            432435
        write:                           0
        other:                           432435
        total:                           864870
    transactions:                        432435 (7207.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 432435 (7207.20 per sec.)
    other operations:                    432435 (7207.20 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              432435
    total time taken by event execution: 119.5368
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.28ms
         max:                                  0.84ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           216217.5000/455.50
    execution time (avg/stddev):   59.7684/0.00

