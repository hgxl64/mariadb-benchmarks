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
        read:                            486861
        write:                           0
        other:                           486861
        total:                           973722
    transactions:                        486861 (8114.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 486861 (8114.31 per sec.)
    other operations:                    486861 (8114.31 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              486861
    total time taken by event execution: 119.4540
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.25ms
         max:                                  0.64ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           243430.5000/730.50
    execution time (avg/stddev):   59.7270/0.02

