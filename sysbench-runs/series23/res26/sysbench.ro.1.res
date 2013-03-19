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
        read:                            170390
        write:                           0
        other:                           170390
        total:                           340780
    transactions:                        170390 (2839.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 170390 (2839.82 per sec.)
    other operations:                    170390 (2839.82 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              170390
    total time taken by event execution: 59.8687
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.35ms
         max:                                  0.80ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           170390.0000/0.00
    execution time (avg/stddev):   59.8687/0.00

