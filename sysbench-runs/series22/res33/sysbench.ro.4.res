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
        read:                            948581
        write:                           0
        other:                           948581
        total:                           1897162
    transactions:                        948581 (15809.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 948581 (15809.61 per sec.)
    other operations:                    948581 (15809.61 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              948581
    total time taken by event execution: 238.6688
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.25ms
         max:                                  0.84ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           237145.2500/4213.72
    execution time (avg/stddev):   59.6672/0.02

