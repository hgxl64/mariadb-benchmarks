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
        read:                            1060508
        write:                           0
        other:                           1060508
        total:                           2121016
    transactions:                        1060508 (17674.66 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1060508 (17674.66 per sec.)
    other operations:                    1060508 (17674.66 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1060508
    total time taken by event execution: 1918.1913
    per-request statistics:
         min:                                  1.34ms
         avg:                                  1.81ms
         max:                                  3.86ms
         approx.  95 percentile:               2.03ms

Threads fairness:
    events (avg/stddev):           33140.8750/20.65
    execution time (avg/stddev):   59.9435/0.00

