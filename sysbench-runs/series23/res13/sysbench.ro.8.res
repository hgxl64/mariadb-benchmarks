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
        read:                            1083675
        write:                           0
        other:                           1083675
        total:                           2167350
    transactions:                        1083675 (18061.16 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1083675 (18061.16 per sec.)
    other operations:                    1083675 (18061.16 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1083675
    total time taken by event execution: 478.1375
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.44ms
         max:                                  1.51ms
         approx.  95 percentile:               0.63ms

Threads fairness:
    events (avg/stddev):           135459.3750/7752.72
    execution time (avg/stddev):   59.7672/0.01

