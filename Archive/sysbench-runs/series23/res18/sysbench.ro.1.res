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
        read:                            162772
        write:                           0
        other:                           162772
        total:                           325544
    transactions:                        162772 (2712.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 162772 (2712.85 per sec.)
    other operations:                    162772 (2712.85 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              162772
    total time taken by event execution: 59.8310
    per-request statistics:
         min:                                  0.20ms
         avg:                                  0.37ms
         max:                                  1.57ms
         approx.  95 percentile:               0.45ms

Threads fairness:
    events (avg/stddev):           162772.0000/0.00
    execution time (avg/stddev):   59.8310/0.00

