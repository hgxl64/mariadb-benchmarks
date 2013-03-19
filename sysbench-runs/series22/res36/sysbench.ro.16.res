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
        read:                            2027539
        write:                           0
        other:                           2027539
        total:                           4055078
    transactions:                        2027539 (33792.08 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2027539 (33792.08 per sec.)
    other operations:                    2027539 (33792.08 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              2027539
    total time taken by event execution: 956.8289
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.47ms
         max:                                 16.33ms
         approx.  95 percentile:               0.61ms

Threads fairness:
    events (avg/stddev):           126721.1875/1267.64
    execution time (avg/stddev):   59.8018/0.01

