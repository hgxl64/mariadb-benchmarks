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
        read:                            1973477
        write:                           0
        other:                           1973477
        total:                           3946954
    transactions:                        1973477 (32891.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1973477 (32891.07 per sec.)
    other operations:                    1973477 (32891.07 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1973477
    total time taken by event execution: 477.0570
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  2.00ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           246684.6250/26471.32
    execution time (avg/stddev):   59.6321/0.04

