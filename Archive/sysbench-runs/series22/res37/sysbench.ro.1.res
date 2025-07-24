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
        read:                            172742
        write:                           0
        other:                           172742
        total:                           345484
    transactions:                        172742 (2879.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 172742 (2879.01 per sec.)
    other operations:                    172742 (2879.01 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              172742
    total time taken by event execution: 59.8448
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.35ms
         max:                                  0.73ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           172742.0000/0.00
    execution time (avg/stddev):   59.8448/0.00

