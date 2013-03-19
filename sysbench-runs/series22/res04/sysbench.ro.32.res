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
        read:                            1141095
        write:                           0
        other:                           1141095
        total:                           2282190
    transactions:                        1141095 (19017.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1141095 (19017.81 per sec.)
    other operations:                    1141095 (19017.81 per sec.)

Test execution summary:
    total time:                          60.0014s
    total number of events:              1141095
    total time taken by event execution: 1917.9900
    per-request statistics:
         min:                                  1.14ms
         avg:                                  1.68ms
         max:                                  4.06ms
         approx.  95 percentile:               1.87ms

Threads fairness:
    events (avg/stddev):           35659.2188/33.92
    execution time (avg/stddev):   59.9372/0.00

