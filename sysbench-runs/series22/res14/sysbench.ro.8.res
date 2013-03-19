sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1170892
        write:                           0
        other:                           1170892
        total:                           2341784
    transactions:                        1170892 (19514.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1170892 (19514.72 per sec.)
    other operations:                    1170892 (19514.72 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1170892
    total time taken by event execution: 478.3602
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.41ms
         max:                                  1.33ms
         approx.  95 percentile:               0.53ms

Threads fairness:
    events (avg/stddev):           146361.5000/1536.23
    execution time (avg/stddev):   59.7950/0.01

