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
        read:                            1198994
        write:                           0
        other:                           1198994
        total:                           2397988
    transactions:                        1198994 (19983.15 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1198994 (19983.15 per sec.)
    other operations:                    1198994 (19983.15 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1198994
    total time taken by event execution: 238.1434
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.20ms
         max:                                  1.42ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           299748.5000/58606.64
    execution time (avg/stddev):   59.5358/0.10

