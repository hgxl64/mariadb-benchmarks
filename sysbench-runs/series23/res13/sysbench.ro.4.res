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
        read:                            848513
        write:                           0
        other:                           848513
        total:                           1697026
    transactions:                        848513 (14141.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 848513 (14141.82 per sec.)
    other operations:                    848513 (14141.82 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              848513
    total time taken by event execution: 238.6192
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.28ms
         max:                                  1.11ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           212128.2500/3720.24
    execution time (avg/stddev):   59.6548/0.01

