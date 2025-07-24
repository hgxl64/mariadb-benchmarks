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
        read:                            998016
        write:                           0
        other:                           998016
        total:                           1996032
    transactions:                        998016 (16633.49 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 998016 (16633.49 per sec.)
    other operations:                    998016 (16633.49 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              998016
    total time taken by event execution: 238.5101
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  0.71ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           249504.0000/24800.83
    execution time (avg/stddev):   59.6275/0.04

