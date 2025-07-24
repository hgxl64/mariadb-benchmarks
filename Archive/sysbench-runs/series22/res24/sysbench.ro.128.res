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
        read:                            1049288
        write:                           0
        other:                           1049288
        total:                           2098576
    transactions:                        1049288 (17486.23 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1049288 (17486.23 per sec.)
    other operations:                    1049288 (17486.23 per sec.)

Test execution summary:
    total time:                          60.0065s
    total number of events:              1049288
    total time taken by event execution: 7677.1294
    per-request statistics:
         min:                                  3.47ms
         avg:                                  7.32ms
         max:                                 15.20ms
         approx.  95 percentile:               7.73ms

Threads fairness:
    events (avg/stddev):           8197.5625/2.06
    execution time (avg/stddev):   59.9776/0.00

