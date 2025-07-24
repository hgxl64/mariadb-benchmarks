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
        read:                            1535689
        write:                           0
        other:                           1535689
        total:                           3071378
    transactions:                        1535689 (25594.69 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1535689 (25594.69 per sec.)
    other operations:                    1535689 (25594.69 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1535689
    total time taken by event execution: 477.7623
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.31ms
         max:                                  1.68ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           191961.1250/7050.62
    execution time (avg/stddev):   59.7203/0.02

