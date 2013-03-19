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
        read:                            490050
        write:                           0
        other:                           490050
        total:                           980100
    transactions:                        490050 (8167.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 490050 (8167.44 per sec.)
    other operations:                    490050 (8167.44 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              490050
    total time taken by event execution: 119.4198
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.24ms
         max:                                  0.82ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           245025.0000/3763.00
    execution time (avg/stddev):   59.7099/0.01

