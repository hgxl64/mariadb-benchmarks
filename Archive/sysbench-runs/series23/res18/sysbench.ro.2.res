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
        read:                            417671
        write:                           0
        other:                           417671
        total:                           835342
    transactions:                        417671 (6961.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 417671 (6961.15 per sec.)
    other operations:                    417671 (6961.15 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              417671
    total time taken by event execution: 119.6042
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.29ms
         max:                                  0.82ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           208835.5000/672.50
    execution time (avg/stddev):   59.8021/0.01

