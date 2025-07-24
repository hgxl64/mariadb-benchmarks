sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            170229
        write:                           0
        other:                           170229
        total:                           340458
    transactions:                        170229 (2837.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 170229 (2837.13 per sec.)
    other operations:                    170229 (2837.13 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              170229
    total time taken by event execution: 59.8627
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.35ms
         max:                                  0.74ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           170229.0000/0.00
    execution time (avg/stddev):   59.8627/0.00

