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
        read:                            425598
        write:                           0
        other:                           425598
        total:                           851196
    transactions:                        425598 (7093.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 425598 (7093.26 per sec.)
    other operations:                    425598 (7093.26 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              425598
    total time taken by event execution: 119.6029
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.28ms
         max:                                  0.89ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           212799.0000/38.00
    execution time (avg/stddev):   59.8014/0.00

