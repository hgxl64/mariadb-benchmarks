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
        read:                            1678704
        write:                           0
        other:                           1678704
        total:                           3357408
    transactions:                        1678704 (27977.72 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1678704 (27977.72 per sec.)
    other operations:                    1678704 (27977.72 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1678704
    total time taken by event execution: 3837.1859
    per-request statistics:
         min:                                  1.26ms
         avg:                                  2.29ms
         max:                                  5.54ms
         approx.  95 percentile:               2.73ms

Threads fairness:
    events (avg/stddev):           26229.7500/21.44
    execution time (avg/stddev):   59.9560/0.00

