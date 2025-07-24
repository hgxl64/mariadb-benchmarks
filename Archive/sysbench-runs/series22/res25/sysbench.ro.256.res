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
        read:                            2406241
        write:                           0
        other:                           2406241
        total:                           4812482
    transactions:                        2406241 (40099.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2406241 (40099.14 per sec.)
    other operations:                    2406241 (40099.14 per sec.)

Test execution summary:
    total time:                          60.0073s
    total number of events:              2406241
    total time taken by event execution: 15351.1468
    per-request statistics:
         min:                                  1.09ms
         avg:                                  6.38ms
         max:                                 83.41ms
         approx.  95 percentile:              16.34ms

Threads fairness:
    events (avg/stddev):           9399.3789/72.07
    execution time (avg/stddev):   59.9654/0.00

