sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1172954
        write:                           0
        other:                           1172954
        total:                           2345908
    transactions:                        1172954 (19549.16 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1172954 (19549.16 per sec.)
    other operations:                    1172954 (19549.16 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              1172954
    total time taken by event execution: 238.3156
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.20ms
         max:                                  1.52ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           293238.5000/35922.82
    execution time (avg/stddev):   59.5789/0.05

