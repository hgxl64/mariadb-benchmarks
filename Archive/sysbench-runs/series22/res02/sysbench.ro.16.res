sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2251772
        write:                           0
        other:                           2251772
        total:                           4503544
    transactions:                        2251772 (37529.32 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2251772 (37529.32 per sec.)
    other operations:                    2251772 (37529.32 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              2251772
    total time taken by event execution: 956.5099
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.42ms
         max:                                  2.32ms
         approx.  95 percentile:               0.67ms

Threads fairness:
    events (avg/stddev):           140735.7500/7265.55
    execution time (avg/stddev):   59.7819/0.01

