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
        read:                            1345535
        write:                           0
        other:                           1345535
        total:                           2691070
    transactions:                        1345535 (22425.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1345535 (22425.22 per sec.)
    other operations:                    1345535 (22425.22 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1345535
    total time taken by event execution: 1917.8271
    per-request statistics:
         min:                                  0.82ms
         avg:                                  1.43ms
         max:                                  4.57ms
         approx.  95 percentile:               1.68ms

Threads fairness:
    events (avg/stddev):           42047.9688/56.99
    execution time (avg/stddev):   59.9321/0.00

