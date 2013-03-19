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
        read:                            1042827
        write:                           0
        other:                           1042827
        total:                           2085654
    transactions:                        1042827 (17376.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1042827 (17376.77 per sec.)
    other operations:                    1042827 (17376.77 per sec.)

Test execution summary:
    total time:                          60.0127s
    total number of events:              1042827
    total time taken by event execution: 15353.5725
    per-request statistics:
         min:                                  6.54ms
         avg:                                 14.72ms
         max:                                 78.85ms
         approx.  95 percentile:              22.29ms

Threads fairness:
    events (avg/stddev):           4073.5430/27.34
    execution time (avg/stddev):   59.9749/0.00

