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
        read:                            2207794
        write:                           0
        other:                           2207794
        total:                           4415588
    transactions:                        2207794 (36795.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2207794 (36795.92 per sec.)
    other operations:                    2207794 (36795.92 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              2207794
    total time taken by event execution: 1916.7640
    per-request statistics:
         min:                                  0.43ms
         avg:                                  0.87ms
         max:                                  9.67ms
         approx.  95 percentile:               1.03ms

Threads fairness:
    events (avg/stddev):           68993.5625/102.19
    execution time (avg/stddev):   59.8989/0.00

