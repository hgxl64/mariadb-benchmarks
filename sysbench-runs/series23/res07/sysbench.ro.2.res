sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            586722
        write:                           0
        other:                           586722
        total:                           1173444
    transactions:                        586722 (9778.66 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 586722 (9778.66 per sec.)
    other operations:                    586722 (9778.66 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              586722
    total time taken by event execution: 119.1212
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.20ms
         max:                                  0.64ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           293361.0000/46450.00
    execution time (avg/stddev):   59.5606/0.02

