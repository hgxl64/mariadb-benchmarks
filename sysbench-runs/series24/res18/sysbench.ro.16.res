sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1012798
        write:                           0
        other:                           1012798
        total:                           2025596
    transactions:                        1012798 (16879.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1012798 (16879.70 per sec.)
    other operations:                    1012798 (16879.70 per sec.)

Test execution summary:
    total time:                          60.0009s
    total number of events:              1012798
    total time taken by event execution: 958.2376
    per-request statistics:
         min:                                  0.54ms
         avg:                                  0.95ms
         max:                                  2.15ms
         approx.  95 percentile:               1.11ms

Threads fairness:
    events (avg/stddev):           63299.8750/577.96
    execution time (avg/stddev):   59.8899/0.01

