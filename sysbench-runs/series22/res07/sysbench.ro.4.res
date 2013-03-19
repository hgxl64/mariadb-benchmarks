sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            969781
        write:                           0
        other:                           969781
        total:                           1939562
    transactions:                        969781 (16162.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 969781 (16162.93 per sec.)
    other operations:                    969781 (16162.93 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              969781
    total time taken by event execution: 239.0263
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.25ms
         max:                                  1.07ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           242445.2500/869.86
    execution time (avg/stddev):   59.7566/0.01

