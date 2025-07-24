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
        read:                            1548377
        write:                           0
        other:                           1548377
        total:                           3096754
    transactions:                        1548377 (25804.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1548377 (25804.81 per sec.)
    other operations:                    1548377 (25804.81 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1548377
    total time taken by event execution: 7676.3827
    per-request statistics:
         min:                                  1.54ms
         avg:                                  4.96ms
         max:                                 35.32ms
         approx.  95 percentile:               9.84ms

Threads fairness:
    events (avg/stddev):           12096.6953/59.40
    execution time (avg/stddev):   59.9717/0.00

