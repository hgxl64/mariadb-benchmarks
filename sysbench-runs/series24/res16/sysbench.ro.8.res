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
        read:                            1762858
        write:                           0
        other:                           1762858
        total:                           3525716
    transactions:                        1762858 (29380.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1762858 (29380.75 per sec.)
    other operations:                    1762858 (29380.75 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1762858
    total time taken by event execution: 477.4249
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.27ms
         max:                                  1.50ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           220357.2500/7712.57
    execution time (avg/stddev):   59.6781/0.02

