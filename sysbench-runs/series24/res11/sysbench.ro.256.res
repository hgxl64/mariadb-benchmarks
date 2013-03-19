sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1660475
        write:                           0
        other:                           1660475
        total:                           3320950
    transactions:                        1660475 (27671.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1660475 (27671.29 per sec.)
    other operations:                    1660475 (27671.29 per sec.)

Test execution summary:
    total time:                          60.0071s
    total number of events:              1660475
    total time taken by event execution: 15352.1432
    per-request statistics:
         min:                                  1.43ms
         avg:                                  9.25ms
         max:                                 95.03ms
         approx.  95 percentile:              22.81ms

Threads fairness:
    events (avg/stddev):           6486.2305/53.72
    execution time (avg/stddev):   59.9693/0.00

