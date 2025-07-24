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
        read:                            1048109
        write:                           0
        other:                           1048109
        total:                           2096218
    transactions:                        1048109 (17468.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1048109 (17468.20 per sec.)
    other operations:                    1048109 (17468.20 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              1048109
    total time taken by event execution: 958.2533
    per-request statistics:
         min:                                  0.53ms
         avg:                                  0.91ms
         max:                                 16.20ms
         approx.  95 percentile:               1.08ms

Threads fairness:
    events (avg/stddev):           65506.8125/597.85
    execution time (avg/stddev):   59.8908/0.00

