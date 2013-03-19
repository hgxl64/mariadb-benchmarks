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
        read:                            433814
        write:                           0
        other:                           433814
        total:                           867628
    transactions:                        433814 (7230.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 433814 (7230.21 per sec.)
    other operations:                    433814 (7230.21 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              433814
    total time taken by event execution: 119.6578
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.28ms
         max:                                  0.68ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           216907.0000/3207.00
    execution time (avg/stddev):   59.8289/0.01

