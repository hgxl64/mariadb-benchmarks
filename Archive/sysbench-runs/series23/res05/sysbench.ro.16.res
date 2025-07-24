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
        read:                            2651320
        write:                           0
        other:                           2651320
        total:                           5302640
    transactions:                        2651320 (44188.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2651320 (44188.30 per sec.)
    other operations:                    2651320 (44188.30 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              2651320
    total time taken by event execution: 955.5543
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.36ms
         max:                                  5.27ms
         approx.  95 percentile:               0.50ms

Threads fairness:
    events (avg/stddev):           165707.5000/10005.95
    execution time (avg/stddev):   59.7221/0.02

