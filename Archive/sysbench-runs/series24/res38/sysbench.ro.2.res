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
        read:                            412665
        write:                           0
        other:                           412665
        total:                           825330
    transactions:                        412665 (6877.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 412665 (6877.72 per sec.)
    other operations:                    412665 (6877.72 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              412665
    total time taken by event execution: 119.5226
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.29ms
         max:                                  1.55ms
         approx.  95 percentile:               0.35ms

Threads fairness:
    events (avg/stddev):           206332.5000/287.50
    execution time (avg/stddev):   59.7613/0.00

