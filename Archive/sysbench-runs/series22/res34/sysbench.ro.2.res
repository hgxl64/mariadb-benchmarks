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
        read:                            458524
        write:                           0
        other:                           458524
        total:                           917048
    transactions:                        458524 (7642.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 458524 (7642.04 per sec.)
    other operations:                    458524 (7642.04 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              458524
    total time taken by event execution: 119.6429
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.26ms
         max:                                  0.85ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           229262.0000/5876.00
    execution time (avg/stddev):   59.8215/0.01

