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
        read:                            2038969
        write:                           0
        other:                           2038969
        total:                           4077938
    transactions:                        2038969 (33982.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2038969 (33982.58 per sec.)
    other operations:                    2038969 (33982.58 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2038969
    total time taken by event execution: 957.0473
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.47ms
         max:                                  7.81ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           127435.5625/2302.52
    execution time (avg/stddev):   59.8155/0.01

