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
        read:                            197488
        write:                           0
        other:                           197488
        total:                           394976
    transactions:                        197488 (3291.45 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 197488 (3291.45 per sec.)
    other operations:                    197488 (3291.45 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              197488
    total time taken by event execution: 59.8197
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.30ms
         max:                                  0.73ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           197488.0000/0.00
    execution time (avg/stddev):   59.8197/0.00

