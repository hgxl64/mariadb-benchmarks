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
        read:                            1418532
        write:                           0
        other:                           1418532
        total:                           2837064
    transactions:                        1418532 (23641.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1418532 (23641.62 per sec.)
    other operations:                    1418532 (23641.62 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1418532
    total time taken by event execution: 3837.4661
    per-request statistics:
         min:                                  1.40ms
         avg:                                  2.71ms
         max:                                  9.11ms
         approx.  95 percentile:               3.26ms

Threads fairness:
    events (avg/stddev):           22164.5625/24.20
    execution time (avg/stddev):   59.9604/0.00

