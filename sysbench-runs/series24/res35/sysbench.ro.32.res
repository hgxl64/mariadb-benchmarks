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
        read:                            2566231
        write:                           0
        other:                           2566231
        total:                           5132462
    transactions:                        2566231 (42769.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2566231 (42769.98 per sec.)
    other operations:                    2566231 (42769.98 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              2566231
    total time taken by event execution: 1915.9559
    per-request statistics:
         min:                                  0.41ms
         avg:                                  0.75ms
         max:                                 18.12ms
         approx.  95 percentile:               0.92ms

Threads fairness:
    events (avg/stddev):           80194.7188/228.50
    execution time (avg/stddev):   59.8736/0.00

