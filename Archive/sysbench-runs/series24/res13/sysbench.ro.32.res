sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1345699
        write:                           0
        other:                           1345699
        total:                           2691398
    transactions:                        1345699 (22427.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1345699 (22427.91 per sec.)
    other operations:                    1345699 (22427.91 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1345699
    total time taken by event execution: 1917.8146
    per-request statistics:
         min:                                  0.80ms
         avg:                                  1.43ms
         max:                                  5.73ms
         approx.  95 percentile:               1.70ms

Threads fairness:
    events (avg/stddev):           42053.0938/41.25
    execution time (avg/stddev):   59.9317/0.00

