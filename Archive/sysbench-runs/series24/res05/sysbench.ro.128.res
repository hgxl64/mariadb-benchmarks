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
        read:                            2507812
        write:                           0
        other:                           2507812
        total:                           5015624
    transactions:                        2507812 (41793.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2507812 (41793.95 per sec.)
    other operations:                    2507812 (41793.95 per sec.)

Test execution summary:
    total time:                          60.0042s
    total number of events:              2507812
    total time taken by event execution: 7674.8444
    per-request statistics:
         min:                                  1.01ms
         avg:                                  3.06ms
         max:                                 29.41ms
         approx.  95 percentile:               6.47ms

Threads fairness:
    events (avg/stddev):           19592.2812/100.84
    execution time (avg/stddev):   59.9597/0.00

