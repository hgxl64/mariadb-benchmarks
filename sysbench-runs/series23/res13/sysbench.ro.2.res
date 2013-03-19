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
        read:                            426109
        write:                           0
        other:                           426109
        total:                           852218
    transactions:                        426109 (7101.78 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 426109 (7101.78 per sec.)
    other operations:                    426109 (7101.78 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              426109
    total time taken by event execution: 119.4902
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.28ms
         max:                                  0.75ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           213054.5000/1851.50
    execution time (avg/stddev):   59.7451/0.03

