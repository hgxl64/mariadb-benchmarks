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
        read:                            160574
        write:                           0
        other:                           160574
        total:                           321148
    transactions:                        160574 (2676.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 160574 (2676.22 per sec.)
    other operations:                    160574 (2676.22 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              160574
    total time taken by event execution: 59.8525
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.37ms
         max:                                  0.76ms
         approx.  95 percentile:               0.48ms

Threads fairness:
    events (avg/stddev):           160574.0000/0.00
    execution time (avg/stddev):   59.8525/0.00

