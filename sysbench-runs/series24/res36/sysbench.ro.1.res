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
        read:                            178676
        write:                           0
        other:                           178676
        total:                           357352
    transactions:                        178676 (2977.92 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 178676 (2977.92 per sec.)
    other operations:                    178676 (2977.92 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              178676
    total time taken by event execution: 59.8715
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.34ms
         max:                                  0.89ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           178676.0000/0.00
    execution time (avg/stddev):   59.8715/0.00

