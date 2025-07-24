sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2041897
        write:                           0
        other:                           2041897
        total:                           4083794
    transactions:                        2041897 (34031.30 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2041897 (34031.30 per sec.)
    other operations:                    2041897 (34031.30 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              2041897
    total time taken by event execution: 956.9691
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.47ms
         max:                                 16.61ms
         approx.  95 percentile:               0.62ms

Threads fairness:
    events (avg/stddev):           127618.5625/2639.39
    execution time (avg/stddev):   59.8106/0.01

