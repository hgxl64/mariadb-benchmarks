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
        read:                            992472
        write:                           0
        other:                           992472
        total:                           1984944
    transactions:                        992472 (16541.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 992472 (16541.08 per sec.)
    other operations:                    992472 (16541.08 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              992472
    total time taken by event execution: 238.5034
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  1.21ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           248118.0000/33166.84
    execution time (avg/stddev):   59.6259/0.09

