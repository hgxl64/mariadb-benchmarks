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
        read:                            1078295
        write:                           0
        other:                           1078295
        total:                           2156590
    transactions:                        1078295 (17971.45 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1078295 (17971.45 per sec.)
    other operations:                    1078295 (17971.45 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1078295
    total time taken by event execution: 478.0310
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.44ms
         max:                                 10.11ms
         approx.  95 percentile:               0.57ms

Threads fairness:
    events (avg/stddev):           134786.8750/5829.74
    execution time (avg/stddev):   59.7539/0.01

