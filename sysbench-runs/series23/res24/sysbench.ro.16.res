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
        read:                            1074778
        write:                           0
        other:                           1074778
        total:                           2149556
    transactions:                        1074778 (17912.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1074778 (17912.73 per sec.)
    other operations:                    1074778 (17912.73 per sec.)

Test execution summary:
    total time:                          60.0008s
    total number of events:              1074778
    total time taken by event execution: 958.1914
    per-request statistics:
         min:                                  0.36ms
         avg:                                  0.89ms
         max:                                  6.06ms
         approx.  95 percentile:               1.06ms

Threads fairness:
    events (avg/stddev):           67173.6250/745.41
    execution time (avg/stddev):   59.8870/0.00

