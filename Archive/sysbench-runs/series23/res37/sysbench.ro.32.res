sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 32

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 31 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1621561
        write:                           0
        other:                           1621561
        total:                           3243122
    transactions:                        1621561 (27025.54 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1621561 (27025.54 per sec.)
    other operations:                    1621561 (27025.54 per sec.)

Test execution summary:
    total time:                          60.0011s
    total number of events:              1621561
    total time taken by event execution: 1917.4994
    per-request statistics:
         min:                                  0.71ms
         avg:                                  1.18ms
         max:                                 11.74ms
         approx.  95 percentile:               1.39ms

Threads fairness:
    events (avg/stddev):           50673.7812/27.73
    execution time (avg/stddev):   59.9219/0.00

