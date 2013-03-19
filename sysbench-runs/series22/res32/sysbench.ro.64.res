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
        read:                            1377088
        write:                           0
        other:                           1377088
        total:                           2754176
    transactions:                        1377088 (22950.89 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1377088 (22950.89 per sec.)
    other operations:                    1377088 (22950.89 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1377088
    total time taken by event execution: 3837.4944
    per-request statistics:
         min:                                  1.27ms
         avg:                                  2.79ms
         max:                                  8.92ms
         approx.  95 percentile:               3.35ms

Threads fairness:
    events (avg/stddev):           21517.0000/17.33
    execution time (avg/stddev):   59.9608/0.00

