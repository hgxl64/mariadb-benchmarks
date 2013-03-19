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
        read:                            431294
        write:                           0
        other:                           431294
        total:                           862588
    transactions:                        431294 (7188.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 431294 (7188.20 per sec.)
    other operations:                    431294 (7188.20 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              431294
    total time taken by event execution: 119.4163
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  0.84ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           215647.0000/668.00
    execution time (avg/stddev):   59.7081/0.01

