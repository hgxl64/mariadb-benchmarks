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
        read:                            2565559
        write:                           0
        other:                           2565559
        total:                           5131118
    transactions:                        2565559 (42758.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2565559 (42758.70 per sec.)
    other operations:                    2565559 (42758.70 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              2565559
    total time taken by event execution: 1916.0717
    per-request statistics:
         min:                                  0.39ms
         avg:                                  0.75ms
         max:                                 15.59ms
         approx.  95 percentile:               0.92ms

Threads fairness:
    events (avg/stddev):           80173.7188/124.25
    execution time (avg/stddev):   59.8772/0.00

