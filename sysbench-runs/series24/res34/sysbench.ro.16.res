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
        read:                            1080942
        write:                           0
        other:                           1080942
        total:                           2161884
    transactions:                        1080942 (18015.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1080942 (18015.47 per sec.)
    other operations:                    1080942 (18015.47 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1080942
    total time taken by event execution: 958.1763
    per-request statistics:
         min:                                  0.52ms
         avg:                                  0.89ms
         max:                                  7.21ms
         approx.  95 percentile:               1.04ms

Threads fairness:
    events (avg/stddev):           67558.8750/559.43
    execution time (avg/stddev):   59.8860/0.00

