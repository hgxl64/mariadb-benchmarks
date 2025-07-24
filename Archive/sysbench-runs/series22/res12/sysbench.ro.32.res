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
        read:                            1443658
        write:                           0
        other:                           1443658
        total:                           2887316
    transactions:                        1443658 (24060.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1443658 (24060.62 per sec.)
    other operations:                    1443658 (24060.62 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1443658
    total time taken by event execution: 1917.6557
    per-request statistics:
         min:                                  0.72ms
         avg:                                  1.33ms
         max:                                  3.09ms
         approx.  95 percentile:               1.58ms

Threads fairness:
    events (avg/stddev):           45114.3125/70.37
    execution time (avg/stddev):   59.9267/0.00

