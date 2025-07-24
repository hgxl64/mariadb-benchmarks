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
        read:                            391864
        write:                           0
        other:                           391864
        total:                           783728
    transactions:                        391864 (6531.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 391864 (6531.04 per sec.)
    other operations:                    391864 (6531.04 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              391864
    total time taken by event execution: 119.4457
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.30ms
         max:                                  0.77ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           195932.0000/844.00
    execution time (avg/stddev):   59.7228/0.01

