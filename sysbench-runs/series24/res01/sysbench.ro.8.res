sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2001738
        write:                           0
        other:                           2001738
        total:                           4003476
    transactions:                        2001738 (33362.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2001738 (33362.14 per sec.)
    other operations:                    2001738 (33362.14 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              2001738
    total time taken by event execution: 476.7092
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  1.34ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           250217.2500/45059.04
    execution time (avg/stddev):   59.5887/0.09

