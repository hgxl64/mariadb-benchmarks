sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1030383
        write:                           0
        other:                           1030383
        total:                           2060766
    transactions:                        1030383 (17169.38 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1030383 (17169.38 per sec.)
    other operations:                    1030383 (17169.38 per sec.)

Test execution summary:
    total time:                          60.0128s
    total number of events:              1030383
    total time taken by event execution: 15353.6170
    per-request statistics:
         min:                                  5.40ms
         avg:                                 14.90ms
         max:                                 92.36ms
         approx.  95 percentile:              22.60ms

Threads fairness:
    events (avg/stddev):           4024.9336/20.59
    execution time (avg/stddev):   59.9751/0.01

