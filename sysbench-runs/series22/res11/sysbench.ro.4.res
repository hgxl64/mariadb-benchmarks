sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1005602
        write:                           0
        other:                           1005602
        total:                           2011204
    transactions:                        1005602 (16759.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1005602 (16759.96 per sec.)
    other operations:                    1005602 (16759.96 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1005602
    total time taken by event execution: 238.3371
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  1.12ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           251400.5000/48888.85
    execution time (avg/stddev):   59.5843/0.11

