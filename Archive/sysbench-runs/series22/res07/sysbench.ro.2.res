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
        read:                            443888
        write:                           0
        other:                           443888
        total:                           887776
    transactions:                        443888 (7398.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 443888 (7398.08 per sec.)
    other operations:                    443888 (7398.08 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              443888
    total time taken by event execution: 119.2780
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  0.87ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           221944.0000/1552.00
    execution time (avg/stddev):   59.6390/0.01

