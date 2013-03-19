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
        read:                            861633
        write:                           0
        other:                           861633
        total:                           1723266
    transactions:                        861633 (14360.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 861633 (14360.49 per sec.)
    other operations:                    861633 (14360.49 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              861633
    total time taken by event execution: 238.6032
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.28ms
         max:                                  1.20ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           215408.2500/23444.06
    execution time (avg/stddev):   59.6508/0.04

