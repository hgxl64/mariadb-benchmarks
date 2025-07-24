sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1949039
        write:                           0
        other:                           1949039
        total:                           3898078
    transactions:                        1949039 (32483.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1949039 (32483.11 per sec.)
    other operations:                    1949039 (32483.11 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1949039
    total time taken by event execution: 3836.7044
    per-request statistics:
         min:                                  1.29ms
         avg:                                  1.97ms
         max:                                 19.01ms
         approx.  95 percentile:               2.35ms

Threads fairness:
    events (avg/stddev):           30453.7344/24.35
    execution time (avg/stddev):   59.9485/0.00

