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
        read:                            761739
        write:                           0
        other:                           761739
        total:                           1523478
    transactions:                        761739 (12695.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 761739 (12695.59 per sec.)
    other operations:                    761739 (12695.59 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              761739
    total time taken by event execution: 238.7147
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.31ms
         max:                                  2.45ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           190434.7500/1898.40
    execution time (avg/stddev):   59.6787/0.03

