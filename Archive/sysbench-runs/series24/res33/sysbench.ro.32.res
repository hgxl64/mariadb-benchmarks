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
        read:                            1342311
        write:                           0
        other:                           1342311
        total:                           2684622
    transactions:                        1342311 (22371.48 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1342311 (22371.48 per sec.)
    other operations:                    1342311 (22371.48 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1342311
    total time taken by event execution: 1917.7994
    per-request statistics:
         min:                                  0.80ms
         avg:                                  1.43ms
         max:                                  5.08ms
         approx.  95 percentile:               1.70ms

Threads fairness:
    events (avg/stddev):           41947.2188/33.37
    execution time (avg/stddev):   59.9312/0.00

