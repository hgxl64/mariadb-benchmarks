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
        read:                            1724543
        write:                           0
        other:                           1724543
        total:                           3449086
    transactions:                        1724543 (28742.22 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1724543 (28742.22 per sec.)
    other operations:                    1724543 (28742.22 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              1724543
    total time taken by event execution: 477.5082
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.28ms
         max:                                 15.85ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           215567.8750/6789.53
    execution time (avg/stddev):   59.6885/0.02

