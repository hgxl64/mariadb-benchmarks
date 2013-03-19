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
        read:                            626454
        write:                           0
        other:                           626454
        total:                           1252908
    transactions:                        626454 (10440.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 626454 (10440.85 per sec.)
    other operations:                    626454 (10440.85 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              626454
    total time taken by event execution: 118.9127
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.19ms
         max:                                  1.27ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           313227.0000/73309.00
    execution time (avg/stddev):   59.4563/0.07

