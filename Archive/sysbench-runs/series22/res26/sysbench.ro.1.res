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
        read:                            176027
        write:                           0
        other:                           176027
        total:                           352054
    transactions:                        176027 (2933.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 176027 (2933.77 per sec.)
    other operations:                    176027 (2933.77 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              176027
    total time taken by event execution: 59.8833
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.34ms
         max:                                  0.81ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           176027.0000/0.00
    execution time (avg/stddev):   59.8833/0.00

