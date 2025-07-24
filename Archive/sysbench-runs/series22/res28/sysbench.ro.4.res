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
        read:                            769606
        write:                           0
        other:                           769606
        total:                           1539212
    transactions:                        769606 (12826.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 769606 (12826.70 per sec.)
    other operations:                    769606 (12826.70 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              769606
    total time taken by event execution: 238.6450
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.31ms
         max:                                 15.08ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           192401.5000/10451.58
    execution time (avg/stddev):   59.6612/0.02

