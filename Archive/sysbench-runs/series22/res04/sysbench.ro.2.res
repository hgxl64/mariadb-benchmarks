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
        read:                            461658
        write:                           0
        other:                           461658
        total:                           923316
    transactions:                        461658 (7694.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 461658 (7694.26 per sec.)
    other operations:                    461658 (7694.26 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              461658
    total time taken by event execution: 119.6382
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.26ms
         max:                                  1.46ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           230829.0000/359.00
    execution time (avg/stddev):   59.8191/0.00

