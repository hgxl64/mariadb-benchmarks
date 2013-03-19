sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            184511
        write:                           0
        other:                           184511
        total:                           369022
    transactions:                        184511 (3075.17 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 184511 (3075.17 per sec.)
    other operations:                    184511 (3075.17 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              184511
    total time taken by event execution: 59.8432
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.32ms
         max:                                  0.68ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           184511.0000/0.00
    execution time (avg/stddev):   59.8432/0.00

