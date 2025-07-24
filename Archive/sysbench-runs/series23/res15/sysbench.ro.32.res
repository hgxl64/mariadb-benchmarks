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
        read:                            2226351
        write:                           0
        other:                           2226351
        total:                           4452702
    transactions:                        2226351 (37105.21 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2226351 (37105.21 per sec.)
    other operations:                    2226351 (37105.21 per sec.)

Test execution summary:
    total time:                          60.0010s
    total number of events:              2226351
    total time taken by event execution: 1916.6844
    per-request statistics:
         min:                                  0.50ms
         avg:                                  0.86ms
         max:                                  2.90ms
         approx.  95 percentile:               1.03ms

Threads fairness:
    events (avg/stddev):           69573.4688/111.55
    execution time (avg/stddev):   59.8964/0.00

