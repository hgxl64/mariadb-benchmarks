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
        read:                            1281447
        write:                           0
        other:                           1281447
        total:                           2562894
    transactions:                        1281447 (21356.68 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1281447 (21356.68 per sec.)
    other operations:                    1281447 (21356.68 per sec.)

Test execution summary:
    total time:                          60.0022s
    total number of events:              1281447
    total time taken by event execution: 3837.6836
    per-request statistics:
         min:                                  1.72ms
         avg:                                  2.99ms
         max:                                 10.77ms
         approx.  95 percentile:               3.61ms

Threads fairness:
    events (avg/stddev):           20022.6094/17.50
    execution time (avg/stddev):   59.9638/0.00

