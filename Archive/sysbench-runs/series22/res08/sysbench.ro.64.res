sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1108470
        write:                           0
        other:                           1108470
        total:                           2216940
    transactions:                        1108470 (18473.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1108470 (18473.51 per sec.)
    other operations:                    1108470 (18473.51 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1108470
    total time taken by event execution: 3837.8832
    per-request statistics:
         min:                                  2.12ms
         avg:                                  3.46ms
         max:                                  8.75ms
         approx.  95 percentile:               3.76ms

Threads fairness:
    events (avg/stddev):           17319.8438/6.68
    execution time (avg/stddev):   59.9669/0.00

