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
        read:                            1132068
        write:                           0
        other:                           1132068
        total:                           2264136
    transactions:                        1132068 (18867.36 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1132068 (18867.36 per sec.)
    other operations:                    1132068 (18867.36 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1132068
    total time taken by event execution: 1918.0381
    per-request statistics:
         min:                                  0.58ms
         avg:                                  1.69ms
         max:                                  3.25ms
         approx.  95 percentile:               1.89ms

Threads fairness:
    events (avg/stddev):           35377.1250/27.18
    execution time (avg/stddev):   59.9387/0.00

