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
        read:                            1332088
        write:                           0
        other:                           1332088
        total:                           2664176
    transactions:                        1332088 (22200.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1332088 (22200.13 per sec.)
    other operations:                    1332088 (22200.13 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              1332088
    total time taken by event execution: 7676.4053
    per-request statistics:
         min:                                  1.68ms
         avg:                                  5.76ms
         max:                                 36.34ms
         approx.  95 percentile:              10.03ms

Threads fairness:
    events (avg/stddev):           10406.9375/54.90
    execution time (avg/stddev):   59.9719/0.00

