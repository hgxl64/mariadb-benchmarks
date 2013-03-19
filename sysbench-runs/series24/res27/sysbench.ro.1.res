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
        read:                            171006
        write:                           0
        other:                           171006
        total:                           342012
    transactions:                        171006 (2850.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 171006 (2850.09 per sec.)
    other operations:                    171006 (2850.09 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              171006
    total time taken by event execution: 59.8445
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.35ms
         max:                                  0.84ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           171006.0000/0.00
    execution time (avg/stddev):   59.8445/0.00

