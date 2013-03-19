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
        read:                            440852
        write:                           0
        other:                           440852
        total:                           881704
    transactions:                        440852 (7347.50 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 440852 (7347.50 per sec.)
    other operations:                    440852 (7347.50 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              440852
    total time taken by event execution: 119.5465
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.27ms
         max:                                  0.83ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           220426.0000/362.00
    execution time (avg/stddev):   59.7733/0.02

