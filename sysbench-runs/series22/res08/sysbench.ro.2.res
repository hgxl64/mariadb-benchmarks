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
        read:                            457603
        write:                           0
        other:                           457603
        total:                           915206
    transactions:                        457603 (7626.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 457603 (7626.68 per sec.)
    other operations:                    457603 (7626.68 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              457603
    total time taken by event execution: 119.6505
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.26ms
         max:                                  0.89ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           228801.5000/217.50
    execution time (avg/stddev):   59.8253/0.00

