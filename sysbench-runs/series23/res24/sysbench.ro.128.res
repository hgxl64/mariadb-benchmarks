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
        read:                            1071929
        write:                           0
        other:                           1071929
        total:                           2143858
    transactions:                        1071929 (17863.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1071929 (17863.59 per sec.)
    other operations:                    1071929 (17863.59 per sec.)

Test execution summary:
    total time:                          60.0064s
    total number of events:              1071929
    total time taken by event execution: 7677.1538
    per-request statistics:
         min:                                  5.49ms
         avg:                                  7.16ms
         max:                                 20.42ms
         approx.  95 percentile:               7.58ms

Threads fairness:
    events (avg/stddev):           8374.4453/2.60
    execution time (avg/stddev):   59.9778/0.00

