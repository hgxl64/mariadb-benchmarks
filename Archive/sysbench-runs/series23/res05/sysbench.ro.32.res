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
        read:                            2251188
        write:                           0
        other:                           2251188
        total:                           4502376
    transactions:                        2251188 (37519.35 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2251188 (37519.35 per sec.)
    other operations:                    2251188 (37519.35 per sec.)

Test execution summary:
    total time:                          60.0007s
    total number of events:              2251188
    total time taken by event execution: 1916.2315
    per-request statistics:
         min:                                  0.48ms
         avg:                                  0.85ms
         max:                                  3.73ms
         approx.  95 percentile:               1.01ms

Threads fairness:
    events (avg/stddev):           70349.6250/423.65
    execution time (avg/stddev):   59.8822/0.00

