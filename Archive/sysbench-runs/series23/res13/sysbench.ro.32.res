sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1039656
        write:                           0
        other:                           1039656
        total:                           2079312
    transactions:                        1039656 (17327.33 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1039656 (17327.33 per sec.)
    other operations:                    1039656 (17327.33 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1039656
    total time taken by event execution: 1918.3293
    per-request statistics:
         min:                                  0.87ms
         avg:                                  1.85ms
         max:                                  4.96ms
         approx.  95 percentile:               2.20ms

Threads fairness:
    events (avg/stddev):           32489.2500/25.20
    execution time (avg/stddev):   59.9478/0.00

