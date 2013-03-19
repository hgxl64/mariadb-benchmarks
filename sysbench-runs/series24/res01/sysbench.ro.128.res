sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1674058
        write:                           0
        other:                           1674058
        total:                           3348116
    transactions:                        1674058 (27899.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1674058 (27899.38 per sec.)
    other operations:                    1674058 (27899.38 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1674058
    total time taken by event execution: 7676.1311
    per-request statistics:
         min:                                  1.50ms
         avg:                                  4.59ms
         max:                                 33.49ms
         approx.  95 percentile:               9.34ms

Threads fairness:
    events (avg/stddev):           13078.5781/65.50
    execution time (avg/stddev):   59.9698/0.00

