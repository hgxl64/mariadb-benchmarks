sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            330861
        write:                           0
        other:                           330861
        total:                           661722
    transactions:                        330861 (5514.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 330861 (5514.32 per sec.)
    other operations:                    330861 (5514.32 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              330861
    total time taken by event execution: 59.7998
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.18ms
         max:                                  0.64ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           330861.0000/0.00
    execution time (avg/stddev):   59.7998/0.00

