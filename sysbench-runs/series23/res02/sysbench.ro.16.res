sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1992547
        write:                           0
        other:                           1992547
        total:                           3985094
    transactions:                        1992547 (33208.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1992547 (33208.83 per sec.)
    other operations:                    1992547 (33208.83 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1992547
    total time taken by event execution: 956.3059
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.48ms
         max:                                  2.42ms
         approx.  95 percentile:               0.74ms

Threads fairness:
    events (avg/stddev):           124534.1875/1685.45
    execution time (avg/stddev):   59.7691/0.01

